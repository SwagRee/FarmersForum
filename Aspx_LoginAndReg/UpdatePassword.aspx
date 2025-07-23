<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/LoginAndReg.master" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="Aspx_LoginAndReg_UpdatePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <body>
        <link href="../Css/UpdatePassword.css" rel="stylesheet" />
        <div class="box">
            <div class="left">
                <div class="left">
                    <div class="people" style="font-size: 2.3rem; position: relative; left: 12rem; top: 27%"><a href="/Aspx_Main/grzx.aspx" style="text-decoration: none;">个人信息</a></div>
                    <div class="people" style="font-size: 2.3rem; position: relative; left: 12rem; top: 30%"><a href="/Aspx_LoginAndReg/UpdatePassword.aspx" style="text-decoration: none;">修改密码</a></div>
                    <div class="people" style="font-size: 2.3rem; position: relative; left: 12rem; top: 33%"><a href="/Aspx_LoginAndReg/Logout.aspx" style="text-decoration: none;">注销</a></div>
                </div>
            </div>
            <div class="right">
                <!-- 登录主界面 -->
                <h4>修改密码界面</h4>
                <asp:Label ID="labelUsername" runat="server" Class="input" placeholder="用户名"></asp:Label>

                <asp:TextBox ID="txtAfterPassword" runat="server" Class="input2" placeholder="修改后的密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Class="tip5" ErrorMessage="您没有输入修改后的密码" BorderColor="#CC0000" ControlToValidate="txtAfterPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtAfterPasswordContain" runat="server" Class="input2" placeholder="请再次输入修改后的密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Class="tip5" ErrorMessage="您没有再次输入修改后的密码" BorderColor="#CC0000" ControlToValidate="txtAfterPasswordContain" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致" ControlToCompare="txtAfterPassword" ControlToValidate="txtAfterPasswordContain"></asp:CompareValidator>
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
                <asp:Button ID="btnLogin" runat="server" Class="button" Text="修改密码" OnClick="btnLogin_Click" />
                <div class="more">
                    <a href="Login.aspx">登录账号</a>
                    <a href="RetrievePassword.aspx">找回密码</a>
                </div>
            </div>
        </div>
    </body>
</asp:Content>

