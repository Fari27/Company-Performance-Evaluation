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

public partial class programmers_Default2 : System.Web.UI.Page
{

    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownList1.AppendDataBoundItems = true;
        DropDownList2.AppendDataBoundItems = true;


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("insert into task_status (T_id,task,Status,date) values(@mid,@task,@status,'"+DateTime.Now+"')", c.connect());
        c.cmd.Parameters.AddWithValue("@mid", DropDownList1.SelectedValue);
        c.cmd.Parameters.AddWithValue("@task", TextBox1.Text);
        c.cmd.Parameters.AddWithValue("@status", DropDownList3.SelectedValue);
        int i = c.cmd.ExecuteNonQuery();
        if (i > 0)
        {
            c.cmd = new MySqlCommand("select max(status) from task_status where T_id=@mid", c.connect());
            c.cmd.Parameters.AddWithValue("@mid", DropDownList1.SelectedValue);
            int s = Convert.ToInt32(c.cmd.ExecuteScalar().ToString());

            /* c.cmd = new SqlCommand("update moduleallot set workstatus=@status where mid=@mid", c.connect());
             c.cmd.Parameters.AddWithValue("@mid", DropDownList1.SelectedValue);
             c.cmd.Parameters.AddWithValue("@status", s);


             c.cmd.ExecuteNonQuery();
             */
            c.cmd = new MySqlCommand("update unit set status=@status where unitid=@mid", c.connect());
            c.cmd.Parameters.AddWithValue("@mid", DropDownList1.SelectedValue);
            c.cmd.Parameters.AddWithValue("@status", s);


            c.cmd.ExecuteNonQuery();


            int st = Convert.ToInt32(DropDownList3.SelectedValue);

            if (st == 100)
            {
                c.cmd = new MySqlCommand("update unit set status=@status where unitid=@mid", c.connect());
                c.cmd.Parameters.AddWithValue("@mid", DropDownList1.SelectedValue);
                c.cmd.Parameters.AddWithValue("@status", st);


              int kk=  c.cmd.ExecuteNonQuery();
                if(kk>0)
                {
                    Response.Redirect("~/Employee/updatemodulestatus.aspx?id=S");
                }


            }
            Response.Redirect("~/Employee/updatemodulestatus.aspx?id=S");

            //Response.Write("<script>alert('updated module work status Successfully')</script>");
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select--");
        DropDownList1.Items.FindByText("--Select--").Value="0";
        DropDownList1.DataBind();


    }
}