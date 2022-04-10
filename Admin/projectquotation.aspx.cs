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
    int tp;
    
    string wtr;
    public static string fname = null, dattachId = null,cid;
    Connection c = new Connection();

    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField3.Value = Request.QueryString["wid"].ToString();
         cid = Request.QueryString["cid"].ToString();
        
      
        Textbox1.Text = cid.ToString();
        c.cmd = new MySqlCommand("select work_name from work_request where  work_id=@work_id", c.connect());
        c.cmd.Parameters.AddWithValue("@work_id", HiddenField3.Value);
      txtwname.Text= c.cmd.ExecuteScalar().ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

       
        
             string pn = cid;
             string fn = FileUpload1.FileName.ToString();
           // string fn = FileUpload1.FileName.ToString();
            string pa = "/attachmentq/" + pn + fn;

            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/attachmentq/" + pn + fn));

       
           
            
            c.cmd = new MySqlCommand("insert into quotation(work_id,filename,path,to_id,date) values(@wid,@filename,@path,@toid,'"+DateTime.Now+"')", c.connect());
            c.cmd.Parameters.AddWithValue("@wid",HiddenField3.Value);
            c.cmd.Parameters.AddWithValue("@filename",txtmessage.Text);
            c.cmd.Parameters.AddWithValue("@path",pa);
            c.cmd.Parameters.AddWithValue("@toid",cid);
            int j = c.cmd.ExecuteNonQuery();
            if (j > 0)
            {

                 c.cmd = new MySqlCommand("update work_request set Status='approved' where work_id=@workid", c.connect());
            
            c.cmd.Parameters.AddWithValue("@workid",HiddenField3.Value );

            c.cmd.ExecuteNonQuery();
   


                MailMessage MyMailMessage = new MailMessage();

                MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                MyMailMessage.To.Add(Request.QueryString["cid"].ToString());

                MyMailMessage.Subject = "Quotation";

                MyMailMessage.Body = "We have send quotation for your project "+txtwname.Text+".please check!!";

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









              
              

                    Response.Redirect("~/Admin/approveproject.aspx?id=S");

                    //Response.Redirect("Thankyou.aspx");

            }
            else
            {
               
                    //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                    // Response.Write("<script>alert('Approved')</script>");

                    Response.Redirect("~/Admin/approveproject.aspx?id=S");
                  //Response.Write("<script>alert('Quotation send successfully')</script>");

                }


               


           
    }
  
    protected void Textbox1_TextChanged(object sender, EventArgs e)
    {

    }
}