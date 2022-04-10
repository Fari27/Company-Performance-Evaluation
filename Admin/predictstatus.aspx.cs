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
using System.Web.Services;
using System.Collections;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //  ddlmod.AppendDataBoundItems = true;
            ddlpro.AppendDataBoundItems = true;

        }
    }


    [WebMethod]
    public static ArrayList workcompleted(string wid)
    {

        ArrayList ar = new ArrayList();
       double [] dr = new double[10];

        Connection c = new Connection();

        c.cmd = new MySqlCommand("SELECT Alloted_date FROM workallot WHERE (W_id='" + wid + "')", c.connect());


        string dt = c.cmd.ExecuteScalar().ToString();
        DateTime d = Convert.ToDateTime(dt);


        int dd = d.Day; int ddd = DateTime.Now.Day; int ddiff = System.Math.Abs(ddd - dd);
        int mm = d.Month; int mmm = DateTime.Now.Month; int mdif = System.Math.Abs(mmm - mm);

        int yy = d.Year; int yyy = DateTime.Now.Year; int ydif = System.Math.Abs(yyy - yy);


        int totaldays = ddiff + (25 * mdif) + (275 * ydif);
         
        double totalweeks = Convert.ToDouble(totaldays )/ 7;
       
      


        c.cmd = new MySqlCommand("SELECT avg(status) FROM unit WHERE (wid= @wid)  ", c.connect());
        c.cmd.Parameters.AddWithValue("@wid", wid);
        MySqlDataReader ds;
        ds = c.cmd.ExecuteReader();

        
        while (ds.Read())
        {
            if (totaldays < 7)
            {
                if(ddiff==0)

                {   int rd=Convert.ToInt16(ds[0]);
                    
                    dr[0]=Convert.ToInt16(ds[0])+(7*rd);
                if (dr[0] > 100)
                {

                    dr[0] = 100;
                
                
                }







                }
                    
                else{
 

                double onedaywork=Convert.ToInt16(ds[0])/ddiff;

                dr[0] = Convert.ToInt16(ds[0].ToString()) + (onedaywork * 7);

                if (dr[0]> 100)
                {
                    dr[0] = 100;

                }
                



                }



                workstatus os = new workstatus();

                os.pri = (dr[0].ToString());
                ar.Add(os);



            }

            else
            {


                double oneweekstatus = Convert.ToDouble(ds[0]) / Convert.ToDouble(totalweeks);

                double comingweekstatus = Convert.ToDouble(ds[0].ToString()) + (oneweekstatus);
                if (comingweekstatus > 100)
                {
                    dr[0] = 100;

                }
                else
                {
                    dr[0] = Convert.ToInt32(comingweekstatus);


                }
                workstatus os = new workstatus();

                os.pri = (dr[0].ToString());
                ar.Add(os);






            }
        }


        return ar;
    }

    [WebMethod]
    public static ArrayList moduledtls(string wid)
    {

        ArrayList ar = new ArrayList();

        Connection c = new Connection();
        c.cmd = new MySqlCommand("SELECT Alloted_date,wstatus FROM workallot where w_id=@w_id  ", c.connect());
        c.cmd.Parameters.AddWithValue("@w_id", wid);
        MySqlDataReader dr;
        dr = c.cmd.ExecuteReader();

        while (dr.Read())
        {

            modulestatus ms = new modulestatus();
            ms.mname = dr[0].ToString();
            ms.mstatus = dr[1].ToString();
            ar.Add(ms);
        }



        return ar;
    }



    public class workstatus
    {
        public string pri { get; set; }
    }

    public class modulestatus
    {
        public string mname { get; set; }
        public string mstatus { get; set; }

    }




}