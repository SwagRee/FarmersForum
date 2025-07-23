<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.master" AutoEventWireup="true" CodeFile="nyxw.aspx.cs" Inherits="Aspx_Main_nyxw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html>
    <head>
        <meta charset="UTF-8">
        <title>模拟论坛</title>
        <style type="text/css">
            /*对网页进行第二次修饰*/
            body {
                font-size: 12px;
            }
            /*对整个标签,和表格 设置宽度为990像素*/
            #discuss, #discuss-datas {
                width: 930px;
            }

                #discuss div.mt {
                    /*高度,边框,背景*/
                    height: 30px;
                    border: 1px solid #DDDDDD;
                    border-top: 2px solid #999999;
                    background: #f7f7f7;
                }

            #discuss-content {
                border-bottom: 1px solid #DDDDDD;
            }

            #discuss-datas tr.header td {
                /*加粗 上下内边距 下边框*/
                font-weight: bold;
                padding: 5px 0;
                color: #666666;
            }

            #discuss-datas td {
                /*内容水平居中对齐*/
                text-align: center;
            }

                #discuss-datas td.col1 {
                    /*宽度,文本左对齐*/
                    width: 600px;
                    text-align: left;
                    z-index: 9999;
                }

            #discuss-datas tbody td {
                /*文本颜色*/
                color: #9c9c9c;
            }

            #discuss a {
                /*改链接颜色 去掉下划线*/
                text-decoration: none;
                color: #005aa0;
            }

                #discuss a:hover {
                    text-decoration: underline;
                }

            #discuss-datas tbody td {
                /*上下内边距 下边框*/
                padding: 5px 0px;
            }
            /*给论坛内容加标签 加图标*/
            #discuss i {
                /*左内边距 下内边距高度 背景图*/
                padding-left: 21px;
                background: url(img/c63802c9ee7e4ddec0e53e152e665ea.png) no-repeat;
                background-size: 100%;
            }

            #discuss div.mt a {
                float: left;
                width: 100px;
                height: 30px;
                text-align: center;
                line-height: 30px;
            }

                #discuss div.mt a:hover {
                    text-decoration: none;
                    color: #E4393C;
                }

                #discuss div.mt a.current {
                    border: 1px solid #DDDDDD;
                    border-top: 2px solid #E4393C;
                    border-bottom: 0;
                    background: #ffffff;
                    margin-top: -6px;
                    height: 35px;
                    line-height: 35px;
                    color: #E4393C;
                }

            #discuss {
                margin: 0 20% 0 20%;
            }

            .zhuti {
                margin-left: 0px;
                position: relative;
                right: 230px;
                bottom: 13px;
            }

            .fabu {
                position: relative;
                right: 130px;
                bottom: 13px;
            }

            .time {
                position: relative;
                right: 145px;
                bottom: 13px;
            }

            .header {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <!--论坛div-->
        <div id="discuss">

            <!--讨论内容-->
            <div id="discuss-content">
                <!--表格内容-->
                <table id="discuss-datas">
                    <!--标题栏-->
                    <tr class="header">
                        <td class="zhuti">新闻主题</td>
                        <td class="fabu">新闻发布者</td>
                        <td class="time">时间</td>
                    </tr>
                    <!--内容栏-->
                    <tbody>
                        <tr>
                            <td class="col1">
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/Aspx_Main/Detail/Newsdetail.aspx?id="+Eval("id") %>' Text='<%# Eval("title") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td>
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("publisher") %>'></asp:HyperLink>

                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td>
                                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("submitdate") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!--显示的拓展内容-->
                <div id="discuss-total">
                    <div class="all_discuss">
                        <br />
                        共<asp:Label ID="lblNumber" runat="server" Text=""></asp:Label>条新闻
					
                        <a href="#">浏览全部新闻>>></a>
                    </div>
                </div>
            </div>

        </div>
    </body>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" SelectCommand="SELECT * FROM [xinwen_info]"></asp:SqlDataSource>

    </html>
</asp:Content>

