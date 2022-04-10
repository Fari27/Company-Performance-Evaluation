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
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        string imgpath = Server.MapPath("~/clientdetails/");
        //  c.cmd = new SqlCommand("select max(emailid) from staffregisters", c.connect());
        string imgname = txtdept.Text;
        //c.cmd.ExecuteScalar().ToString();
        string ext = Path.GetExtension(FileUpload1.FileName);
        FileUpload1.SaveAs(imgpath + imgname + ext);

        
        c.cmd = new MySqlCommand("insert into clients(company_name,photoin,url,photo) values(@client,@photo,'url',@p)", c.connect());
        c.cmd.Parameters.AddWithValue("@client", txtdept.Text);



        c.cmd.Parameters.AddWithValue("@photo", "../clientdetails/" + imgname + ext);
       
        c.cmd.Parameters.AddWithValue("@p", "clientdetails/" + imgname + ext);
        int i = c.cmd.ExecuteNonQuery();
      
        if (i > 0)
        {
            Response.Redirect("~/Admin/clientdetails.aspx?id=S");
        }
        else
        {
            Response.Redirect("~/Admin/clientdetailss.aspx?id=E");
        }








    }
}