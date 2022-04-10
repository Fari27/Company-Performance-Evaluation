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

using System.Collections; //ArrayList


public partial class Admin_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownList1.AppendDataBoundItems = true;
        DropDownList2.AppendDataBoundItems = true;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("insert into notification (did,eid,title,details,date,status) values(@did,@eid,@title,@details,'"+DateTime.Now+"','New')", c.connect());
        
        c.cmd.Parameters.AddWithValue("@did",DropDownList1.SelectedValue);
        c.cmd.Parameters.AddWithValue("@eid", DropDownList2.SelectedValue);
        c.cmd.Parameters.AddWithValue("@title",txtsub.Text);
        c.cmd.Parameters.AddWithValue("@details",txtdet.Text);
        int i = c.cmd.ExecuteNonQuery();
        if (i > 0)
        {
          
            
            
            
             ArrayList list_emails = new ArrayList();

                int j = 0;
                string email;




          
                                                            
             
             c.cmd = new MySqlCommand("select email from staffregisters where did='"+DropDownList1.SelectedValue+"' and Pid='"+DropDownList2.SelectedValue+"'", c.connect());




                MySqlDataReader read_Email = c.cmd.ExecuteReader();

                while (read_Email.Read())
                {
                    email = read_Email.GetValue(j).ToString();
                    list_emails.Add(email); //Add email to a arraylist
                    j = j + 1 - 1; //increment or ++i
                }
                read_Email.Close();

                foreach (string email_to in list_emails)
                {





                    MailMessage MyMailMessage = new MailMessage();

                    MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                    MyMailMessage.To.Add(email_to);

                    MyMailMessage.Subject = "New notification";

                    MyMailMessage.Body = "New notification  regarding  " + txtsub.Text +" .Please login and check";

                    MyMailMessage.IsBodyHtml = true;

                    SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                    SMTPServer.Port = 587;

                    SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstruction2021@gmail.com", "siya.2021");
                    SMTPServer.EnableSsl = true;

                    try
                    {

                        SMTPServer.Send(MyMailMessage);
                        string msg = "Hi , you are registered please login";
                        //  SendSMS(txtphone.Text, msg);




                    }

                    catch (Exception ex)
                    {

                        //Literal1.Text = "<script>alert('Message n');</script>";





                    }






                }
            
            Response.Redirect("~/Admin/notifications.aspx?id=S");
        }
        else
        {
            Response.Redirect("~/Admin/notifications.aspx?id=E");
        }



    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/notification.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        DropDownList2.Items.FindByText("--Select--").Value = "0";
        DropDownList2.DataBind();
    }
}