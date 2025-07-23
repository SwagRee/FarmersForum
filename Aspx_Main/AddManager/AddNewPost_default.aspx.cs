using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Aspx_Main_AddManager_AddNewPost_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (this.Session["flag"] == null)
        {
            Response.Redirect("~/Aspx_LoginAndReg/Login.aspx");
        }
        else if (this.Session["flag"].Equals("ok"))
        {
            if (this.Session["permission"].Equals("0"))
            {

            }
            else
            {
                Response.Write("<script>alert('您还没有发帖权限');window.location.href='/Aspx_Main/AddManager/ApplyPost.aspx';</script>");

            }
        }
    }

    protected void btnClick(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection("Data Source=.;Initial Catalog=Farmers_db;Integrated Security=True");

        SqlCommand cmd = new SqlCommand("select * from tiezi_info where title='" + txtTitle.Text + "'and tiezi_content='" + txtContent.Text + "'", cn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script>alert('帖子发布失败')</script>");
        }
        else
        {
            DataRow dr = ds.Tables[0].NewRow();
            dr["categoryid"] = DropDownList1.SelectedValue;
            dr["title"] = txtTitle.Text;
            dr["tiezi_content"] = txtContent.Text;
            dr["submitdate"] = System.DateTime.Now.ToString();
            dr["publisher"] = this.Session["username"].ToString();

            //string path = "/upload/";
            //FileUpload1.PostedFile.SaveAs(Server.MapPath("/upload") + FileUpload1.FileName);
            //path += FileUpload1.FileName;

            //dr["picture"] = path;

            ds.Tables[0].Rows.Add(dr);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.Update(ds);
            Response.Write("<script>alert('帖子发布成功!');window.location.href='/Aspx_Main/xdlt.aspx'</script>");
            cn.Close();
        }
    }
}