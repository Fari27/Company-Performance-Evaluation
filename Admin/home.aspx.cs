using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net.Mail;
using System.Net;



public partial class Admin_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    MySqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {


        string s = Session["user"].ToString();
        c.cmd = new MySqlCommand("select photo from login where usernsme=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        string p = c.cmd.ExecuteScalar().ToString();

        Label1.Text = "admin";
        Image1.ImageUrl = p;

        c.cmd = new MySqlCommand("select count(status) from complaint where status='Not replied'", c.connect());

        dr = c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int n1 = Convert.ToInt16(dr[0].ToString());
            if (n1 > 0)
            {



                LinkButton1.Visible = true;
            }
        }
              c.cmd = new MySqlCommand("select count(status) from registration where status='New'", c.connect());

        dr = c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int n2 = Convert.ToInt16(dr[0].ToString());
            if (n2 > 0)
            {



                LinkButton3.Visible = true;
            }

        }
              c.cmd = new MySqlCommand("select count(status) from work_request where status='New'", c.connect());

        dr = c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int n4 = Convert.ToInt16(dr[0].ToString());
            if (n4 > 0)
            {



                LinkButton4.Visible = true;
            }


        }

        c.cmd = new MySqlCommand("select count(status) from work_request where status='Accepted'", c.connect());

        dr = c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int n5 = Convert.ToInt16(dr[0].ToString());
            if (n5> 0)
            {



                LinkButton5.Visible = true;
            }


        }




            c.cmd = new MySqlCommand("select count(status) from feedback where status='New'", c.connect());

            dr = c.cmd.ExecuteReader();
            if (dr.Read())
            {
                int n3 = Convert.ToInt16(dr[0].ToString());
                if (n3 > 0)
                {



                    LinkButton2.Visible = true;
                }



            }



        }
   
    



   
    


    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {

    int row = Convert.ToInt32(e.CommandArgument);
    string username = GridView1.Rows[row].Cells[4].Text;

    string stats = GridView1.Rows[row].Cells[6].Text;

    if (stats == "Approved")
    {


        Response.Write("<script>alert('Already approved')</script>");
    }
        
    
    else if(stats=="Rejected")
          {

              Response.Write("<script>alert('Already rejected')</script>");
    }
    else{

    if (e.CommandName == "apr")
    {
        c.cmd = new MySqlCommand("update login set status='Approved' where usernsme = @username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", username);
        int i = c.cmd.ExecuteNonQuery();
        if (i > 0)
        {
            c.cmd = new MySqlCommand("update registration set status='Approved' where email = @username", c.connect());
            c.cmd.Parameters.AddWithValue("@username", username);
            int j = c.cmd.ExecuteNonQuery();


            {


                MailMessage MyMailMessage = new MailMessage();

                MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                MyMailMessage.To.Add(username);

                MyMailMessage.Subject = "Permision granted";

                MyMailMessage.Body = "Your account details verified and permission granted.Please login and submit your work requirements .Your username:  "+username;

                MyMailMessage.IsBodyHtml = true;

                SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                SMTPServer.Port = 587;

                SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstruction2021@gmail.com", "siya.2021");

                SMTPServer.EnableSsl = true;

                try
                {

                    SMTPServer.Send(MyMailMessage);
                    string msg = "Hi , you are registered please login";
                    //SendSMS(txtphone.Text, msg);


                    Response.Redirect("~/Admin/home.aspx?id=S");

                }

                catch (Exception ex)
                {

                    //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                    Response.Redirect("~/Admin/home.aspx?id=S");




                }





                GridView1.DataBind();
            }
        }
            else
            {

             




                Response.Redirect("~/Admin/home.aspx?id=E");
            }


    }
    if (e.CommandName == "rej")
    {
        c.cmd = new MySqlCommand("update login set status='Rejected' where usernsme = @username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", username);
        int i = c.cmd.ExecuteNonQuery();
       

            if (i > 0)
            {
                c.cmd = new MySqlCommand("update registration set status='Rejected' where email = @username", c.connect());
                c.cmd.Parameters.AddWithValue("@username", username);
                int j = c.cmd.ExecuteNonQuery();
                if (j > 0)
                {




                    MailMessage MyMailMessage = new MailMessage();

                    MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                    MyMailMessage.To.Add(username);

                    MyMailMessage.Subject = "Permision rejected";

                    MyMailMessage.Body = "Your account details verified and permission  rejected.";

                    MyMailMessage.IsBodyHtml = true;

                    SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                    SMTPServer.Port = 587;

                    SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstructiom2021@gmail.com", "siya.2021");

                    SMTPServer.EnableSsl = true;

                    try
                    {

                        SMTPServer.Send(MyMailMessage);
                        string msg = "Hi , you are registered please login";
                        //SendSMS(txtphone.Text, msg);


                        Response.Redirect("~/Admin/home.aspx?id=S");

                    }

                    catch (Exception ex)
                    {

                        //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                        Response.Redirect("~/Admin/home.aspx?id=S");




                    }


     
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    Response.Redirect("~/Admin/home.aspx?ids=T");

                    GridView1.DataBind();
                }
                else
                {
                    Response.Redirect("~/Admin/home.aspx?ids=F");
                }
            }


    }

}

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        c.cmd = new MySqlCommand("update complaint set status='got' where status='Not replied'", c.connect());


        int i = c.cmd.ExecuteNonQuery();
        {

            Response.Redirect("~/Admin/Complaints.aspx");
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {


        c.cmd = new MySqlCommand("update feedback set status='Viewed' where status='New'", c.connect());


        int i = c.cmd.ExecuteNonQuery();
        {

            Response.Redirect("~/Admin/feedback.aspx");
        }
   



    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {



    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {

    }
}