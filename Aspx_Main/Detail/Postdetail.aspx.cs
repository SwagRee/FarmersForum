using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_Detail_Postdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
        cn.Open();
        SqlCommand cmd = new SqlCommand("select publisher from tiezi_info where id='" + Request.QueryString["id"] + "'", cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        string value = ((Label)DataList1.Items[0].FindControl("publisherLabel")).Text;

        try
        {
            if (ds.Tables[0].Rows[0][0].ToString() == value)
            {
                lblLouzhu.Text = "楼主";
            }
            else
            {
                lblLouzhu.Text = "1";

            }
        }
        catch
        {

        }
        cn.Close();
    }


    protected void btnCallback(object sender, EventArgs e)
    {
        if (this.Session["username"]!=null && Request.QueryString["id"] != null) {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            SqlCommand cmd = new SqlCommand("select * from tiezi_callback where tiezi_id='" + Request.QueryString["id"] + "'", cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataRow dr = ds.Tables[0].NewRow();
            dr["publisher"] = this.Session["username"];
            dr["time"] = System.DateTime.Now.ToString();
            dr["tiezi_id"] = Request.QueryString["id"];
            dr["callback"] = txtCallback.Text;
            dr["floor"] = ds.Tables[0].Rows.Count + 2;

            ds.Tables[0].Rows.Add(dr);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.Update(ds);
            Response.Write("<script>alert('发帖成功!')</script>");
            Response.Redirect("/Aspx_Main/Detail/Postdetail.aspx?id="+ Request.QueryString["id"]);
        }
        else
        {
            Response.Write("<script>alert('请先登录!');window.location.href='/Aspx_Main/grzx.aspx'</script>");

        }

    }
}