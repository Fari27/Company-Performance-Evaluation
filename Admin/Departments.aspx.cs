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


public partial class Admin_Default : System.Web.UI.Page
{
    Connection c = new Connection();
    
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        c.cmd = new MySqlCommand("insert into department(Dept_name) values(@dept)", c.connect());
        c.cmd.Parameters.AddWithValue("@dept", txtdept.Text);
        int i = c.cmd.ExecuteNonQuery();
        GridView1.DataBind();

        if (i > 0)
        {
            Response.Redirect("~/Admin/departments.aspx?id=S");
        }
        else
        {
            Response.Redirect("~/Admin/departments.aspx?id=E");
        }


    }

}
