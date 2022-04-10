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
using System.Net.Mail;


public partial class Employee_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.AppendDataBoundItems = true;
            DropDownList2.AppendDataBoundItems = true;

        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select--");
        DropDownList1.Items.FindByText("--Select--").Value = "0";
        DropDownList1.DataBind();


    }


    [WebMethod]
    public static string InsertModules(string wid, string modulename)
    {



        Connection c = new Connection();
        //List<onlineusers> or = new List<onlineusers>();
        c.cmd = new MySqlCommand("insert into task_status(T_id,task,status,date,wstatus) values(@wid,@unitname,'0','Pending','pending')", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        c.cmd.Parameters.AddWithValue("@unitname", modulename);
      //  c.cmd.Parameters.AddWithValue("@unit", module);
        c.cmd.ExecuteNonQuery();
        string ar = "success";

        return ar;
    }






}