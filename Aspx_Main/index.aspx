<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Aspx_Main_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Css/Main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .news-section {
            display: flex;
            flex-wrap: wrap;
            margin-left: 10%;
            margin-left: 10%;
        }

        .news-item {
            width: 100%;
            max-width: 550px;
            display: flex;
            background-color: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            margin-left: 6%;
        }

        .news-image {
            width: 40%;
            position: relative;
        }

            .news-image img {
                width: 100%;
                height: auto;
                display: block;
                border-radius: 5px 0 0 5px;
            }

        .news-content {
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 20px;
            font-size: 15px;
        }

            .news-content h2 {
                font-size: 15px;
                margin-bottom: 10px;
            }

            .news-content p {
                font-size: 16px;
                margin-bottom: 15px;
            }

            .news-content a {
                color: #4CAF50;
                font-weight: bold;
            }

        .main {
        }
    </style>
    <div class="box">
        <div class="top">
            <div>
                <!-- 轮播图容器 -->
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- 轮播图指示器 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 轮播图内容 -->
                    <div class="carousel-inner" style="position:relative;top:-16px">
                        <div class="carousel-item active">
                            <img src="../Images/Main.jpeg" class="picture" alt="轮播图1" />
                        </div>
                        <div class="carousel-item">
                            <img src="../Images/Main2.jpeg"  class="picture" alt="轮播图2" />
                        </div>
                        <div class="carousel-item">
                            <img src="../Images/Main3.jpeg"   class="picture" alt="轮播图3" />
                        </div>
                    </div>
                    <!-- 轮播图控制按钮 -->
                    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">上一页</span>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">下一页</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="main">
            <section class="news-section">
                <div class="news-item">
                    <div class="news-image">
                        <asp:Image runat="server" ImageUrl="~/Images/ylp.jpg"></asp:Image>
                    </div>
                    <div class="news-content">
                        <p style="font-size: 15px">1960年罕见的天灾，带来了严重的粮食饥荒，袁隆平同志目睹了严酷的现实，他辗转反侧不能安睡。他想起旧社会，人民受统治阶级的剥削压迫，受战争的痛苦，缺衣少食，流离失所。今天，人民当家作主，但仍未摆脱饥饿对人们的威胁。他决心努力发挥自己的才智，用所学专业知识，尽快培育出亩产过1000斤、2000斤的水稻新品种，让粮食大幅度增产，用农业科学技术战胜饥饿。</p>
                    </div>
                </div>
                <div class="news-item">
                    <div class="news-image">
                        <asp:Image runat="server" ImageUrl="~/Images/xgq.jpg"></asp:Image>
                    </div>
                    <div class="news-content">
                        <p style="font-size: 14px">
                            徐光启对农业的贡献是农业著作甚多，计有《农政全书》《甘薯疏》《农遗杂疏》《农书草稿》《泰西水法》等。

《农政全书》初稿完成后，徐光启忙于负责修订历书，无暇顾及，去世后由他的门人陈子龙等人负责修订，于1639年刻板付印。全书由于分为12目，共60卷，50余万字。
基本上囊括了中国古代汉族农业生产和人民生活的各个方面，治国治民的“农施陵政”思想贯穿其中。
                        </p>
                    </div>
                </div>
        </div>
        </section>
    </div>
    <div class="bottom">
    </div>
    </div>
</asp:Content>

