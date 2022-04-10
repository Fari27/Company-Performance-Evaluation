using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using MySql.Data.MySqlClient;

using System.Net.Mail;

public partial class Common_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    public MySqlDataReader dr,dr1;
    public string uname, pwd, type;

     protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        

            c.cmd = new MySqlCommand("select usernsme,password from login where status='approved' and usernsme=@username", c.connect());

            c.cmd.Parameters.AddWithValue("@username", txtusername.Text);
            // c.cmd.Parameters.AddWithValue("@password", txt_password.Text);
            dr1 = c.cmd.ExecuteReader();
            if (dr1.Read())
            {
                uname = dr1[0].ToString();
                pwd = dr1[1].ToString();

                //decrypt password
               

                 
                    if (uname == txtusername.Text && pwd==txtpassword.Text)
                    {   c.cmd = new MySqlCommand("Select * from login where usernsme=@username and status='approved'", c.connect());

                    c.cmd.Parameters.AddWithValue("@username", txtusername.Text);
                      //c.cmd.Parameters.AddWithValue("@password", );
           
                    dr = c.cmd.ExecuteReader();
                    if (dr.Read())  
                    {
                        Session["user"] = dr[1].ToString();
                        Session["pass"] = dr[2].ToString();
                        String type = dr[3].ToString();
                        if (type == "admin")
                        {  
                            Response.Redirect("~/Admin/home.aspx");
                        }
                        if (type == "client")
                        {
                            Response.Redirect("~/Client/home.aspx");
                        }
                        if (type == "Unit Manager")
                        {


                            c.cmd = new MySqlCommand("select did from staffregisters where email=@username", c.connect());
                            c.cmd.Parameters.AddWithValue("@username", txtusername.Text);
                            string did = c.cmd.ExecuteScalar().ToString();
                            Session["did"] = did;





                                Response.Redirect("~/Employee/home.aspx");
                         }
                        if (type == "Project Manager")
                        {
                           
                                
                            Response.Redirect("~/Manager/home.aspx");

                         }
                        
                    }
                    }
                    else
                    {
                        Response.Write("<script>alert('User name or password incorrect')</script>");
                    }



                }
              



            }
        
    

    protected void txtpassword_TextChanged(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/clientregistration.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/carrier.aspx");

    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/applicants.aspx");
    }
   
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {

      
        Random r = new Random();
        string vc = r.Next().ToString();

        c.cmd = new MySqlCommand("select Count(*) from login where usernsme=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", txtusername.Text);
        int count = Convert.ToInt32(c.cmd.ExecuteScalar().ToString());
        if (count == 0)
        {
            Response.Write("<script>alert('Invalid username')</script>");

        }

        else
        {

            //update verify code in login 

            c.cmd = new MySqlCommand("update login set verifycode=@code where usernsme=@username", c.connect());
            c.cmd.Parameters.AddWithValue("@code", vc);
            c.cmd.Parameters.AddWithValue("@username", txtusername.Text);
            c.cmd.ExecuteNonQuery();



            #region Mail
            MailMessage MyMailMessage = new MailMessage();

            MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


            MyMailMessage.To.Add(txtusername.Text);

            MyMailMessage.Subject = "Password Recover Code";

            MyMailMessage.Body = "Your Password Recovery Code is" + vc;

            MyMailMessage.IsBodyHtml = true;

            SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

            SMTPServer.Port = 587;

            SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstruction2021@gmail.com", "siya.2021");

            SMTPServer.EnableSsl = true;

            try
            {

                SMTPServer.Send(MyMailMessage);
                Response.Write("<script language=\"javascript\">alert(\"Check verification code in your email id\");</script>");
                //Response.Redirect("Thankyou.aspx");

            }

            catch (Exception ex)
            {

                //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                Response.Write("<script language=\"javascript\">alert(\"Message has not sent \");</script>");

            }
            #endregion



            Panel1.Visible = true;

        }
    }

    protected void txtpassword_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string enpass =txtnew.Text;

        //c.cmd = new SqlCommand("update tb_login set password=@password where user_id=@uid", c.connect());
        //c.cmd.Parameters.AddWithValue("@uid", TextBox4.Text);
        //c.cmd.Parameters.AddWithValue("@password", enpass);
        //int r = c.cmd.ExecuteNonQuery();





        c.cmd = new MySqlCommand("update login set password=@p where usernsme=@username and verifycode=@code", c.connect());
        c.cmd.Parameters.AddWithValue("@p", enpass);
        c.cmd.Parameters.AddWithValue("@username", txtusername.Text);
        c.cmd.Parameters.AddWithValue("@code", txtrvcode.Text);
        int r = Convert.ToInt32(c.cmd.ExecuteNonQuery());

        if (r > 0)
        {

            Response.Redirect("~/Common/login.aspx?id=S");
        }
        else
        {

            Response.Write("<script>alert('Please check the all values entered')</script>");
        }


    }


}

