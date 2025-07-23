using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_Main_Admin_New_manager : System.Web.UI.Page
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

    protected void btnAddNews_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Aspx_Main/AddManager/AddNews.aspx");

    }
}