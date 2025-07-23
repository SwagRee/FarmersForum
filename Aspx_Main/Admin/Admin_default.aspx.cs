using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Aspx_Main_Admin_Admin_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["flag"] == null)
        {
            Response.Redirect("~/Aspx_LoginAndReg/Login.aspx");
        }
        else if (this.Session["flag"].Equals("ok"))
        {
            lblUserName.Text = this.Session["username"].ToString();
            lblUserName2.Text= this.Session["username"].ToString();
            if (this.Session["keys"].Equals("1"))
            {
                lblSF.Text="普通用户";
            }
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            SqlCommand cmd = new SqlCommand("select permission from User_info where username='" + this.Session["username"] + "'", cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows[0][0].Equals("1"))
            {
                lblQuanxian.Text = "无";
            }
            else
            {
                lblQuanxian.Text = "有";
            }
            cn.Close();

        }
    }
}