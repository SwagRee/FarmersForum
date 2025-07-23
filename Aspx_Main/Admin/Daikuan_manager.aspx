<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Manager.master" AutoEventWireup="true" CodeFile="Daikuan_manager.aspx.cs" Inherits="Aspx_Main_Admin_Daikuan_manager" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">

    <!DOCTYPE html>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* 顶部导航栏样式 */
        .navbar {
            background-color: #fff;
            box-shadow: 0 1px 3px rgba(0,0,0,.1);
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: 600;
            color: #666;
        }

        .navbar-nav .nav-link {
            font-weight: 500;
            color: #666;
        }

            .navbar-nav .nav-link:hover, .navbar-nav .nav-link:focus {
                color: #007bff;
            }
        /* 左侧菜单样式 */
        .sidebar {
            position: fixed;
            top: 56px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            padding: 20px 0;
            overflow-x: hidden;
            overflow-y: auto;
            border-right: 1px solid #eee;
        }

        .sidebar-heading {
            font-size: 18px;
            padding: 10px 15px;
            font-weight: 600;
            text-transform: uppercase;
            color: #333;
        }

        .list-group-item-action:hover, .list-group-item-action:focus {
            color: #333;
            background-color: #eee;
        }
        /* 主内容区域 */
        .content-wrapper {
            margin-left: 250px;
            padding-top: 50px;
            min-height: 100vh;
        }
    </style>
    </head>
    <body>
        <!-- 顶部导航栏 -->
        <nav class="navbar navbar-expand-md">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" style="margin-left:150px">助农服务后台管理系统</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mr-auto"></ul>
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="#"><i class="fas fa-user-circle"></i>
                                <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 左侧菜单 -->
        <div class="sidebar">
            <h6 class="sidebar-heading" style="margin-left:30px;margin-bottom:20px;position:relative;top:-15px;">菜单</h6>
            <div class="list-group">
                <a href="/Aspx_Main/Admin/Admin_manager.aspx" class="list-group-item list-group-item-action"><i class="fas fa-tachometer-alt"></i>个人中心</a>
                <a href="/Aspx_Main/Admin/User_manager.aspx" class="list-group-item list-group-item-action"><i class="fas fa-users"></i>用户管理</a>
                <a href="/Aspx_Main/Admin/New_manager.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>新闻管理</a>
                <a href="/Aspx_Main/Admin/Port_manager.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>帖子管理</a>
                <a href="/Aspx_Main/Admin/Permission_manager.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>权限管理</a>
                <a href="/Aspx_Main/Admin/Daikuan_manager.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>贷款管理</a>
                <a href="/Aspx_LoginAndReg/UpdatePassword.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>修改密码</a>
                <a href="/Aspx_LoginAndReg/Logout.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>注销账号</a>
            </div>
        </div>
        <!-- 主内容区域 -->
        <div class="content-wrapper">
            <div class="container-fluid">
                <h1 class="mt-4"  style="position:relative;top:-25px">贷款管理</h1>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card mb-4" style="width: 1440px">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>表格</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" BorderColor="#13619c" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="4" ForeColor="black" HorizontalAlign="Center" CssClass="auto-style1" Height="287px" Width="1141px" OnRowCommand="ds">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="序号" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="username" HeaderText="用户名" SortExpression="username" />

                                            <asp:BoundField DataField="money" HeaderText="金额" SortExpression="money" />
                                            <asp:BoundField DataField="reason" HeaderText="原因" SortExpression="reason" />
                                            <asp:BoundField DataField="people_id" HeaderText="身份证号" SortExpression="people_id" />
                                            <asp:BoundField DataField="extra_info" HeaderText="辅佐证明" SortExpression="extra_info" />
                                            <asp:BoundField DataField="evolve" HeaderText="状态" SortExpression="evolve" />


                                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />

                                            <asp:ButtonField Text="通过" HeaderText="通过" CommandName="ds" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Farmers_dbConnectionString %>" DeleteCommand="DELETE FROM [Daikuan_info] WHERE [id] = @id" InsertCommand="INSERT INTO [Daikuan_info] ([username], [password], [keys]) VALUES (@username, @password, @keys)" SelectCommand="SELECT * FROM [Daikuan_info]" UpdateCommand="UPDATE [Daikuan_info] SET [username] = @username, [money] = @money, [reason] = @reason, [people_id] = @people_id, [extra_info] = @extra_info,[evolve] = @evolve WHERE [id] = @id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="username" Type="String" />
                                            <asp:Parameter Name="password" Type="String" />
                                            <asp:Parameter Name="keys" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="username" Type="String" />
                                            <asp:Parameter Name="password" Type="String" />
                                            <asp:Parameter Name="keys" Type="String" />
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>

        <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

    </body>
    </html>

</asp:content>
