using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_Main_grzx : System.Web.UI.Page
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
            else if (this.Session["keys"].Equals("2"))

            {
                Response.Redirect("/Aspx_Main/Admin/Admin_Manager.aspx");

            }
        }
    }
}