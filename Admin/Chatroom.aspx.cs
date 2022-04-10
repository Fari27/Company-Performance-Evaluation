using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;




public partial class Admin_Default : System.Web.UI.Page
{

    public static string uname, toid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //  ddlmod.AppendDataBoundItems = true;
            ddlpro.AppendDataBoundItems = true;

        }
    
      //  toid = Request.QueryString["Email"].ToString();
        uname = Session["user"].ToString();
        hdntoid.Value = toid;
            // HiddenField1.Value= Request.QueryString["Photo"].ToString();
    }

    [WebMethod]
    public static ArrayList ChatMessages(string wid)
    {

        ArrayList ar = new ArrayList();

        Connection c = new Connection();
        //List<onlineusers> or = new List<onlineusers>();
        c.cmd = new MySqlCommand("select * from chat WHERE (fid=@uname AND tid=@toid or fid=@toid AND tid=@uname)  order by cid asc", c.connect());
        c.cmd.Parameters.AddWithValue("@toid", wid);
        c.cmd.Parameters.AddWithValue("@uname", uname);

        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();
        while (dr.Read())
        {

            Messages s = new Messages();
            s.Me = dr[1].ToString();
            s.You = dr[2].ToString();
            s.Message = dr[3].ToString();

            s.Date = Convert.ToDateTime(dr[4].ToString());
            ar.Add(s);
        }
        c.con.Close();
        ar.Reverse();
        return ar;
    }

    [WebMethod]
    public static string InsertMessages(string me, string you, string msg)
    {



        Connection c = new Connection();
        //List<onlineusers> or = new List<onlineusers>();
        c.cmd = new MySqlCommand("insert into  chat values(@fid,@tid,@msg,getdate())", c.connect());
        c.cmd.Parameters.AddWithValue("@fid", me);
        c.cmd.Parameters.AddWithValue("@tid", you);
        c.cmd.Parameters.AddWithValue("@msg", msg);
        c.cmd.ExecuteNonQuery();
        string ar = "success";

        return ar;
    }
    public class Messages
    {
        public string Me { get; set; }
        public string You { get; set; }
        public string Message { get; set; }
        public int ReadStatus { get; set; }
        public DateTime Date { get; set; }
    }
}