<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.master" AutoEventWireup="true" CodeFile="zndk.aspx.cs" Inherits="Aspx_Main_zndk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <html>
    <head>
        <meta charset="UTF-8">
        <title>个人中心页面</title>
        <style>
            body {
                background: url("image/register_bg.png") no-repeat;
                background-size: 100%;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .center-arrow {
                width: 680px;
                height: 750px;
                border: 4px solid #EEEEEE;
                background-color: white;
                margin: auto;
                margin-top: 40px;
                border-radius: 10px;
            }

            .right-arrow {
                float: right;
                margin: 15px;
            }

            .center-arrow_1 {
                float: left;
                margin-top: 45px;
                margin-left: 130px;
            }

            .left-arrow {
                float: left;
            }

            .p1 {
                color: Highlight;
                font-size: 30px;
            }

            .p2 {
                font-size: 20px;
            }

            .p3 {
                text-align: right;
                line-height: 50px;
                font-size: 20px;
            }

            .p4 {
                padding-left: 20px;
            }

            #username, .tel, #yzm, #password, #email, #birthday {
                padding-left: 10px;
            }

            .btn_save {
                width: 30%;
                height: 40px;
                font-weight: 200;
                font-size: 1rem;
                background-image: linear-gradient(120deg, #808080 0%, #808080 100%);
                border: none;
                margin-top: 3rem;
                border-radius: 0.5rem;
                transition: all .3s;
                color: aliceblue;
                margin-left: 30px;
            }

            .auto-style1 {
                padding-left: 20px;
                width: 215px;
            }
        </style>
    </head>
    <body>
        <div class="arrow_1">
            <div class="center-arrow">
                <div class="left-arrow">
                    <p class="p1">贷款申请</p>
                </div>
                <div class="center-arrow_1">
                    <form action="#" method="post">
                        <table>
                            <tr>
                                <td align="center" class="p3">
                                    <label for="username">用户名:</label></td>
                                <td class="auto-style1">
                                    <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                            </tr>
                            <tr>
                                <td align="center" class="p3">
                                    <label for="tel">手机号码:</label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtPhone" runat="server" Class="input" placeholder="请输入手机号码" CssClass="tel"></asp:TextBox>

                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="您还没有输入手机号" ControlToValidate="txtPhone"></asp:RequiredFieldValidator></td>
                            </tr>

                            <tr>
                                <td class="p3">
                                    <label for="people_id">证件信息选择:</label></td>

                                <td class="auto-style1">
                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                        <asp:ListItem Value="1">国内身份证</asp:ListItem>
                                        <asp:ListItem Value="2">港澳台身份证</asp:ListItem>
                                        <asp:ListItem Value="3">护照</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="您还没有输入证件号" ControlToValidate="txtPeopleID"></asp:RequiredFieldValidator></td>
                            </tr>

                            <tr>
                                <td class="p3">
                                    <label for="people_id">身份证号:</label></td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtPeopleID" runat="server" Class="input" placeholder="请输入证件号" CssClass="tel"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="您还没有输入证件号" ControlToValidate="txtPeopleID"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="p3">
                                    <label for="category">从事农业类别:</label></td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="sf" DataValueField="sf" CssClass="tel">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" SelectCommand="SELECT [id], [sf] FROM [Farmer_category]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="p3">
                                    <label for="money">贷款金额:</label></td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtMoney" runat="server" Class="input" placeholder="请输入贷款金额" CssClass="tel"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="您还没有输入贷款金额" ControlToValidate="txtMoney"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="p3">
                                    <label for="reason">贷款原因:</label></td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtReason" runat="server" Class="input" placeholder="" CssClass="tel" Height="80px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="您还没有输入贷款原因" ControlToValidate="txtReason"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="p3">
                                    <label for="extra">辅助证明材料:</label></td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtExtra" runat="server" Class="input" placeholder="" CssClass="tel" Height="80px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="您还没有输入辅助证明材料" ControlToValidate="txtExtra"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="btnSave" runat="server" Text="申请" CssClass="btn_save" OnClick="btnSave_Click" />
                                    <asp:Button ID="Button1" runat="server" Text="取消" CssClass="btn_save" />

                                </td>
                            </tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</asp:Content>

