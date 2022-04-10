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

    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        int row = Convert.ToInt32(e.CommandArgument);

        var hdnval = ((HiddenField)GridView1.Rows[row].Cells[0].FindControl("HiddenField2"));
        string wk = GridView1.Rows[row].Cells[3].Text;
        string cid = GridView1.Rows[row].Cells[8].Text;
        string h = Convert.ToString(hdnval.Value);

        int wid = Convert.ToInt32(h);

        if (e.CommandName == "apr")
        {
            c.cmd = new MySqlCommand("select status  from work_request where  work_id=@work_id", c.connect());
            c.cmd.Parameters.AddWithValue("@work_id", wid);
            string stat = c.cmd.ExecuteScalar().ToString();


            if (stat == "Quote Rejected")
            {
                c.cmd = new MySqlCommand("update work_request set status='Resend' where work_id=@wid", c.connect());
                c.cmd.Parameters.AddWithValue("@wid", wid);
                int i = c.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    // Response.Write("<script>alert('Project  Approved')</script>");
                    GridView1.DataBind();
                    Response.Redirect("~/Admin/projectquotation.aspx?wid=" + wid + "&cid=" + cid);
                }



            }


            else
            {










                if (stat == "New")
                {


                    c.cmd = new MySqlCommand("update work_request set Status='New' where work_id=@workid", c.connect());


                    c.cmd.Parameters.AddWithValue("@workid", wid);

                    int i = c.cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        // Response.Write("<script>alert('Project  Approved')</script>");
                        GridView1.DataBind();
                        Response.Redirect("~/Admin/projectquotation.aspx?wid=" + wid + "&cid=" + cid);
                    }
                }


                else if (stat == "rejected")
                {

                    Response.Write("<script>alert('Already rejected')</script>");

                }

                else
                {


                    Response.Write("<script>alert('Already approved')</script>");


                }

            }
        }
        if (e.CommandName == "rej")
        {

            c.cmd = new MySqlCommand("select status  from work_request where  work_id=@work_id", c.connect());
            c.cmd.Parameters.AddWithValue("@work_id", wid);
            string stat = c.cmd.ExecuteScalar().ToString();

           


            if (stat == "rejected")
            {

                Response.Write("<script>alert('Already rejected')</script>");

            }

            else if (stat == "Approved" || stat=="Accepted" || stat=="allocated")
            {


                Response.Write("<script>alert('Already approved')</script>");


            }

            else
            {

                c.cmd = new MySqlCommand("update work_request set Status='rejected' where work_id=@workid", c.connect());

                c.cmd.Parameters.AddWithValue("@workid", wid);

                int i = c.cmd.ExecuteNonQuery();
                if (i > 0)
                {


                    MailMessage MyMailMessage = new MailMessage();

                    MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                    MyMailMessage.To.Add(cid);

                    MyMailMessage.Subject = "Project";

                    MyMailMessage.Body = "Requirement submitted for  " + wk + " has been rejected.please check!!";

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















                    Response.Write("<script>alert('Project  Rejected')</script>");
                    GridView1.DataBind();

                }




            }


        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/sentquotation.aspx");
    }


  }