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


public partial class Client_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string u = Session["user"].ToString();

        c.cmd = new MySqlCommand("insert into complaint (uid,date,subject,complaint,reply,replydate,status) values(@user,'" + DateTime.Now + "',@sub,@complaint,'Not replied','Not replied','Not replied')", c.connect());
        c.cmd.Parameters.AddWithValue("@user", u);
        c.cmd.Parameters.AddWithValue("@sub", txtsub.Text);
        c.cmd.Parameters.AddWithValue("@complaint", txtfeed.Text);
        int j = c.cmd.ExecuteNonQuery();
        if (j > 0)
        {




            MailMessage MyMailMessage = new MailMessage();

            MyMailMessage.From = new MailAddress("siyanotificatification@gmail.com");


            MyMailMessage.To.Add("siyaconstruction2021@gmail.com");

            MyMailMessage.Subject = "New complaint";

            MyMailMessage.Body = "New complaint from client.please login and check";

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


               

            }

            catch (Exception ex)
            {

                //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            Response.Redirect("~/Client/complaint.aspx?id=S");
            //Response.Write("<script>alert('complaint sent')</script>");
        }
        else
        {
            Response.Redirect("~/Client/complaint.aspx?id=E");
        }


    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}