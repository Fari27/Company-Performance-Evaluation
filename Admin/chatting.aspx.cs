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

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //  ddlmod.AppendDataBoundItems = true;
            ddlpro.AppendDataBoundItems = true;

        }
    }


    [WebMethod]
    public static ArrayList workcompleted(string wid)
    {

        ArrayList ar = new ArrayList();

      /*  Connection c = new Connection();
        c.cmd = new MySqlCommand("SELECT * FROM chat  where w_id=@w_id  ", c.connect());
        c.cmd.Parameters.AddWithValue("@w_id", wid);
        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();

        while (dr.Read())
        {

            workstatus os = new workstatus();
            os.pri = dr[0].ToString();
            ar.Add(os);
        }
        */


        return ar;
    }

    [WebMethod]
    public static ArrayList moduledtls(string wid)
    {

        ArrayList ar = new ArrayList();

        Connection c = new Connection();

        c.cmd = new MySqlCommand("SELECT count(*) FROM chat WHERE (fid= @wid) or (toid=@wid)  ", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        string count = c.cmd.ExecuteScalar().ToString();

        c.cmd = new MySqlCommand("SELECT msg,fid,toid,msg,datetime FROM chat WHERE (fid= @wid) or (toid=@wid)  ", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();

        while (dr.Read())
        {

            modulestatus ms = new modulestatus();
            ms.msg = dr[0].ToString();
            ms.fid = dr[1].ToString();
            ms.toid = dr[2].ToString();
            ms.dt = dr[3].ToString();
           
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
        public string msg { get; set; }

        public string dt { get; set; }
        public string fid { get; set; }
        public string toid { get; set; }
       
    }




}