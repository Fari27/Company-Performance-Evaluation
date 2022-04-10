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

    int tp;
    string wtr;
    public static string fname = null, dattachId = null;
    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
            DropDownList1.AppendDataBoundItems = true;

        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
       string pn=Session["user"].ToString();
             string fn = FileUpload1.FileName.ToString();
           // string fn = FileUpload1.FileName.ToString();
            string pa = "/attachments/" + pn + fn;

            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/attachments/" + pn + fn));


           
            
            c.cmd = new MySqlCommand("insert into fileupload (work_id,filename,path,date,fromid,toid) values(@wid,@filename,@path,'"+DateTime.Now+"','"+pn+"',@toid)", c.connect());
            c.cmd.Parameters.AddWithValue("@wid",DropDownList1.SelectedValue);
            c.cmd.Parameters.AddWithValue("@filename",txtmessage.Text);
            c.cmd.Parameters.AddWithValue("@path",pa);
            c.cmd.Parameters.AddWithValue("@toid",txttoadd.Text);
            int i = c.cmd.ExecuteNonQuery();
            if (i > 0)
            {

                MailMessage MyMailMessage = new MailMessage();

                MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                MyMailMessage.To.Add(txttoadd.Text);

                MyMailMessage.Subject = "New file uploaded";

                MyMailMessage.Body = "New file has been upload under project:" + DropDownList1.SelectedItem.Text;

                MyMailMessage.IsBodyHtml = true;

                SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                SMTPServer.Port = 587;

                SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstruction2021@gmail.com", "siya.2021");

                SMTPServer.EnableSsl = true;

                try
                {

                    SMTPServer.Send(MyMailMessage);

                }

                catch (Exception ex)
                {


                }



              

                    Response.Redirect("~/Manager/uploadfiles.aspx?id=S");

                    //Response.Redirect("Thankyou.aspx");

            }
            else
            {
               
                    //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                    // Response.Write("<script>alert('Approved')</script>");

                    Response.Redirect("~/Manager/uploadfiles.aspx?id=N");
                  //Response.Write("<script>alert('Quotation send successfully')</script>");

                }


               
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Manager/sentitems.aspx?");
    }
 
   
}

        
    

    