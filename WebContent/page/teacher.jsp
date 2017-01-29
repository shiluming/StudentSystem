<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
<!--

//-->
function codeFormatter(code) {
	return '<a href="${pageContext.request.contextPath}/admin/goEditTeacher.do?id=' + code + '">' + code + '</a>';
}
function opFormatter(code) {
	return '<a href="${pageContext.request.contextPath}/admin/goEditTeacher.do?id=' + code + '">删除 </a>&nbsp;'+
	'<a href="${pageContext.request.contextPath}/admin/goEditTeacher.do?id=' + code + '">修改 </a>';
}
</script>
<h1 class="page-title">教师列表</h1>
<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-plus"></i>老师添加</button>
    <!-- 
    <button class="btn">Import</button>
    <button class="btn">Export</button>
  	 -->
  <div class="btn-group">
  </div>
</div>
<div class="well" style="height: 100%">
    <table data-toggle="table"
       data-url="getTeaList.do"
       data-pagination="true"
       data-side-pagination="server"
       data-page-list="[10,20, 50, 100, 200]"
       data-search="true"
       data-height="900">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="code" data-align="right" data-formatter="codeFormatter" data-sortable="true">工号</th>
        <th data-field="name" data-align="center" data-sortable="true">老师姓名</th>
     
        <th data-field="sex" data-align="center" data-sortable="true">性别</th>
        <th data-field="age" data-align="center" data-sortable="true">年龄</th>
        <th data-field="address" data-align="center" data-sortable="true">住址</th>
        <th data-field="tell" data-align="center" data-sortable="true">电话</th>
        <th data-field="joinTime" data-align="center" data-sortable="true">入职时间</th>
        <th data-field="email" data-align="center" data-sortable="true">email</th>
        <th data-field="grade" data-align="center" data-sortable="true">年级</th>
        <th data-field="code" data-align="center" data-formatter="opFormatter" data-sortable="true">操作</th>
	</tr>
	</thead>
</table>
</div>
