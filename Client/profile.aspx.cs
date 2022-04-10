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

    }

    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        string imgname1 = Session["user"].ToString();
        //c.cmd = new SqlCommand("select uid from login where usernsme=@username", c.connect());
        //c.cmd.Parameters.AddWithValue("@username", s);
        // string imgname1 = c.cmd.ExecuteScalar().ToString();



        if (e.CommandName == "upd")
        {
            string imgpath = Server.MapPath("~/images/");
            var fu = ((FileUpload)FormView1.FindControl("FileUpload1"));

            string ext = Path.GetExtension(fu.FileName);

            fu.SaveAs(imgpath + imgname1 + ext);
            c.cmd = new MySqlCommand("update login set photo=@photo  where usernsme=@username", c.connect());
            c.cmd.Parameters.AddWithValue("@photo", "/images/" + imgname1 + ext);
            c.cmd.Parameters.AddWithValue("@username", Session["user"].ToString());
            c.cmd.ExecuteNonQuery();

            var img = ((Image)FormView1.FindControl("Image1"));

            img.ImageUrl = "../images/" + imgname1 + ext;


            //c.cmd = new SqlCommand("select photo from login where usernsme=@username", c.connect());
            //c.cmd.Parameters.AddWithValue("@username", s1);
            //string imgname3 = c.cmd.ExecuteScalar().ToString();


            FormView1.DataBind();











        }
    }
}