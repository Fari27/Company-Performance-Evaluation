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

public partial class Admin_Default : System.Web.UI.Page
{ Connection c = new Connection();



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)

    {

        c.cmd = new MySqlCommand("select password from login where usernsme=@uid", c.connect());
        c.cmd.Parameters.AddWithValue("@uid", Session["user"].ToString());



        string pass = c.cmd.ExecuteScalar().ToString();
        string depass = pass;

        string enpass =txtnew.Text;


        string s = Session["user"].ToString();
     

            c.cmd = new MySqlCommand("Update login set password = @password where usernsme = @usernsme and password = @passold", c.connect());

            c.cmd.Parameters.AddWithValue("@passold", pass);
            c.cmd.Parameters.AddWithValue("@password", enpass);
            c.cmd.Parameters.AddWithValue("@usernsme", s);
           int i= c.cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Redirect("~/Client/changepassword.aspx?id=S");
            }
            else
            {
                Response.Redirect("~/Client/changepassword.aspx?id=E");
            }
        


    }


  }