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

using System.Net.Mail;

public partial class Manager_Default : System.Web.UI.Page
{

     Connection c = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        
       
        DropDownList3.AppendDataBoundItems = true;
        DropDownList4.AppendDataBoundItems = true;
        }
    }

    
    
    protected void DropDownList3_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList4.Items.Clear();
        DropDownList4.Items.Add("--Select--");
        DropDownList4.Items.FindByText("--Select--").Value = "0";
        DropDownList4.DataBind();

    }
}