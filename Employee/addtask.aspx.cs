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

public partial class Employee_Default : System.Web.UI.Page
{
    Connection c = new Connection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlwork.AppendDataBoundItems = true;

            DropDownList1.AppendDataBoundItems = true;
           
            DropDownList3.AppendDataBoundItems = true;
            DropDownList4.AppendDataBoundItems = true;
       

        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }


    [WebMethod]
    public static string InsertModules(string wid, string modulename, string module)
    {



        Connection c = new Connection();
        //List<onlineusers> or = new List<onlineusers>();
        c.cmd = new MySqlCommand("insert into task_status(uid,task_name,task_desc,status,date) values(@wid,@unitname,@unit,0)", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        c.cmd.Parameters.AddWithValue("@unitname", modulename);
        c.cmd.Parameters.AddWithValue("@unit", module);
        c.cmd.ExecuteNonQuery();
        string ar = "success";

        return ar;
    }


    protected void ddlwork_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList4.Items.Clear();
        DropDownList4.Items.Add("--Select--");
        DropDownList4.Items.FindByText("--Select--").Value = "0";
        DropDownList4.DataBind();

    }


   
    protected void DropDownList3_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select--");
        DropDownList1.Items.FindByText("--Select--").Value = "0";
        DropDownList1.DataBind();

    }

}

