using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_LoginAndReg_UpdatePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        labelUsername.Text = this.Session["username"].ToString();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtAfterPassword.Text == txtAfterPasswordContain.Text)
        {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            SqlCommand cmd = new SqlCommand("update User_info set password='" + txtAfterPassword.Text+ "'where username='" + this.Session["username"].ToString() + "'", cn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('密码修改成功');window.location.href='/Aspx_Main/grzx.aspx'</script>");
            cn.Close();
        }
        else
        {
            Response.Write("<script>alert('两次密码不一致，请重新输入！')</script>");
        }
    }
}