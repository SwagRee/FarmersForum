<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Manager.master" AutoEventWireup="true" CodeFile="Admin_default.aspx.cs" Inherits="Aspx_Main_Admin_Admin_default" %>

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

        .top {
            width: 30%;
            height: 370px;
            line-height: 20px;
            text-align: center;
            padding-top: 10px;
            padding-left: 350px;
            position: relative;
            top: -200px;
            margin-top: 300px;
        }

        .left {
            margin-top: 10%;
            position: absolute;
            left: -15%;
            top: 7%;
        }

        .peopleManager, .userManager, .newsManager, .postManager, .daikuanManager {
            height: 30px;
            width: 8rem;
            border: 2px solid grey;
            text-align: center;
        }

        a {
            color: aqua;
        }

        html, body {
            margin: 0;
            padding: 0;
        }

        .user-profile {
            max-width: 900px;
            height: 42rem;
            margin: 60px auto;
            padding: 40px;
            background-color: #fff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

            .user-profile h2 {
                font-size: 42px;
                font-weight: 700;
                color: #333;
                margin-bottom: 30px;
                text-align: center;
            }

        .user-info {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }

            .user-info img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 50%;
                margin-right: 40px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
            }

        .user-details {
            font-size: 24px;
        }

            .user-details label {
                font-weight: bold;
                margin-right: 10px;
                color: #666;
            }

            .user-details span {
                color: #333;
            }

            .user-details a {
                color: #4799eb;
                text-decoration: none;
            }

                .user-details a:hover {
                    text-decoration: underline;
                }

        @media screen and (max-width: 768px) {
            .user-profile {
                max-width: 90vw;
                margin: 30px auto;
                padding: 20px;
            }

                .user-profile h2 {
                    font-size: 32px;
                    margin-bottom: 20px;
                }

            .user-info {
                flex-direction: column;
                align-items: center;
                margin-bottom: 20px;
            }

                .user-info img {
                    width: 120px;
                    height: 120px;
                    margin-right: 0;
                    margin-bottom: 20px;
                }

            .user-details {
                font-size: 18px;
            }

                .user-details label {
                    margin-right: 5px;
                }
        }


        .people {
            height: 30px;
            width: 8rem;
            border: 2px solid grey;
            text-align: center;
            padding-top: 0.7rem;
            text-decoration: none;
        }

        a {
            text-decoration: none;
        }
    </style>
    </head>
    <body>
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
        <div class="user-profile">
            <h2>个人信息</h2>
            <div class="user-info">
                <asp:Image class="img" runat="server" alt="User Avatar" ImageUrl="~/Images/User.jpg" />
                <div class="user-details">
                    <label>用户名:</label>
                    <span>
                        <asp:Label ID="lblUserName2" runat="server" Text="default"></asp:Label></span>
                    <br />
                    <label>身份:</label>
                    <span>
                        <asp:Label ID="lblSF" runat="server" Text="普通用户"></asp:Label></span>
                    <br />
                    <label>您是否有发帖权限:</label>
                    <span>
                        <asp:Label ID="lblQuanxian" runat="server" Text="无"></asp:Label></span>
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
