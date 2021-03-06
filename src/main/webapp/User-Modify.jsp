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
    <link rel="stylesheet" type="text/css" href="css/mdialog.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/cssCharts.css">

</head>

<body>
<script type="text/javascript" src="js/zepto.min.js"></script>
<script type="text/javascript" src="js/mdialog.js"></script>
<script type="text/javascript">
    var flag = '<%=request.getAttribute("flag")%>';
    if (flag == 'modifyFail'){
        new TipBox({type:'error',str:'修改失败',hasBtn:true});
    }
    var login = '<%=request.getSession().getAttribute("login")%>';
    if (login != 'success'){
        window.location.href="Login.jsp";
    }
</script>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark" href="Welcome.jsp">
                <i class="large material-icons">track_changes</i>
                <strong>文档管理系统</strong>
            </a>

            <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li>
                <a class="dropdown-button waves-effect waves-dark" data-activates="dropdown1">
                    <i class="fa fa-user fa-fw"></i>
                    <b><%=request.getSession().getAttribute("name")%></b>
                    <i class="material-icons right">arrow_drop_down</i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li>
            <a href="../account/getUser.do"><i class="fa fa-user fa-fw"></i> 个人中心</a>
        </li>
        <li>
            <a href="ModifyPassword.jsp"><i class="fa fa-gear fa-fw"></i> 修改密码</a>
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
                                    <a href="Document1-Add.jsp">登记</a>
                                </li>
                                <li>
                                    <a href="/DocumentManaging/getFiles.do">查询</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">收文登记表<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="Document2-Add.jsp">登记</a>
                                </li>
                                <li>
                                    <a href="/DocumentManaging/getFilesOfReceiving.do">查询</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">报主要领导签批文件登记表<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="Document3-Add.jsp">登记</a>
                                </li>
                                <li>
                                    <a href="/DocumentManaging/getFileOfApplying.do">查询</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="form.html" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 会议管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="Meeting-Add.jsp">登记</a>
                        </li>
                        <li>
                            <a href="/conference/getAllConference.do">会议查询</a>
                        </li>
                        <li>
                            <a href="/conference/getMeetingStatistical.do">会议统计</a>
                        </li>
                    </ul>
                </li>
                <li id="admin">
                    <a href="form.html" class="active-menu waves-effect waves-dark"><i class="fa fa-desktop"></i> 用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="User-Add.jsp">添加用户</a>
                        </li>
                        <li>
                            <a href="/user/getuser.do">用户查询</a>
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
                用户管理
            </h1>
            <ol class="breadcrumb">
                <li><a>用户管理</a></li>
                <li class="active">添加/修改</li>
            </ol>

        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-action">
                            用户管理
                        </div>
                        <div class="card-content">
                            <form class="col s12" action="/user/updateUser.do" id="fileform1" method="POST">
                                <input name="uid" type="hidden" value="${user.uid}">
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input id="nickname" name="name" type="text" class="validate" value="${user.name}">
                                        <label class="active" for="nickname">昵称</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="password" name="password" type="text" class="validate" value="${user.password}">
                                        <label class="active" for="password">密码</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input id="phone" name="phonenumber" type="text" class="validate" value="${user.phonenumber}">
                                        <label class="active" for="phone">手机号码</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="email" name="email" type="text" class="validate" value="${user.email}">
                                        <label class="active" for="email">邮箱</label>
                                    </div>
                                </div>
                                <p>
                                    <input type="checkbox" id="IsAdmin" name="ismanager"/>
                                    <label for="IsAdmin">管理员</label>
                                </p>
                            </form>
                            <a class="waves-effect waves-light btn-large" id="modify">修改</a>
                            <a disabled class="waves-effect waves-light btn-large" id="save" >保存</a>
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
<script type="text/javascript" src="js/mdialog.js"></script>
<script src="js/raphael-2.1.0.min.js"></script>
<script src="js/morris.js"></script>


<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>

<script src="js/jquery.chart.js"></script>
<script type="text/javascript" src="js/zepto.min.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $(".validate").attr("disabled", true);
        $("#IsAdmin").attr("disabled", true);
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="js/custom-scripts.js"></script>

<script type="text/javascript">
    $("#save").click(function () {
        if ($("#password").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("密码不能为空！");
            return false;
        }
        if ($("#nickname").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("昵称不能为空！");
            return false;
        }
        if ($("#phone").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("手机号码不能为空！");
            return false;
        }
        var reg_phone=/^1[3,5,7,8]\d{9}$/;
        if (!reg_phone.test($("#phone").val())){
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("手机号码不合法！");
            return false;
        }
        if ($("#email").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("邮箱不能为空！");
            return false;
        }
        if ($("#email").val() == "") {
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("邮箱不能为空！");
            return false;
        }
        var reg_email = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if (!reg_email.test($("#email").val())){
            $("#textfield").addClass("alert alert-warning");
            $("#textfield").text("邮箱不合法！");
            return false;
        }
        $("#textfield").removeClass("alert alert-warning");
        $("#textfield").text("");
        document.getElementById("fileform1").submit();
        return true;
    });
    $("#modify").click(function () {
        $(".validate").attr("disabled", false);
        $("#save").attr("disabled", false);
        $("#IsAdmin").attr("disabled", false);
        $("#modify").attr("disabled", true);
    });
</script>
</body>
</html>
