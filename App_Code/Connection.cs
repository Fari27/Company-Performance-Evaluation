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


/// <summary>
/// Summary description for Class1
/// </summary>
public class Connection
{
    public MySqlCommand cmd;
    public MySqlConnection con;

    //    public static DataTable report = new DataTable();

    public static DataTable report;

    public MySqlConnection connect()
    {
           
        con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cybenko"].ConnectionString);
        con.Open();
        return con;

    }
    #region ClearFunction

    public void clearall(ContentPlaceHolder cont)
    {
        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is TextBox)
            {
                ((TextBox)ctrl).Text = "";
            }
        }

        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is Label)
            {
                ((Label)ctrl).Text = "";
            }
        }
        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is DropDownList)
            {
                ((DropDownList)ctrl).ClearSelection();
            }
        }
        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is RadioButton)
            {
                ((RadioButton)ctrl).Dispose();
            }
        }
        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is RadioButtonList)
            {
                ((RadioButtonList)ctrl).ClearSelection();
            }
        }
        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is CheckBox)
            {
                ((CheckBox)ctrl).Dispose();
            }
        }
        foreach (Control ctrl in cont.Controls)
        {
            if (ctrl is CheckBoxList)
            {
                ((CheckBoxList)ctrl).ClearSelection();
            }
        }
    }
    #endregion

}