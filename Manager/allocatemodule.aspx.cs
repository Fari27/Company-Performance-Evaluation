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

public partial class Projectleader_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        DropDownList1.AppendDataBoundItems = true;
        DropDownList2.AppendDataBoundItems = true;
        DropDownList3.AppendDataBoundItems = true;
        DropDownList4.AppendDataBoundItems = true;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DateTime d = Convert.ToDateTime(txtcomplete.Text);

        c.cmd = new MySqlCommand("insert into task_allot(unitid,manager_id,emp_id,aloc_date,completion_date,Status,wname) values(@mid,@manager,@empid,'"+DateTime.Now+"',@cdate,'0',@wid)",c.connect());
        c.cmd.Parameters.AddWithValue("@mid",DropDownList4.SelectedValue);
        c.cmd.Parameters.AddWithValue("@manager",Session["user"].ToString());
        c.cmd.Parameters.AddWithValue("@empid",DropDownList2.SelectedValue);
        c.cmd.Parameters.AddWithValue("@cdate",d);
        c.cmd.Parameters.AddWithValue("@wid", DropDownList3.SelectedItem.Text);
        int i=c.cmd.ExecuteNonQuery();
        if(i>0)
        {
            c.cmd = new MySqlCommand("update unit set alloc_status='1' where unitid=@uid", c.connect());
            c.cmd.Parameters.AddWithValue("@uid", DropDownList4.SelectedValue);
            int j = c.cmd.ExecuteNonQuery();

            if (j > 0)
            {

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


                    Response.Redirect("~/Manager/allocatemodule.aspx?id=S");

                }

                catch (Exception ex)
                {

                    //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                    Response.Redirect("~/Manager/allocatemodule.aspx?id=S");




                }

                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            }



            else
            {

                Response.Redirect("~/Manager/allocatemodule.aspx?id=N");
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

    protected void DropDownList3_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList4.Items.Clear();
        DropDownList4.Items.Add("--Select--");
        DropDownList4.Items.FindByText("--Select--").Value = "0";
        DropDownList4.DataBind();

    }
}