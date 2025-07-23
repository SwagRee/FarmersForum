using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_AddManager_AddNewPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (this.Session["keys"].Equals("2"))
        {
            Response.Redirect("/Aspx_Main/AddManager/AddNewPost_admin.aspx");
        }
        else if (this.Session["flag"].Equals("ok"))
        {
            Response.Redirect("/Aspx_Main/AddManager/AddNewPost_default.aspx");

        }

    }

}