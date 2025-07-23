using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    HttpCookie cookie = new HttpCookie("LoginInfo");

    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        HttpCookie login = Request.Cookies["Login"]; //获取客户端返回的Cookies中名称为Login的Cookie对象
        if (login != null)
        {
            txtUsername.Attributes["value"] = login["username"]; //读取Login中属性值
            txtPassword.Attributes["value"] = login["password"];
        }
        else
        {
        }

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
        cn.Open();
        SqlCommand cmd = new SqlCommand("select * from User_info where username='" + txtUsername.Text +
            "' and password='" + txtPassword.Text + "'", cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (cbx.Checked == true)
            {
                HttpCookie keepCookie = new HttpCookie("Login"); //创建一个HttpCookie实例，Cookies名称为Login，实例只是一个容器，真正使用的是Cookie名称
                keepCookie["username"] = txtUsername.Text; //向Login中添加一个userName属性，并赋值
                keepCookie["password"] = txtPassword.Text; //向Login中添加一个userName属性，并赋值

                keepCookie.Expires = DateTime.Now.AddDays(2); //设定Cookies的有效期为两天
                Response.Cookies.Add(keepCookie); //把Cookies对象返回给客户端

            }
            Response.Write("<script>alert('登录成功！')</script>");
            this.Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
            this.Session["password"] = ds.Tables[0].Rows[0]["password"].ToString();
            this.Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
            this.Session["flag"] = "ok";
            this.Session["keys"] = ds.Tables[0].Rows[0]["keys"].ToString();
            this.Session["permission"] = ds.Tables[0].Rows[0]["permission"].ToString();
            Response.Redirect("/Aspx_Main/grzx.aspx");
        }
        else
        {
            Response.Write("<script>alert('用户名或密码错误，登录失败!')</script>");
        }
        cn.Close();
    }
}