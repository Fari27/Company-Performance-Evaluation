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
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Session["user"].ToString();

        c.cmd = new MySqlCommand("update warning set status='viewed' where status='New' and staff_id=@s ", c.connect());

        c.cmd.Parameters.AddWithValue("@s", s);
        int i = c.cmd.ExecuteNonQuery();
      
    }

   }