<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<h1 class="page-title">学生列表</h1>
<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-plus"></i><a href="${pageContext.request.contextPath}/admin/goEditUser.do"> New User</a></button>
    <button class="btn">Import</button>
    <button class="btn">Export</button>
  <div class="btn-group">
  </div>
</div>
<script type="text/javascript">
function codeFormatter(code) {
	return '<a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=' + code + '">' + code + '</a>';
}
</script>
<div class="well" style="height: 100%">
    <table data-toggle="table"
       data-url="getStuList.do"
       data-pagination="true"
       data-side-pagination="server"
       data-page-list="[10,20, 50, 100, 200]"
       data-search="true"
       data-height="900">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="code" data-formatter="codeFormatter" data-align="right" data-sortable="true" >学号</th>
        <th data-field="name" data-align="center" data-sortable="true">学生姓名</th>
        <th data-field="masterTeacher" data-align="center" data-sortable="true">班主任</th>
        <th data-field="sex" data-align="center" data-sortable="true">性别</th>
        <th data-field="age" data-align="center" data-sortable="true">年龄</th>
        <th data-field="address" data-align="center" data-sortable="true">住址</th>
        <th data-field="tell" data-align="center" data-sortable="true">电话</th>
        <th data-field="joinTime" data-align="center" data-sortable="true">注册时间</th>
        <th data-field="email" data-align="center" data-sortable="true">email</th>
        <th data-field="grade" data-align="center" data-sortable="true">年级</th>
	</tr>
	</thead>
</table>
</div>
