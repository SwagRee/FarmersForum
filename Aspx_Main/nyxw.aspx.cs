using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Aspx_Main_nyxw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
        cn.Open();
        SqlCommand cmd = new SqlCommand("select * from xinwen_info ", cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblNumber.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            Response.Write("<script>alert('目前还没有内容哦!')</script>");
        }
    }
}