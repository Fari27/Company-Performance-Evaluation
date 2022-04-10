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
        {
            DropDownList1.AppendDataBoundItems = true;

            DropDownList2.AppendDataBoundItems = true;
            DropDownList3.AppendDataBoundItems = true;
        }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("select completion_date from work_request where work_id=@workid", c.connect());

        c.cmd.Parameters.AddWithValue("@workid", DropDownList3.SelectedValue);
           string d = c.cmd.ExecuteScalar().ToString();





        c.cmd = new MySqlCommand("insert into workallot (W_id,D_id,manager_id,Alloted_date,Complete_date,wstatus) values(@wid,@did,@plid,'"+DateTime.Now+"',@complete,0)", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", DropDownList3.SelectedValue);
        c.cmd.Parameters.AddWithValue("@did", DropDownList1.SelectedValue);
        c.cmd.Parameters.AddWithValue("@plid", DropDownList2.SelectedValue);
        c.cmd.Parameters.AddWithValue("@complete", d);
        int j = c.cmd.ExecuteNonQuery();

        if (j > 0)
        {
            c.cmd = new MySqlCommand("select req_date from work_request where work_id=@workid", c.connect());

            c.cmd.Parameters.AddWithValue("@workid", DropDownList3.SelectedValue);
            DateTime dd = Convert.ToDateTime(c.cmd.ExecuteScalar().ToString());


            c.cmd = new MySqlCommand("update work_request set status='allocated' where work_id=@wid", c.connect());

            c.cmd.Parameters.AddWithValue("@wid", DropDownList3.SelectedValue);

            int i = c.cmd.ExecuteNonQuery();

            if (i > 0)
                                              
            {
                c.cmd= new MySqlCommand("insert into predict(wid,coming_status,submit_date) values(@wid,'0','"+dd+"')",c.connect());

                 c.cmd.Parameters.AddWithValue("@wid", DropDownList3.SelectedValue);
                 c.cmd.ExecuteNonQuery();






                 MailMessage MyMailMessage = new MailMessage();

                 MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                 MyMailMessage.To.Add(DropDownList2.SelectedValue);

                 MyMailMessage.Subject = "New work details";

                 MyMailMessage.Body = "New work details assigned.Please and login check for details";

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


                     Response.Redirect("~/Admin/allocatework.aspx?id=S");

                 }

                 catch (Exception ex)
                 {

                     //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                     Response.Redirect("~/Admin/allocatework.aspx?id=S");




                 }


                
                
                
                
                
                
                
                
                
                
                
                
                
                
               

            }
            else
            {
                Response.Redirect("~/Admin/allocatework.aspx?id=E");
            }


        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        DropDownList2.Items.FindByText("--Select--").Value = "0";
        DropDownList2.DataBind();

    }
}