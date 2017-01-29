<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<h1 class="page-title">班级列表</h1>
<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-plus"></i><a href="${pageContext.request.contextPath}/admin/goAddClass.do"> 班级新增</a></button>
    <!--
    <button class="btn">Import</button>
    <button class="btn">Export</button>
  	-->
  <div class="btn-group">
  </div>
</div>
<div class="well" style="height: 100%">
    <table data-toggle="table"
       data-url="getClassList.do"
       data-pagination="true"
       data-side-pagination="server"
       data-page-list="[10,20, 50, 100, 200]"
       data-search="true"
       data-height="900">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="grade" data-align="right" data-sortable="true">年级</th>
        <th data-field="gradeName" data-align="center" data-sortable="true">班级</th>
        <th data-field="teacherName" data-align="center" data-sortable="true">班主任</th>
	</tr>
	</thead>
</table>
</div>
