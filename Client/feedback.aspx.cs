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
       
        c.cmd = new MySqlCommand("insert into feedback (user,sub,feedback,date,status) values(@user,@sub,@feedback,'"+DateTime.Now+"','New')",c.connect());
        c.cmd.Parameters.AddWithValue("@user",u);
        c.cmd.Parameters.AddWithValue("@sub",txtsub.Text);
        c.cmd.Parameters.AddWithValue("@Feedback",txtfeed.Text);
        int j = c.cmd.ExecuteNonQuery();
        if (j > 0)
        {


            MailMessage MyMailMessage = new MailMessage();

            MyMailMessage.From = new MailAddress("passtech2018@gmail.com");


            MyMailMessage.To.Add("siyaconstruction2021@gmail.com");

            MyMailMessage.Subject = "New feeback";

            MyMailMessage.Body = "New feedback from client.please login and check";

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
            
            
            
            
            
            
            
            Response.Redirect("~/Client/feedback.aspx?id=S");
        }
        else
        {
            Response.Redirect("~/Client/feedback.aspx?id=E");
        }




    }




    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/sentfeedback.aspx?");
    }





}