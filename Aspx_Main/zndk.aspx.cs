using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_zndk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (this.Session["flag"] == null)
        {
            Response.Write("<script>alert('您还没有登录或身份信息已过期，请重新登录!')</script>");
            Response.Redirect("~/Aspx_LoginAndReg/Login.aspx");
        }
        else if (this.Session["flag"].Equals("ok"))
        {
            lblUsername.Text = this.Session["username"].ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");

        SqlCommand cmd = new SqlCommand("select * from Daikuan_info where username='" + this.Session["username"].ToString() + "'", cn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script>alert('贷款失败,您已经申请过贷款了')</script>");
        }
        else
        {
            DataRow dr = ds.Tables[0].NewRow();
            dr["username"] = this.Session["username"];
            dr["money"] = txtMoney.Text;
            dr["people_id_category"] = DropDownList2.SelectedValue;
            dr["reason"] = txtReason.Text;
            dr["people_id"] = txtPeopleID.Text;
            dr["extra_info"] = txtExtra.Text;
            dr["evolve"] = "待处理";


            ds.Tables[0].Rows.Add(dr);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.Update(ds);
            Response.Write("<script>alert('贷款申请成功!');window.location.href='/Aspx_Main/grzx.aspx'</script>");
            cn.Close();
        }


    }
}