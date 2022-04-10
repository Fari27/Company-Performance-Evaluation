using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;

using System.IO;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net.Mail;
using System.Net;


public partial class Common_Default : System.Web.UI.Page
{
    Connection cn = new Connection();
     protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.cmd = new MySqlCommand("select count(*) from  login where usernsme=@usernsme ", cn.connect());
        cn.cmd.Parameters.AddWithValue("@usernsme", txtemail.Text);

        int count = Convert.ToInt32(cn.cmd.ExecuteScalar().ToString());
        if (count == 0)
        {






             string agreepath = Server.MapPath("~/agreement/");
                // cn.cmd = new SqlCommand("select email from registration ", cn.connect());
                string agreename = txtemail.Text;
                //cn.cmd.ExecuteScalar().ToString();
                string ext1 = Path.GetExtension(FileUpload2.FileName);
                FileUpload2.SaveAs(agreepath + agreename + ext1);





            cn.cmd = new MySqlCommand("insert into registration (name,address,place,email,phone,status,agreement) values(@name,@address,@place,@email,@phoneno,'New',@agreement)", cn.connect());

            cn.cmd.Parameters.AddWithValue("@name", txtname.Text);
            cn.cmd.Parameters.AddWithValue("@address", txtadd.Text);
            cn.cmd.Parameters.AddWithValue("@place", txtplace.Text);
            cn.cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cn.cmd.Parameters.AddWithValue("@phoneno", txtphone.Text);
            
            cn.cmd.Parameters.AddWithValue("@agreement","/agreement/"+agreename+ext1);
            int i = cn.cmd.ExecuteNonQuery();
            if (i > 0)

            {
                string imgpath = Server.MapPath("~/images/");
                // cn.cmd = new SqlCommand("select email from registration ", cn.connect());
                string imgname = txtemail.Text;
                //cn.cmd.ExecuteScalar().ToString();
                string ext = Path.GetExtension(FileUpload1.FileName);
                FileUpload1.SaveAs(imgpath + imgname + ext);


                string enpass = txtpass.Text;


                cn.cmd = new MySqlCommand("insert into login (usernsme,password,type,status,verifycode,photo) values(@usernsme,@password,'client','pending','0',@photo)", cn.connect());
                cn.cmd.Parameters.AddWithValue("@usernsme", txtemail.Text);
                cn.cmd.Parameters.AddWithValue("@password", enpass);
                cn.cmd.Parameters.AddWithValue("@photo", "../images/" + imgname + ext);
                int j = cn.cmd.ExecuteNonQuery();

                if (j > 0)
                {
                    MailMessage MyMailMessage = new MailMessage();

                    MyMailMessage.From = new MailAddress("siyanotificatification@gmail.com");


                    MyMailMessage.To.Add("siyaconstruction2021@gmail.com");

                    MyMailMessage.Subject = "New Client";

                    MyMailMessage.Body = "New client account for verification.please login and check";

                    MyMailMessage.IsBodyHtml = true;

                    SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                    SMTPServer.Port = 587;

                    SMTPServer.Credentials = new System.Net.NetworkCredential("siyanotificatification@gmail.com", "siya@2021");

                    SMTPServer.EnableSsl = true;

                    try
                    {

                        SMTPServer.Send(MyMailMessage);
                        string msg = "Hi , you are registered please login";
                        //SendSMS(txtphone.Text, msg);


                        Response.Redirect("~/Common/login.aspx?id=R");

                    }

                    catch (Exception ex)
                    {

                        //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                        Response.Redirect("~/Common/login.aspx?id=R");




                    }



                    
                    
                    
                    
                    
                    
                    Response.Redirect("~/Common/login.aspx?id=R");
                }
                else
                {
                    Response.Redirect("~/Common/login.aspx?id=w");
                }


            }

        }
        else
        {
            Response.Write("<script>alert('Email id Already Registered')</script>");
        }
    }


    
}
