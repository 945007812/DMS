<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/login.css" rel="stylesheet" type="text/css" media="all"/>
	  <link rel="stylesheet" type="text/css" href="css/mdialog.css">
	<!-- 
	<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'> 
	-->
  </head>
  
  <body>
  <script type="text/javascript" src="js/zepto.min.js"></script>
  <script type="text/javascript" src="js/mdialog.js"></script>
  <script> 

  var flag = '<%=request.getAttribute("flag")%>';
  if (flag == 'success'){
      new TipBox({type:'success',str:'注册成功',setTime:1500});
  } else if (flag == 'failure') {
      new TipBox({type:'error',str:'登录失败！',hasBtn:true});
  }

</script>
	<div class="login">
		<h2>文档管理系统</h2>
		<div class="login-top">
			<h1>用户登录</h1>
			<form action="/account/Login.do" method="POST">
				<input type="text" name="name" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}">
				<input type="password" name="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
		    <div class="forgot">
		    	<!--
		    	<a href="#">忘记密码</a> 
		    	-->
		    	<input type="submit" value="登录" >
		    </div>
		       </form>
		</div>
		<div class="login-bottom">
			<h3>新用户请 &nbsp;<a href="Register.jsp">注册</a>&nbsp;</h3>
		</div>
	</div>
	
  </body>
</html>

