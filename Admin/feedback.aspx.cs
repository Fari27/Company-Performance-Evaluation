using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using MySql.Data.MySqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    Connection c = new Connection();


    protected void Page_Load(object sender, EventArgs e)
    {


        c.cmd = new MySqlCommand("update feedback set status='Viewed' where status='New'", c.connect());


        int i = c.cmd.ExecuteNonQuery();
      

    }




    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}