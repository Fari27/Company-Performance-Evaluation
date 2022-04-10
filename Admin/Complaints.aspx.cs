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
    string mid;
    int cid,row;
    

    protected void Page_Load(object sender, EventArgs e)
    {


        c.cmd = new MySqlCommand("update complaint set status='got' where status='Not replied'", c.connect());


        int i = c.cmd.ExecuteNonQuery();
       
        string s = Session["user"].ToString();
        c.cmd = new MySqlCommand("select photo from login where usernsme=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        string p = c.cmd.ExecuteScalar().ToString();

      

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var hdnval = ((HiddenField)GridView1.Rows[row].Cells[0].FindControl("HiddenField2"));
        string h = Convert.ToString(hdnval.Value);
        cid = Convert.ToInt32(h);


        c.cmd = new MySqlCommand("update complaint set status='replied',reply=@reply,replydate='"+DateTime.Now+"' where uid=@uid and cid=@cid", c.connect());

        c.cmd.Parameters.AddWithValue("@reply", txtreply.Text);
        c.cmd.Parameters.AddWithValue("@uid", TextBox1.Text);
        c.cmd.Parameters.AddWithValue("@cid", cid );

        int i = c.cmd.ExecuteNonQuery();
        if (i > 0)
        {
            // Response.Write("<script>alert('Reply Sent successfuly')</script>");



            MailMessage MyMailMessage = new MailMessage();

            MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


            MyMailMessage.To.Add(TextBox1.Text);

            MyMailMessage.Subject = "Complaint reply";

            MyMailMessage.Body = "Replied to complaint.please login and check";

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
            
            
            
            
            
            
            
            
            
            
            
            
            Response.Redirect("~/Admin/Complaints.aspx?ids=S");
            GridView1.DataBind();


        }
        else
        {
            Response.Redirect("~/Admin/Complaints.aspx?ids=F");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        row = Convert.ToInt32(e.CommandArgument);

       
        var hdnval = ((HiddenField)GridView1.Rows[row].Cells[0].FindControl("HiddenField2"));
        string h = Convert.ToString(hdnval.Value);
          cid = Convert.ToInt32(h);

        mid = GridView1.Rows[row].Cells[2].Text;



        if (e.CommandName == "rpl")
        {

            Label1.Visible = true;
            txtreply.Visible = true;
            Button1.Visible = true;
            TextBox1.Visible = true;
            Label2.Visible = true;

            TextBox1.Text = mid;

            }
        }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/complaintreply.aspx");
    }
}
