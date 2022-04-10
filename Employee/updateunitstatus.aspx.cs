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


public partial class Employee_Default : System.Web.UI.Page
{

    Connection c = new Connection();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
            DropDownList1.AppendDataBoundItems = true;
        DropDownList2.AppendDataBoundItems = true;
        DropDownList3.AppendDataBoundItems = true;



    }




    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select--");
        DropDownList1.Items.FindByText("--Select--").Value = "0";
        DropDownList1.DataBind();


    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        DropDownList3.Items.Add("--Select--");
        DropDownList3.Items.FindByText("--Select--").Value = "0";
        DropDownList3.DataBind();


    }
    protected void Button1_Click1(object sender, EventArgs e)
    {


        c.cmd = new MySqlCommand("update task_status set status=@status,wstatus='Completed',date='"+DateTime.Now+"' where TW_id=@mid", c.connect());
        c.cmd.Parameters.AddWithValue("@mid", DropDownList3.SelectedValue);
        c.cmd.Parameters.AddWithValue("@status", 1);
        int j = c.cmd.ExecuteNonQuery();
       
        if (j > 0)
        {

            c.cmd = new MySqlCommand("select count(*) from task_status where T_id=@tid", c.connect());
            c.cmd.Parameters.AddWithValue("@tid", DropDownList1.SelectedValue);


            double c1 = Convert.ToInt16(c.cmd.ExecuteScalar().ToString());
            c.cmd = new MySqlCommand("select count(*) from task_status where T_id=@tid and status=@status", c.connect());
            c.cmd.Parameters.AddWithValue("@tid", DropDownList1.SelectedValue);
            c.cmd.Parameters.AddWithValue("@status", 1);
             double c2 = Convert.ToInt16(c.cmd.ExecuteScalar().ToString());



            double c3 = Convert.ToDouble(c2 / c1);

            double p = c3 * 100;
          //  Response.Write("<script>alert('" + c2 + "')</script>");
           // Label2.Text = c3.ToString();


            
           c.cmd = new MySqlCommand("update unit set status=@status where unitid=@mid", c.connect());
            c.cmd.Parameters.AddWithValue("@mid", DropDownList1.SelectedValue);
            c.cmd.Parameters.AddWithValue("@status",p);
            int k = c.cmd.ExecuteNonQuery();
            if(k>0)
            {

                c.cmd = new MySqlCommand("SELECT login.usernsme FROM login INNER JOIN staffregisters ON login.usernsme = staffregisters.email where login.type ='Project Manager' and staffregisters.did='" + Session["did"].ToString() + "'", c.connect());
                string tt = c.cmd.ExecuteScalar().ToString();




                MailMessage MyMailMessage = new MailMessage();

                MyMailMessage.From = new MailAddress("siyaconstruction2021@gmail.com");


                MyMailMessage.To.Add(tt);

                MyMailMessage.Subject = "Work for verification";

                MyMailMessage.Body = "New task has been completed and ready for verification under work "+ DropDownList2.SelectedItem.Text;

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










                
                Response.Redirect("~/Employee/updateunitstatus.aspx?id=S");
            }

            

        }
    }
}