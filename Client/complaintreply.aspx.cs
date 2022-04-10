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

public partial class Client_Default : System.Web.UI.Page
{

    Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        c.cmd = new MySqlCommand("update complaint set status='viewed' where status='replied'", c.connect());


        int i = c.cmd.ExecuteNonQuery();
       

    }
}