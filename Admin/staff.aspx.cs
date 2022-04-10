using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.AppendDataBoundItems = true;
            DropDownList2.AppendDataBoundItems = true;

        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        DropDownList2.Items.FindByText("--Select--").Value = "0";
        DropDownList2.DataBind();


    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

       

       }
    protected void DropDownList2_TextChanged(object sender, EventArgs e)
    {
       
    }





}