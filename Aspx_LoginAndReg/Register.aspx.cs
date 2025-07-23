using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");
        cn.Open();
        SqlCommand cmd = new SqlCommand("select * from User_info where username='" + txtUsername.Text + "'", cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds); 
        if (ds.Tables[0].Rows.Count > 0)
        {
            this.txtUsername.Text = "已经存在这个用户名，请重新取名!";
        }
        else
        {
            DataRow dr = ds.Tables[0].NewRow();
            dr["username"] = txtUsername.Text;
            dr["password"] = txtPassword.Text;
            dr["keys"] = 1;
            dr["permission"] = 1;




            ds.Tables[0].Rows.Add(dr);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.Update(ds);
            Response.Write("<script>alert('注册成功!');window.location.href='/Aspx_LoginAndReg/Login.aspx'</script>");
            HttpCookie keepCookie = new HttpCookie("Login"); //创建一个HttpCookie实例，Cookies名称为Login，实例只是一个容器，真正使用的是Cookie名称
            keepCookie["username"] = txtUsername.Text; //向Login中添加一个userName属性，并赋值
            keepCookie["password"] = txtPassword.Text; //向Login中添加一个userName属性，并赋值

            keepCookie.Expires = DateTime.Now.AddDays(2); //设定Cookies的有效期为两天
            Response.Cookies.Add(keepCookie); //把Cookies对象返回给客户端


        }
    }







}