<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/stylesheets/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/lib/font-awesome/css/font-awesome.css">

    <script src="${pageContext.request.contextPath}/page/lib/jquery-1.8.1.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

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
<body>

<div class="navbar">
	<jsp:include page="header.jsp" />
</div>

<div class="container-fluid">

    <div class="row-fluid">
        <div class="span3">
            <div class="sidebar-nav">
                <div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu"><i class="icon-dashboard"></i>管理员系统</div>
                <ul id="dashboard-menu" class="nav nav-list collapse in">
                    <li><a href="index.html">Home</a></li>
                    <li ><a href="users.html">Sample List</a></li>
                    <li ><a href="user.html">Sample Item</a></li>
                    <li ><a href="gallery.html">Gallery</a></li>
                    <li ><a href="calendar.html">Calendar</a></li>
                    <li ><a href="faq.html">Faq</a></li>
                    <li ><a href="help.html">Help</a></li>

                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu"><i class="icon-briefcase"></i>教师系统<span class="label label-info">+10</span></div>
                <ul id="accounts-menu" class="nav nav-list collapse in">
                    <li ><a href="sign-in.html">Sign In</a></li>
                    <li ><a href="sign-up.html">Sign Up</a></li>
                    <li ><a href="reset-password.html">Reset Password</a></li>
                </ul>

                <div class="nav-header" data-toggle="collapse" data-target="#settings-menu"><i class="icon-exclamation-sign"></i>学生系统</div>
                <ul id="settings-menu" class="nav nav-list collapse in">
                    <li ><a href="403.html">403 page</a></li>
                    <li ><a href="404.html">404 page</a></li>
                    <li ><a href="500.html">500 page</a></li>
                    <li ><a href="503.html">503 page</a></li>
                </ul>

                <div class="nav-header" data-toggle="collapse" data-target="#legal-menu"><i class="icon-legal"></i>Legal</div>
                <ul id="legal-menu" class="nav nav-list collapse in">
                    <li ><a href="privacy-policy.html">Privacy Policy</a></li>
                    <li ><a href="terms-and-conditions.html">Terms and Conditions</a></li>
                </ul>
            </div>
        </div>
        <div class="span9">
        	<jsp:include page="rigth.jsp" />
        </div>
        
    </div>

    <script src="${pageContext.request.contextPath}/page/lib/bootstrap/js/bootstrap.js"></script>
</div>
</body>
</html>