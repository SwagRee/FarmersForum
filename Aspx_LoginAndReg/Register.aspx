<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/LoginAndReg.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <body>
        <link href="../Css/Register.css" rel="stylesheet" />
        <div class="box">
            <div class="left">

            </div>
            <div class="right">
                <!-- 登录主界面 -->
                <h4>注册界面</h4>
                <asp:TextBox ID="txtUsername" runat="server" Class="input" placeholder="用户名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Class="tip1" ErrorMessage="您没有输入用户名" BorderColor="#CC0000" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPassword" runat="server" Class="input" TextMode="Password" placeholder="密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Class="tip2" ErrorMessage="您没有输入密码" BorderColor="#CC0000" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPasswordContain" runat="server" Class="input" TextMode="Password" placeholder="请再次输入密码"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Class="tip3" ErrorMessage="您输入的两次密码不一致！" ControlToCompare="txtPassword" ControlToValidate="txtPasswordContain" Display="Dynamic"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Class="tip4" ErrorMessage="您没有再次输入密码!" ControlToValidate="txtPasswordContain" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" SelectCommand="SELECT * FROM [User_info]"></asp:SqlDataSource>
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
                <asp:Button ID="btnLogin" runat="server" Class="button" Text="注册" OnClick="btnLogin_Click"/>
                <div class="more">
                    <a href="Login.aspx">登录账号</a>
                    <a href="RetrievePassword.aspx">找回密码</a>
                </div>
            </div>
        </div>
    </body>
</asp:Content>

