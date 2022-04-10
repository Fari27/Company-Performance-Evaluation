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
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Net.Mail;
using System.Net;



public partial class Projectleader_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
          //  ddlmod.AppendDataBoundItems = true;
            ddlpro.AppendDataBoundItems = true;

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("select count(unitid) from unit  where wid=@wid ", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", ddlpro.SelectedValue);
        int ct = Convert.ToInt16(c.cmd.ExecuteScalar().ToString());

        c.cmd = new MySqlCommand("select sum(status) from unit where wid=@wid", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", ddlpro.SelectedValue);
         double sum = Convert.ToDouble(c.cmd.ExecuteScalar().ToString());

        int avg = Convert.ToInt16(sum )/ ct;

        c.cmd = new MySqlCommand("update workallot set wstatus=@status where W_id=@mid", c.connect());
        c.cmd.Parameters.AddWithValue("@status", avg);
        c.cmd.Parameters.AddWithValue("@mid", ddlpro.SelectedValue);
        int j = c.cmd.ExecuteNonQuery();
        if (j > 0)
        {
            c.cmd = new MySqlCommand("select client_id from work_request  where work_id=@wid ", c.connect());
            c.cmd.Parameters.AddWithValue("@wid", ddlpro.SelectedValue);
            string uname = c.cmd.ExecuteScalar().ToString();

              c.cmd = new MySqlCommand("select work_name from work_request  where work_id=@wid ", c.connect());
            c.cmd.Parameters.AddWithValue("@wid", ddlpro.SelectedValue);
            string wname = c.cmd.ExecuteScalar().ToString();
          
            #region Mail
            MailMessage MyMailMessage = new MailMessage();
            MailMessage MyMailMessage1 = new MailMessage();

            MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");
            MyMailMessage1.From = new MailAddress("siyanotificatification@gmail.com");


            MyMailMessage.To.Add(uname);
            MyMailMessage1.To.Add("siyaconstruction2021@gmail.com");

            MyMailMessage.Subject = "Work status";
            MyMailMessage1.Subject = "Work status";

            MyMailMessage.Body = "We have updated status of your project (" +wname+" )Please check it!!" ;
            MyMailMessage1.Body = "We have updated status of project (" + wname + " )Please check it!!";

            MyMailMessage.IsBodyHtml = true;
            MyMailMessage1.IsBodyHtml = true;

            SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");
            SmtpClient SMTPServer1 = new SmtpClient("smtp.gmail.com");

            SMTPServer.Port = 587;
            SMTPServer1.Port = 587;

            SMTPServer.Credentials = new System.Net.NetworkCredential("siyaconstruction2021@gmail.com", "siya.2021");
            SMTPServer1.Credentials = new System.Net.NetworkCredential("siyanotificatification@gmail.com", "siya@2021");

            SMTPServer.EnableSsl = true;
            SMTPServer1.EnableSsl = true;

            try
            {

                SMTPServer.Send(MyMailMessage);
                SMTPServer1.Send(MyMailMessage1);
                Response.Write("<script language=\"javascript\">alert(\"Work status updated successfully\");</script>");
                //Response.Redirect("Thankyou.aspx");

            }

            catch (Exception ex)
            {

                //Literal1.Text = "<script>alert('Message not sent successfully');</script>";
                Response.Write("<script language=\"javascript\">alert(\"Message has not sent \");</script>");

            }
            #endregion


            Response.Write("<script>alert('Project work status updated  Successfully')</script>");
        }



    }
    [WebMethod]
    public static ArrayList workcompleted(string wid)
    {

        ArrayList ar = new ArrayList();

        Connection c = new Connection();
        c.cmd = new MySqlCommand("SELECT wstatus FROM workallot where w_id=@w_id  ", c.connect());
        c.cmd.Parameters.AddWithValue("@w_id", wid);
        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();

        while (dr.Read())
        {

            workstatus os = new workstatus();
            os.pri = dr[0].ToString();
            ar.Add(os);
        }



        return ar;
    }

    [WebMethod]
    public static ArrayList moduledtls(string wid)
    {

        ArrayList ar = new ArrayList();

        Connection c = new Connection();
        c.cmd = new MySqlCommand("SELECT unitname, status FROM unit  WHERE (wid= @wid)  ", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();

        while (dr.Read())
        {

            modulestatus ms = new modulestatus();
            ms.mname = dr[0].ToString();
            ms.mstatus = dr[1].ToString();
            ar.Add(ms);
        }



        return ar;
    }



    public class workstatus
    {
        public string pri { get; set; }
    }

    public class modulestatus
    {
        public string mname { get; set; }
        public string mstatus { get; set; }

    }


}