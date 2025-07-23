using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_Admin_manager : System.Web.UI.Page
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

            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            SqlCommand cmd = new SqlCommand("select * from User_info", cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            try
            {
                if (GridView1.Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        if (GridView1.Rows[i].Cells[3].Text.ToString().Equals("2".Trim()))
                        {
                            GridView1.Rows[i].Cells[3].Text = "管理员";
                        }
                        else if (GridView1.Rows[i].Cells[3].Text.ToString().Equals("1".Trim()))
                        {
                            GridView1.Rows[i].Cells[3].Text = "普通用户";
                        }
                    }
                }
            }
            catch {
            }
        }
    }
    protected void gly(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "gly")
        {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            //方法一：
            int RowIndex = Convert.ToInt32(e.CommandArgument);

            SqlCommand cmd = new SqlCommand("update User_info set keys='2'" + " where username = '" +
                GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            cmd.ExecuteNonQuery();
            Response.Redirect("/Aspx_Main/Admin/User_manager.aspx");
            cn.Close();
        }
        else if (e.CommandName == "gly1")
        {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            //方法一：
            int RowIndex = Convert.ToInt32(e.CommandArgument);

            SqlCommand cmd = new SqlCommand("update User_info set keys='1'" + " where username = '" +
                GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            cmd.ExecuteNonQuery();
            Response.Redirect("/Aspx_Main/Admin/User_manager.aspx");
            cn.Close();
        }

    }



    protected void btnQuery_Click(object sender, EventArgs e)
    {
        string sql = "select * from User_info";
        if (txtValue.Text.Trim().Length != 0)
        {
            sql = sql + " where " + DropDownList1.SelectedValue + " like '%" + txtValue.Text.Trim() + "%' ";
            SqlDataSource1.SelectCommand = sql;
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        }
        else
        {
        }
    }
}