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
using System.Web.Services;
using System.Collections;



public partial class Projectleader_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
          //  ddlmod.AppendDataBoundItems = true;
            ddlpro.AppendDataBoundItems = true;

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
        c.cmd = new MySqlCommand("SELECT unitname, status FROM unit WHERE (wid= @wid)  ", c.connect());
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