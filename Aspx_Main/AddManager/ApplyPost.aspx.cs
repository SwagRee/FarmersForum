using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_AddManager_ApplyPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (this.Session["flag"] == null)
        {
            Response.Redirect("~/Aspx_LoginAndReg/Login.aspx");
        }
        else if (this.Session["flag"].Equals("ok"))
        {
            lblUserName.Text = this.Session["username"].ToString();
            lblUsername2.Text = this.Session["username"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");

        SqlCommand cmd = new SqlCommand("select * from applyPost where username='" + this.Session["username"] + "'" , cn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script>alert('您已经申请过了!');window.location.href='/Aspx_Main/Admin/Admin_default.aspx'</script>");
        }
        else
        {
            DataRow dr = ds.Tables[0].NewRow();
            dr["username"] = this.Session["username"];
            dr["reason"] = txtContent.Text;
            dr["status"] = "申请中";



            ds.Tables[0].Rows.Add(dr);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.Update(ds);
            Response.Write("<script>alert('已为你提交发布帖子权限的申请!');window.location.href='/Aspx_Main/Admin/Admin_default.aspx'</script>");
            cn.Close();
        }
    }
}