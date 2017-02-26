<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
<!--

//-->
function codeFormatter(code) {
	return '<a href="${pageContext.request.contextPath}/tea/goEditTeacher.do?id=' + code + '">' + code + '</a>';
}
function opFormatter(code) {
	return '<a href="#" onclick="showStuModal(this);" data-tea="'+code+'">删除 </a>&nbsp;'+
	'<a href="${pageContext.request.contextPath}/tea/goEditTeacher.do?id=' + code + '">修改 </a>';
}
function showStuModal(e) {
	var id = $(e).data('tea');
	$("#teaModal").attr("teaId",id);
	$("#teaModal").modal();
}
function registerFormatter(joinTime) {
	console.log(joinTime);
	return new Date(parseInt(joinTime)).toLocaleString().replace(/:\d{1,2}$/,' ');
}

function delTea() {
	var id = $("#teaModal").attr("teaId");
	console.log(id);
	$.get("${pageContext.request.contextPath}/tea/delTea.do",{'id':id},function(){
		$("#teaModal").modal('hide');
		refreshData();
	});
}
/**
 * 刷新表格数据
 */
function refreshData() {
	$("#teaTable").bootstrapTable('refresh',{url:'getTeaList.do'});
}
</script>
<h1 class="page-title">教师列表</h1>
<div class="btn-toolbar">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/tea/addTeacher.do"><i class="icon-plus"></i>老师添加</a>
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
       data-height="900" id="teaTable">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="code" data-align="right" data-formatter="codeFormatter" data-sortable="true">工号</th>
        <th data-field="name" data-align="center" data-sortable="true">老师姓名</th>
     
        <th data-field="sex" data-align="center" data-sortable="true">性别</th>
        <th data-field="age" data-align="center" data-sortable="true">年龄</th>
        <th data-field="address" data-align="center" data-sortable="true">住址</th>
        <th data-field="tell" data-align="center" data-sortable="true">电话</th>
        <th data-field="joinTime" data-align="center" data-formatter="registerFormatter" data-sortable="true">入职时间</th>
        <th data-field="email" data-align="center" data-sortable="true">email</th>
        <th data-field="code" data-align="center" data-formatter="opFormatter" data-sortable="true">操作</th>
	</tr>
	</thead>
</table>
</div>
<!-- 模态框 -->
<div class="modal fade" id="teaModal" tabindex="-1" role="dialog" teaId="">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
      </div>
      <div class="modal-body">
        <h4 class="modal-title">确认删除该教师 ？</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="delTea()">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->