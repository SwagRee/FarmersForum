<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Manager.master" AutoEventWireup="true" CodeFile="ApplyPost.aspx.cs" Inherits="Aspx_Main_AddManager_ApplyPost" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                .borders {
            width: 200px;
            height: 30px;
            border: 0px;
            background-color: white;
            border-radius: 25px;
        }

        .btnborder {
            width: 100px;
            height: 40px;
            border: 0px;
            background-color: #13619C;
            border-radius: 15px;
            color: white;
            font-size: 18px;
            letter-spacing: 8px;
            text-align: center;
            font-weight: bold;
        }

        .main {
            margin-top: 80px;
            font-size: 22px;
            color: #13619C;
            font-weight: bold;
            line-height: 30px;
            margin-left:30%;
        }
    </style>
    </head>
    <body>
        <!-- 顶部导航栏 -->
        <nav class="navbar navbar-expand-md">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" style="margin-left: 150px">个人管理中心</a>
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
            <h6 class="sidebar-heading" style="margin-left: 30px; margin-bottom: 20px; position: relative; top: -15px;">菜单</h6>
            <div class="list-group">
                <a href="/Aspx_Main/Admin/Admin_default.aspx" class="list-group-item list-group-item-action"><i class="fas fa-tachometer-alt"></i>个人中心</a>
                <a href="/Aspx_Main/Admin/Admin_default_port.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>帖子管理</a>

                <a href="/Aspx_LoginAndReg/UpdatePassword.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>修改密码</a>
                <a href="/Aspx_LoginAndReg/Logout.aspx" class="list-group-item list-group-item-action"><i class="far fa-clone"></i>注销账号</a>

            </div>
        </div>
        <!-- 主内容区域 -->
        <div class="content-wrapper">
            <div class="container-fluid">
                <h1 class="mt-4" style="position: relative; top: -25px">申请发帖权限</h1>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card mb-4" style="width: 1440px">
                                                                <div class="main">
                                        <p>
                                            申请者：<asp:Label ID="lblUsername2" runat="server" Text=""></asp:Label>
                                        </p>
                                        <p>
                                            申请原因：<asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="4" CssClass="borders-rows"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="您没有输入申请内容" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
                                        </p>

                                        <p>
                                            <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="btnborder" OnClick="btnSubmit_Click"   />
                                            <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btnborder" />
                                        </p>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdn.bootcdn.net/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcdn.net/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

    </body>
    </html>

</asp:Content>

