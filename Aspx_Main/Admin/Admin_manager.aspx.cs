using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_Main_Admin_Admin_manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (this.Session["flag"] == null)
        {
            Response.Redirect("~/Aspx_LoginAndReg/Login.aspx");
        }
        else if (this.Session["flag"].Equals("ok"))
        {
            if (this.Session["keys"].Equals("1"))
            {
                Response.Redirect("/Aspx_Main/Admin/Admin_default.aspx");
            }
            else
            {
                lblUserName.Text = this.Session["username"].ToString() ;
                lblUserName2.Text = this.Session["username"].ToString();

                if (this.Session["keys"].Equals("2"))
                {
                    lblSF.Text = "管理员";
                    lblQuanxian.Text = "有";
                }
            }
        }
    }
}