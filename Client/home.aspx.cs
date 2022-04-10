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
    MySqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Session["user"].ToString();
        c.cmd = new MySqlCommand("select photo from login where usernsme=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        string p = c.cmd.ExecuteScalar().ToString();

        c.cmd = new MySqlCommand("select name from registration where email=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        string n = c.cmd.ExecuteScalar().ToString();
        Label1.Text = n;
        Image1.ImageUrl = p;



        c.cmd = new MySqlCommand("select count(status) from complaint where status='replied'", c.connect());

        dr = c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int n2 = Convert.ToInt16(dr[0].ToString());
            if (n2 > 0)
            {



                LinkButton1.Visible = true;
            }








        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        c.cmd = new MySqlCommand("update complaint set status='viewed' where status='replied'", c.connect());


        int i = c.cmd.ExecuteNonQuery();
        {

            Response.Redirect("~/Client/complaintreply.aspx");
        }
    }
}