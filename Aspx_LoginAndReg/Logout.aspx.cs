﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_LoginAndReg_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["flag"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (this.Session["flag"].ToString() == "ok")
        {
            this.Session["flag"] = null;
            Response.Redirect("login.aspx");
        }
    }
}