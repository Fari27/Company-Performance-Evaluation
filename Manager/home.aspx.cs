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
{

    Connection c = new Connection();
    MySqlDataReader dr,dr1;
    protected void Page_Load(object sender, EventArgs e)
    {





        string s = Session["user"].ToString();
        c.cmd = new MySqlCommand("select photo from login where usernsme=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        string p = c.cmd.ExecuteScalar().ToString();

        c.cmd = new MySqlCommand("select fname from staffregisters where email=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        string n = c.cmd.ExecuteScalar().ToString();
        Label1.Text = n;
        Image1.ImageUrl = p;

       c.cmd= new MySqlCommand("select Pid,did from staffregisters where email=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);

        dr1 = c.cmd.ExecuteReader();
        if (dr1.Read())
        {
            int p1 = Convert.ToInt16(dr1[0].ToString());
            int d = Convert.ToInt16(dr1[1].ToString());

           

        c.cmd = new MySqlCommand("select count(status) from notification where status='New' and did=@d and eid=@p", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        c.cmd.Parameters.AddWithValue("@d", d);
        c.cmd.Parameters.AddWithValue("@p", p1);
      
        dr = c.cmd.ExecuteReader();
        if (dr.Read())
        {
            int n1 = Convert.ToInt16(dr[0].ToString());
            if (n1 > 0)
            {



                LinkButton1.Visible = true;
            }



        }      
            
        
            c.cmd = new MySqlCommand("select count(status) from warning where status='New' and staff_id=@username", c.connect());
            c.cmd.Parameters.AddWithValue("@username", s);
            dr = c.cmd.ExecuteReader();
            if (dr.Read())
            {
                int n2 = Convert.ToInt16(dr[0].ToString());
                if (n2 > 0)
                {



                  LinkButton2.Visible = true;
                }



            }



        }
   
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
   
    
    protected void LinkButton2_Click(object sender, EventArgs e)
    { string s = Session["user"].ToString();

 c.cmd = new MySqlCommand("update warning set status='viewed' where status='New' and staff_id=@s ", c.connect());

         c.cmd.Parameters.AddWithValue("@s",s);
        int i = c.cmd.ExecuteNonQuery();
        {

            Response.Redirect("~/Manager/warning.aspx");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string s = Session["user"].ToString();

        c.cmd = new MySqlCommand("select Pid,did from staffregisters where email=@username", c.connect());
        c.cmd.Parameters.AddWithValue("@username", s);
        int d = Convert.ToInt16(dr1[1].ToString());

        int p1 = Convert.ToInt16(dr1[0].ToString());


        dr1 = c.cmd.ExecuteReader();
        if (dr1.Read())
        {


            c.cmd = new MySqlCommand("update notification set status='viewed' where status='NEW' and did=@d and eid=@p ", c.connect());
            c.cmd.Parameters.AddWithValue("@username", s);
            c.cmd.Parameters.AddWithValue("@d", d);
            c.cmd.Parameters.AddWithValue("@p", p1);
      

            int i = c.cmd.ExecuteNonQuery();
            {

                Response.Redirect("~/Manager/notification.aspx");
            }
        }

    
    }
}
