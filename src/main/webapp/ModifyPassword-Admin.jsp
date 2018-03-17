<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>欢迎登陆文档管理系统！</title>

    <link rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="css/bootstrap-2.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="css/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/cssCharts.css">

</head>

<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark" href="Welcome-Admin.jsp">
                <i class="large material-icons">track_changes</i>
                <strong>文档管理系统</strong>
            </a>

            <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li>
                <a class="dropdown-button waves-effect waves-dark" data-activates="dropdown1">
                    <i class="fa fa-user fa-fw"></i>
                    <b>杨旭</b>
                    <i class="material-icons right">arrow_drop_down</i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li>
            <a href="PersonalCenter-Admin.jsp"><i class="fa fa-user fa-fw"></i> 个人中心</a>
        </li>
        <li>
            <a href="ModifyPassword-Admin.jsp"><i class="fa fa-gear fa-fw"></i> 修改密码</a>
        </li>
        <li>
            <a href="Login.jsp"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
        </li>
    </ul>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 文档管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">领导批示文件表<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="Document1-Add-Admin.jsp">登记</a>
                                </li>
                                <li>
                                    <a href="Document1-Admin.jsp">查询</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">收文登记表<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="Document2-Add-Admin.jsp">登记</a>
                                </li>
                                <li>
                                    <a href="Document2-Admin.jsp">查询</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">主要领导签批文件登记表<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="Document3-Add-Admin.jsp">登记</a>
                                </li>
                                <li>
                                    <a href="Document3-Admin.jsp">查询</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="form.html" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 会议管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="Meeting-Add-Admin.jsp">登记</a>
                        </li>
                        <li>
                            <a href="Meeting1-Admin.jsp">未召开会议查询</a>
                        </li>
                        <li>
                            <a href="Meeting2-Admin.jsp">已召开会议查询</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="form.html" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="User-Add-Admin.jsp">添加用户</a>
                        </li>
                        <li>
                            <a href="User-Admin.jsp">用户查询</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div class="header">
            <h1 class="page-header">
                修改密码
            </h1>
            <ol class="breadcrumb">
                <li><a>文档管理系统</a></li>
                <li class="active">修改密码</li>
            </ol>

        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-action">
                            修改密码
                        </div>
                        <div class="card-content">
                            <form class="col s12">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="old-password" type="password" class="validate">
                                        <label for="old-password">旧密码</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="new-password" type="password" class="validate">
                                        <label for="new-password">新密码</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="re-password" type="password" class="validate">
                                        <label for="re-password">确认密码</label>
                                    </div>
                                </div>
                            </form>
                            <a class="waves-effect waves-light btn-large" id="save">保存</a>
                            <div id="textfield"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>


<!-- jQuery Js -->
<script src="js/jquery-1.10.2.js"></script>

<!-- Bootstrap Js -->
<script src="js/bootstrap.min.js"></script>

<script src="js/materialize.min.js"></script>

<!-- Metis Menu Js -->
<script src="js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="js/raphael-2.1.0.min.js"></script>
<script src="js/morris.js"></script>


<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>

<script src="js/jquery.chart.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="js/custom-scripts.js"></script>

<script type="text/javascript">
    $("#save").click(function () {
        if ($("#old-password").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("旧密码不能为空！");
            return false;
        }
        if ($("#new-password").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("新密码不能为空！");
            return false;
        }
        if ($("#new-password").val() != $("#re-password").val()) {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("两次输入密码不同！");
            return false;
        }
    });
</script>

</body>
</html>
