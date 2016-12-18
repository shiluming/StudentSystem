<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆页面</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/stylesheets/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/lib/font-awesome/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/jquery.alerts-1.1/jquery.alerts.css">
    <script src="${pageContext.request.contextPath}/page/lib/jquery-1.8.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/jquery.alerts-1.1/jquery.alerts.js"></script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<script type="text/javascript">
	function checkForm() {
		var user = $.trim($("#user").val());
		var password = $.trim($("#password").val());
		if(user == null || user == '') {
			jAlert('登陆账号为空', '提示信息');
			return false;
		}
		if(password == null || password == '') {
			jAlert('密码为空','提示信息');
			return false;
		}
		return true;
	}

</script>
<body>
<div class="navbar">
	<jsp:include page="header.jsp"/>
</div>
<div class="container-fluid">
        
        <div class="row-fluid">
    <div class="dialog span4">
        <div class="block">
            <div class="block-heading">登陆</div>
            <div class="block-body">
                <form action="${pageContext.request.contextPath}/index/login.do" method="post" onsubmit="return checkForm()" >
                    <label>用户名：</label>
                    <input type="text" name="name" id="user" class="span12">
                    <label>密 码 ：</label>
                    <input type="password" name="password" id="password" class="span12">
                    <button type="submit" class="btn btn-primary pull-right">登陆</button>
                    <label class="remember-me"><input type="radio" name="rola" checked="checked" value="admin"> 管理员</label>
                    <label class="remember-me"><input type="radio" name="rola" value="teacher"> 老师</label>
                    <label class="remember-me"><input type="radio" name="rola" value="student"> 学生</label>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <p><a href="">忘记密码？</a></p>
    </div>
</div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/page/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>