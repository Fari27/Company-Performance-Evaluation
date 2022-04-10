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

public partial class Projectleader_Default : System.Web.UI.Page
{

    Connection c = new Connection();
    MySqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Session["user"].ToString();

        c.cmd = new MySqlCommand("select Pid,did from staffregisters where email=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);

        dr= c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int p1 = Convert.ToInt16(dr[0].ToString());
            int d = Convert.ToInt16(dr[1].ToString());
       

            c.cmd = new MySqlCommand("update notification set status='viewed' where status='New' and did=@d and eid=@p ", c.connect());
           
            c.cmd.Parameters.AddWithValue("@d", d);
            c.cmd.Parameters.AddWithValue("@p", p1);
      

            int i = c.cmd.ExecuteNonQuery();

        }
    }
}