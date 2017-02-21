<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 教师审核结果是没有通过的-->
    
<h1 class="page-title">未通过审核信息列表</h1>
<div class="btn-toolbar">
  
  <div class="btn-group">
  </div>
</div>
<script type="text/javascript">
function codeFormatter(code) {
	return '<a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=' + code + '">' + code + '</a>';
}

function opFormatter(code) {
	return '<a href="#" class="stu_link" onclick="showStuModal(this);" data-stu="'+code+'">删除 </a>'+
	'<a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=' + code + '">修改 </a>';
}
function showStuModal(e) {
	var id = $(e).data('stu');
	$("#stuModal").attr("stuId",id);
	$("#stuModal").modal();
}
/**
 * 删除学生
 */
function delStu() {
	var id = $("#stuModal").attr("stuId");
	console.log(id);
	$.get("${pageContext.request.contextPath}/admin/goDelUser.do",{'id':id},function(){
		$("#stuModal").modal('hide');
		refreshData();
	});
}
/**
 * 刷新表格数据
 */
function refreshData() {
	$("#stuTable").bootstrapTable('refresh',{url:'getStuList.do'});
}


</script>
<div class="well" style="height: 100%">
    <table data-toggle="table"
       data-url="getStuList.do"
       data-pagination="true"
       data-side-pagination="server"
       data-page-list="[10,20, 50, 100, 200]"
       data-search="true"
       data-height="900" id="stuTable">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="code" data-formatter="codeFormatter" data-align="right" data-sortable="true" >学号</th>
        <th data-field="name" data-align="center" data-sortable="true">学生姓名</th>
        <th data-field="masterTeacher" data-align="center" data-sortable="true">评审类型</th>
        <th data-field="sex" data-align="center" data-sortable="true">级别</th>
        <th data-field="age" data-align="center" data-sortable="true">奖励名称</th>
        <th data-field="address" data-align="center" data-sortable="true">奖励图片</th>
        <th data-field="joinTime" data-align="center" data-sortable="true">申请时间</th>
	</tr>
	</thead>
</table>
</div>
<!-- 模态框 -->
<div class="modal fade" id="stuModal" tabindex="-1" role="dialog" stuId="">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
      </div>
      <div class="modal-body">
        <h4 class="modal-title">确认删除该学生 ？</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="delStu()">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
$(function() {
	$(".stu_link").click(function(){
		alert("ss");
	});	
});
</script>