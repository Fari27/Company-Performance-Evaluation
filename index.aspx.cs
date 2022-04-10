using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

public partial class index : System.Web.UI.Page
{
   
    public string ConString = ConfigurationManager.ConnectionStrings["cybenko"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        ourclient();
    }
  


    public void ourclient()
    {
        string query = "select company_name,photo,url from clients";
        MySqlConnection con = new MySqlConnection(ConString);
        MySqlDataAdapter da = new MySqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        repeater2.DataSource = ds;
        repeater2.DataBind();
        
        

      




    }

}