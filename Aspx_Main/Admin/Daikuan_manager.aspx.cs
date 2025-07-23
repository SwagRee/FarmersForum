using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Aspx_Main_Admin_Daikuan_manager : System.Web.UI.Page
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

        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ds(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ds")
        {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            //方法一：
            int RowIndex = Convert.ToInt32(e.CommandArgument);

            SqlCommand cmd = new SqlCommand("update Daikuan_info set evolve='管理员已通过，请求提交银行'" + " where username = '" + 
                GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            Response.Redirect("/Aspx_Main/Admin/Daikuan_manager.aspx");
            cn.Close();
        }

    }
}