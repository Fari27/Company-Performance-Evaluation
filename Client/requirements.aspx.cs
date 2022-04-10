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

        c.cmd = new MySqlCommand("insert into work_request (client_id,work_name,requirements,req_date,completion_date,Status,service,square_feet) values(@user,@title,@requirements,'"+DateTime.Now+"',@complete,'New',@service,@squarefeet)", c.connect());
        c.cmd.Parameters.AddWithValue("@user", u);
        c.cmd.Parameters.AddWithValue("@title",txttitle.Text+"("+TextBox1.Text+")");
        c.cmd.Parameters.AddWithValue("@requirements",txtreq.Text);
        c.cmd.Parameters.AddWithValue("@complete", txtcom.Text);
         c.cmd.Parameters.AddWithValue("@service", ddldpt.SelectedItem.Text);
         c.cmd.Parameters.AddWithValue("@squarefeet",TextBox2.Text);



       int j = c.cmd.ExecuteNonQuery();
       if (j > 0)
       {


           MailMessage MyMailMessage = new MailMessage();

           MyMailMessage.From = new MailAddress("siyanotificatification@gmail.com");


           MyMailMessage.To.Add("siyaconstruction2021@gmail.com");

           MyMailMessage.Subject = "New work";

           MyMailMessage.Body = "New work request from client.please login and check";

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


               Response.Redirect("~/Client/home.aspx?id=R");

           }

           catch (Exception ex)
           {

               //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
               Response.Redirect("~/Client/home.aspx?id=R");
           }








       }





       else
       {
           Response.Redirect("~/Client/home.aspx?id=W");
       }




    }

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/approvedproject.aspx");
    }
   }
