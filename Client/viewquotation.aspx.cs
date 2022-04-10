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
        if (!IsPostBack)
        {
            DropDownList1.AppendDataBoundItems = true;

        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int row = Convert.ToInt32(e.CommandArgument);

        var hdnval = ((HiddenField)GridView1.Rows[row].Cells[0].FindControl("HiddenField2"));
        //int m = Convert.ToInt32(hdnval.Value);

        string id = Convert.ToString(hdnval.Value);

        string file = GridView1.Rows[row].Cells[4].Text;
        string h = GridView1.Rows[row].Cells[1].Text;
        string path = GridView1.Rows[row].Cells[5].Text;

        if (e.CommandName == "vw")
        {
            c.cmd = new MySqlCommand("update work_request set status='Accepted' where work_id=@wid", c.connect());
            c.cmd.Parameters.AddWithValue("@wid",id);
            int i = c.cmd.ExecuteNonQuery();
            if (i > 0)
            {




                MailMessage MyMailMessage = new MailMessage();

                MyMailMessage.From = new MailAddress("siyanotificatification@gmail.com");


                MyMailMessage.To.Add("siyaconstruction2021@gmail.com");

                MyMailMessage.Subject = "Quotatio approved";

                MyMailMessage.Body = "Quotation approved by client for work."+DropDownList1.SelectedItem.Text+"please login and check";

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


                    Response.Redirect("~/Client/viewquotation.aspx?id=S");

                }

                catch (Exception ex)
                {

                    //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                    Response.Redirect("~/Client/viewquotation.aspx?id=S");
                }










             
            }

        }
        if (e.CommandName == "rj")
        {
            c.cmd = new MySqlCommand("update work_request set status='Rejected' where work_id=@wid", c.connect());
            c.cmd.Parameters.AddWithValue("@wid", id);
            int i = c.cmd.ExecuteNonQuery();
            if (i > 0)
            {





                MailMessage MyMailMessage = new MailMessage();

                MyMailMessage.From = new MailAddress("passtech2018@gmail.com");


                MyMailMessage.To.Add("siyaconstruction2021@gmail.com");

                MyMailMessage.Subject = "Quotation rejected";

                MyMailMessage.Body = "Quotatio rejected by client for work " +DropDownList1.SelectedItem.Text+".please login and check";

                MyMailMessage.IsBodyHtml = true;

                SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                SMTPServer.Port = 587;

                SMTPServer.Credentials = new System.Net.NetworkCredential("passtech2018@gmail.com", "passtech.2021");

                SMTPServer.EnableSsl = true;

                try
                {

                    SMTPServer.Send(MyMailMessage);
                    string msg = "Hi , you are registered please login";
                    //SendSMS(txtphone.Text, msg);


                    Response.Redirect("~/Client/viewquotation.aspx?id=N");

                }

                catch (Exception ex)
                {

                    //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                    Response.Redirect("~/Client/viewquotation.aspx?id=N");
                }




                
                
                
                
                
                
                
                
                
                
                
              
            }

        }


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/acceptedquotation.aspx");
    }
}