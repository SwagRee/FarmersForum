using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_Admin_Permission_manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void permission(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "permission1")
        {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            //方法一：
            int RowIndex = Convert.ToInt32(e.CommandArgument);

            SqlCommand cmd = new SqlCommand("update User_info set permission='0'" + " where username = '" +
                GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            SqlCommand cmd2 = new SqlCommand("update applyPost set status='通过'" + " where username = '" +
GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();

            Response.Redirect("/Aspx_Main/Admin/Permission_manager.aspx");
            cn.Close();
        }
        else if (e.CommandName == "permission2")
        {
            SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
            cn.Open();
            //方法一：
            int RowIndex = Convert.ToInt32(e.CommandArgument);

            SqlCommand cmd = new SqlCommand("update User_info set permission='1'" + " where username = '" +
                GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            SqlCommand cmd2 = new SqlCommand("update applyPost set status='申请中'" + " where username = '" +
    GridView1.Rows[RowIndex].Cells[1].Text + "'", cn);
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            Response.Redirect("/Aspx_Main/Admin/Permission_manager.aspx");
            cn.Close();
        }

    }
}