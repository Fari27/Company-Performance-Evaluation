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
        if(!IsPostBack)
        { 
            DropDownList1.AppendDataBoundItems = true;




        }

    }




protected void Button2_Click(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("insert into position (did,position_name) values(@did,@position)", c.connect());
        
      
       c.cmd.Parameters.AddWithValue("@did",Convert.ToInt32(DropDownList1.SelectedValue));
       c.cmd.Parameters.AddWithValue("@position", txtpos.Text);
       int i = c.cmd.ExecuteNonQuery();

        GridView1.DataBind();
        if (i > 0)
        {
            Response.Redirect("~/Admin/positions.aspx?id=S");
           
        }
        else
        {
            Response.Redirect("~/Admin/positions.aspx?id=E");
        }

    }



   
}