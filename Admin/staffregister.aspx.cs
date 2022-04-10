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
            ddldpt.AppendDataBoundItems = true;

            ddlpos.AppendDataBoundItems = true;
           

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        c.cmd = new MySqlCommand("select count(*) from  login where usernsme=@usernsme ", c.connect());
        c.cmd.Parameters.AddWithValue("@usernsme", txtemail.Text);

        int count = Convert.ToInt32(c.cmd.ExecuteScalar().ToString());
        if (count == 0)
        {


            Random r = new Random();

            string otp = r.Next().ToString().Substring(0, 4);

            c.cmd = new MySqlCommand("insert into staffregisters (Pid,did,fname,gender,dob,address,phone,email,qualification,experience,skills,dor,salary) values(@pid,@did,@fname,@gender,@dob,@add,@phoneno,@email,@qualification,@experience,@skills,'"+DateTime.Now+"',@sal)", c.connect());

            c.cmd.Parameters.AddWithValue("@pid", ddlpos.SelectedValue);
            c.cmd.Parameters.AddWithValue("@did", ddldpt.SelectedValue);
            c.cmd.Parameters.AddWithValue("@fname", txtname.Text);
            c.cmd.Parameters.AddWithValue("@gender", rblgender.Text);
            c.cmd.Parameters.AddWithValue("@dob", txtdob.Text);
            c.cmd.Parameters.AddWithValue("@add", txtadd.Text);
            c.cmd.Parameters.AddWithValue("@phoneno", txtphone.Text);
            c.cmd.Parameters.AddWithValue("@email", txtemail.Text);
            c.cmd.Parameters.AddWithValue("@qualification", txtq.Text);
            c.cmd.Parameters.AddWithValue("@experience", txtexp.Text);
            c.cmd.Parameters.AddWithValue("@skills", txtskills.Text);
            c.cmd.Parameters.AddWithValue("@sal", txtsalary.Text);


            int j = c.cmd.ExecuteNonQuery();
            if (j > 0)
            {
                string imgpath = Server.MapPath("~/images/");
                //  c.cmd = new SqlCommand("select max(emailid) from staffregisters", c.connect());
                string imgname = txtemail.Text;
                //c.cmd.ExecuteScalar().ToString();
                string ext = Path.GetExtension(FileUpload1.FileName);
                FileUpload1.SaveAs(imgpath + imgname + ext);

                string enpass = otp;

                c.cmd = new MySqlCommand("insert into login(usernsme,password,type,status,verifycode,photo) values(@username,@pass,@type,'approved','0',@photo)", c.connect());
                c.cmd.Parameters.AddWithValue("@username", txtemail.Text);
                c.cmd.Parameters.AddWithValue("@pass", enpass);
                c.cmd.Parameters.AddWithValue("@type", ddlpos.SelectedItem.Text);
                c.cmd.Parameters.AddWithValue("@photo", "../images/" + imgname + ext);
                int i = c.cmd.ExecuteNonQuery();
                if (i > 0)

                {
                    MailMessage MyMailMessage = new MailMessage();

                    MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                    MyMailMessage.To.Add(txtemail.Text);

                    MyMailMessage.Subject = "Staff Registration  Details";

                    MyMailMessage.Body = "Hi , you are registered please login . /n Your username is : " + txtemail.Text + " and password is : " + otp;

                    MyMailMessage.IsBodyHtml = true;

                    SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");

                    SMTPServer.Port = 587;

                    SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstruction2021@gmail.com", "siya.2021");

                    SMTPServer.EnableSsl = true;

                    try
                    {

                        SMTPServer.Send(MyMailMessage);
                        string msg = "Hi , you are registered please login";
                        SendSMS(txtphone.Text, msg);


                        Response.Redirect("~/Admin/staffregister.aspx?id=S");

                    }

                    catch (Exception ex)
                    {

                        //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
            Response.Redirect("~/Admin/staffregister.aspx?id=S");




                    }


                }
                

            }
           
        }
        else
        {
            Response.Write("<script>alert('Email id Already Registered')</script>");
        }
    }







    private void SendSMS(string Phone, string Msg)
    {
        try
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://utilities.ociuz.com/sms/sendsms.aspx?userid=hima&pwd=123&to=" + Phone + "&msg=" + Msg);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            StreamReader stream = new StreamReader(response.GetResponseStream());
            stream.ReadToEnd();
        }
        catch (Exception ex)
        {

            Response.Redirect("~/Admin/staffregister.aspx?id=S");
        }
    }

    protected void ddldpt_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlpos.Items.Clear();
        ddlpos.Items.Add("--select--");
        ddlpos.Items.FindByText("--select--").Value="0";
        ddlpos.DataBind();

    }
}










