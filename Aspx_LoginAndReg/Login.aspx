<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/LoginAndReg.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .cbx{
            margin-right:400px
        }
    </style>
    <body>
        <link href="../Css/Login.css" rel="stylesheet" />
        <div class="box">
            <div class="left">
            </div>
            <div class="right">
                <!-- 登录主界面 -->
                <h4>登录界面</h4>
                <asp:TextBox ID="txtUsername" runat="server" Class="input" placeholder="用户名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Class="tip1" ErrorMessage="您没有输入用户名" BorderColor="#CC0000" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPassword" runat="server" Class="input" TextMode="Password" placeholder="密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Class="tip2" ErrorMessage="您没有输入密码" BorderColor="#CC0000" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
                <asp:CheckBox ID="cbx" runat="server" cssClass="cbx" Text="记住密码"/>
                <asp:Button ID="btnLogin" runat="server" Class="button" Text="登录" OnClick="btnLogin_Click" />
                <div class="more">
                    <a href="Register.aspx">注册账号</a>
                    <a href="/Aspx_Main/index.aspx">浏览首页</a>
                </div>
            </div>
        </div>
    </body>
</asp:Content>


