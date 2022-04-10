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


public partial class Projectleader_Default : System.Web.UI.Page
{
    Connection c = new Connection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ddlwork.AppendDataBoundItems = true;
           
        }
    }

    [WebMethod]
    public static string InsertModules(string wid, string modulename, string module)
    {



        Connection c = new Connection();
        //List<onlineusers> or = new List<onlineusers>();
        c.cmd = new MySqlCommand("insert into unit(wid,unitname,unitdesc,status,alloc_status) values(@wid,@unitname,@unit,0,'0')", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        c.cmd.Parameters.AddWithValue("@unitname", modulename);
        c.cmd.Parameters.AddWithValue("@unit", module);
        c.cmd.ExecuteNonQuery();
        string ar = "success";

        return ar;
    }


}