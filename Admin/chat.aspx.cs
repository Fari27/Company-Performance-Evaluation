using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;


public partial class Admin_Default : System.Web.UI.Page
{
    public static string uname;
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Session["user"].ToString();

    }

    [WebMethod]
    public static ArrayList onuser()
    {
        ArrayList ar = new ArrayList();

        Connection c = new Connection();
        //List<onlineusers> or = new List<onlineusers>();
        c.cmd = new MySqlCommand("select usernsme,photo from login where usernsme!=@uname ", c.connect());
        c.cmd.Parameters.AddWithValue("@uname", uname);
        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();
        while (dr.Read())
        {

            onlineusers os = new onlineusers();
            os.user = dr[0].ToString();
            os.photo = dr[1].ToString();
            ar.Add(os);
        }
        c.con.Close();
        return ar;
    }


    public class onlineusers
    {
        public string user { get; set; }
        public string photo { get; set; }
    }
}