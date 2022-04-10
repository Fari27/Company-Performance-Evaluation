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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownList1.AppendDataBoundItems = true;
        DropDownList2.AppendDataBoundItems = true;
        DropDownList3.AppendDataBoundItems = true;
            

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("insert into warning (staff_id,title,details,date,status) values(@staffid,@title,@details,'"+DateTime.Now+"','New')", c.connect());

       
        c.cmd.Parameters.AddWithValue("@staffid", DropDownList3.SelectedValue);
        c.cmd.Parameters.AddWithValue("@title", txtsub.Text);
        c.cmd.Parameters.AddWithValue("@details", txtdet.Text);
        int i = c.cmd.ExecuteNonQuery();
        if (i > 0)
        {

            MailMessage MyMailMessage = new MailMessage();

            MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


            MyMailMessage.To.Add(DropDownList3.SelectedValue);

            MyMailMessage.Subject = "New warning";

            MyMailMessage.Body = "New warning regarding "+txtsub.Text+".Please and login check for details";

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


              

            }

            catch (Exception ex)
            {

                //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
              




            }


            
            
            
            
            
            Response.Redirect("~/Admin/warnings.aspx?id=S");
            
        }
        else
        {
            Response.Redirect("~/Admin/warnings.aspx?id=E");
        }



    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/warning.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        DropDownList2.Items.FindByText("--Select--").Value = "0";
        DropDownList2.DataBind();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        DropDownList3.Items.Add("--Select--");
        DropDownList3.Items.FindByText("--Select--").Value = "0";
        DropDownList3.DataBind();
    }
}