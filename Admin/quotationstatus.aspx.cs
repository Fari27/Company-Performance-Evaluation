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

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        int row = Convert.ToInt32(e.CommandArgument);

        var hdnval = ((HiddenField)GridView1.Rows[row].Cells[0].FindControl("HiddenField2"));
        // string wid = GridView1.Rows[row].Cells[0].Text;
        string cid = GridView1.Rows[row].Cells[6].Text;
        string h = Convert.ToString(hdnval.Value);

        int wid = Convert.ToInt32(h);

        if (e.CommandName == "apr")
        {
            c.cmd = new MySqlCommand("update work_request set Status='approved' where work_id=@workid", c.connect());


            c.cmd.Parameters.AddWithValue("@workid", wid);

            int i = c.cmd.ExecuteNonQuery();
            if (i > 0)
            {
                // Response.Write("<script>alert('Project  Approved')</script>");
                GridView1.DataBind();
                Response.Redirect("~/Admin/projectquotation.aspx?wid=" + wid + "&cid=" + cid);
            }
        }
        if (e.CommandName == "rej")
        {
            c.cmd = new MySqlCommand("update work_request set Status='rejected' where work_id=@workid", c.connect());

            c.cmd.Parameters.AddWithValue("@workid", wid);

            int i = c.cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert('Project  Rejected')</script>");
                GridView1.DataBind();

            }




        }


    }


}