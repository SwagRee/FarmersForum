<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.master" AutoEventWireup="true" CodeFile="Newsdetail.aspx.cs" Inherits="Aspx_Main_Detail_Newsdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        body {
            margin: 0;
        }

        .box {
            margin-left: 20%;
            margin-right: 20%;
            margin-top: 4rem;
        }

        .title{
            width:1000px;
            margin-left:300px
        }

        .title_inner {
            text-align:center
        }
        .time{
            position:absolute;
            left:1100px;
            top:173px
        }
    </style>
    <div class="box">
        <div class="title">
            <div class="title_inner">
                <h3>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div style="list-style: none; text-align: center;">
                            <%# Eval("title") %>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </h3>
            </div>
        </div>
        <hr />
        <div class="xinxi">
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div style="list-style: none; font-size:10px;margin-left:30px">
                        来源:<%# Eval("publisher") %></div>
                </ItemTemplate>
            </asp:DataList>
                        <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource1" CssClass="time">
                <ItemTemplate>
                    <div style="list-style: none; text-align: center; font-size:10px"">
                        发布时间:<%# Eval("submitdate") %></div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <hr />
        <div class="main">
            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div style="list-style: none; text-align: left;">
                        <%# Eval("xinwen_content") %>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" SelectCommand="SELECT * FROM [xinwen_info] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

