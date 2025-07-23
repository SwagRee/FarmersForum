<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.master" AutoEventWireup="true" CodeFile="Postdetail.aspx.cs" Inherits="Aspx_Main_Detail_Postdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .box {
            margin-left: 15%;
            margin-right: 15%;
        }

        .post {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
        }

        .post-header {
            display: flex;
            align-items: center;
        }

        .author-avatar {
            display: inline-block;
            width: 48px;
            height: 48px;
            margin-right: 10px;
        }

            .author-avatar img {
                display: block;
                width: 100%;
                height: auto;
                border-radius: 50%;
            }

        .author-info {
            font-size: 14px;
            color: #999;
        }

        .author-name {
            color: #333;
            text-decoration: none;
        }

        .post-time {
            margin-left: 10px;
        }

        .post-content {
            margin-top: 10px;
            font-size: 16px;
            line-height: 1.5;
        }

        .post-footer {
            margin-top: 10px;
            font-size: 14px;
            color: #999;
        }

        .reply-btn, .like-btn {
            display: inline-block;
            margin-right: 10px;
            color: #999;
            text-decoration: none;
        }

            .reply-btn:hover, .like-btn:hover {
                color: #333;
            }

        .reply-time {
            margin-left: 10px;
            display: inline-block;
            position: relative;
            top: 5px;
        }

        .title {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .reply-form {
            margin-top: 10rem;
        }

        .reply-content {
            width: 98%;
            height: 120px;
            padding: 10px;
            font-size: 14px;
            line-height: 1.5;
            border: 1px solid #dcdcdc;
            border-radius: 3px;
        }

        .btn-group {
            margin-top: 10px;
            text-align: right;
        }

        .btn-primary {
            display: inline-block;
            padding: 6px 16px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.5;
            color: #fff;
            background-color: #007bff;
            border: 1px solid #007bff;
            border-radius: 3px;
            cursor: pointer;
        }

        .btn-secondary {
            display: inline-block;
            margin-left: 10px;
            padding: 6px 16px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.5;
            color: #007bff;
            background-color: transparent;
            border: 1px solid #007bff;
            border-radius: 3px;
            cursor: pointer;
        }

        .separator {
            position: relative;
            height: 1px;
            margin: 20px 0;
            background: #ddd;
            border: none;
        }

        .reply-time1 {
        }

        .callbacktime {
            font-size: 0.9rem;
            color: grey;
            float: left;
        }

        .callfloor {
            font-size: 0.9rem;
            color: grey;
            margin-left: 180px;
        }
    </style>
    <div class="box">
        <div class="title">
            <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("title") %>' />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="post">
            <div class="post-header">
                <a href="#" class="author-avatar">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/User.jpg" />
                </a>
                <div class="author-info">
                    <a href="#" class="author-name">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />
                            </ItemTemplate>
                        </asp:DataList></a>
                    <asp:Label ID="lblLouzhu" runat="server" Text=""></asp:Label>
                    <span class="post-time">
                        <asp:DataList ID="DataList2" runat="server"></asp:DataList></span>
                </div>
            </div>
            <div class="post-content">
                <p>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>

                            <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("tiezi_content") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                </p>
            </div>
            <div class="post-footer">
                回复于
                <div class="reply-time">
                    <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <asp:Label ID="submitdateLabel" runat="server" Text='<%# Eval("submitdate") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                楼层 1
            </div>

        </div>
        <asp:Repeater ID="ReplyRepeater" runat="server" DataSourceID="SqlDataSource2">
            <HeaderTemplate>
                <div class="post">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="post-header">
                    <a href="#" class="author-avatar">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/User.jpg" />
                    </a>
                <div class="author-info">
                    <a href="#" class="author-name">
                                <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />

                    <asp:Label ID="lblLouzhu" runat="server" Text=""></asp:Label>
                    <span class="post-time">
                        <asp:DataList ID="DataList2" runat="server"></asp:DataList></span>
                </div>
                </div>
                <div class="post-content">
                    <p><%# Eval("callback") %></p>
                    <div class="callbacktime">回复于 <%# Eval("time") %></div>
                    <div class="callfloor">楼层 <%# Eval("floor") %></div>
                </div>


                <div class="separator"></div>


                <div class="reply-controls">
                    <asp:DataList ID="DataList1" runat="server">
                        <ItemTemplate>
                            <!-- 插入 DataList 显示模板 -->
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </ItemTemplate>

            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <div class="reply-form">
            <asp:TextBox ID="txtCallback" runat="server" class="reply-content"></asp:TextBox>

            <div class="btn-group">
                <asp:Button ID="Button1" runat="server" Text="发表回复" CssClass="btn btn-primary" OnClick="btnCallback" />
                <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-secondary" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" SelectCommand="SELECT * FROM [tiezi_info] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" SelectCommand="SELECT * FROM [tiezi_callback] WHERE ([tiezi_id] = @tiezi_id) ORDER BY [floor]">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="tiezi_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

