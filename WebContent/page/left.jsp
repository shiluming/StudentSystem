<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="sidebar-nav">
			<c:if test="${loginUser.privilege=='admin' }">
    		<div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu"><i class="icon-dashboard"></i>管理员系统</div>
                <ul id="dashboard-menu" class="nav nav-list collapse in">
                    <li><a href="#">Home</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/goStu.do">学生管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/goTea.do">教师管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/goClass.do">班级管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/stu/searchList.do">查询学生信息</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/addItem.do">奖项设置</a></li>
               		
                </ul>
                </c:if>
                <c:if test="${loginUser.privilege=='teacher' }">
                <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu"><i class="icon-briefcase"></i>教师系统</div>
                <ul id="accounts-menu" class="nav nav-list collapse in">
                    <li ><a href="${pageContext.request.contextPath}/tea/personal.do">个人信息管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/goStu.do">学生信息管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/goClassDetails.do?id=${loginUser.id}">班级信息管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/tea/doAudit.do">审核信息管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/tea/noPassList.do">未通过审核信息管理</a></li>
                </ul>
				</c:if>
				<c:if test="${loginUser.privilege=='student' }">
                <div class="nav-header" data-toggle="collapse" data-target="#settings-menu"><i class="icon-exclamation-sign"></i>学生系统</div>
                <ul id="settings-menu" class="nav nav-list collapse in">
                    <li ><a href="${pageContext.request.contextPath}/stu/personal.do">个人信息管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/stu/searchList.do">查询学生信息</a></li>
                    <li ><a href="${pageContext.request.contextPath}/stu/requestDeal.do">申请评审</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=${loginUser.id}">修改学生信息</a></li>
                    <li ><a href="${pageContext.request.contextPath}/stu/noPass.do">未通过评审信息管理</a></li>
                </ul>
				</c:if>
				
				<div class="nav-header" data-toggle="collapse" data-target="#legal-menu"><i class="icon-legal"></i>其他</div>
                <ul id="legal-menu" class="nav nav-list collapse in">
                    <li ><a href="${pageContext.request.contextPath}/index/logout.do">推出系统</a></li>
                </ul>
       </div>            

       
        
