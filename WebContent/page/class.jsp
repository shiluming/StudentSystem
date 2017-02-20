<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<<script type="text/javascript">
function opFormatter(id) {
	return '<a href="#" onclick="showClassModal(this);" data-class="'+id+'">删除 </a>&nbsp;'+
	'<a href="${pageContext.request.contextPath}/admin/goEditTeacher.do?id='+id+'">修改 </a>';
}
function showClassModal(e) {
	var id = $(e).data('class');
	$("#classModal").attr("classId",id);
	$("#classModal").modal();
}
function gradeFormatter(gradeName) {
	return '<a href="#">'+gradeName+'</a>';
}
/**
 * 删除班级
 */
function delClass() {
	var id = $("#classModal").attr("classId");
	console.log(id);
	$.get("${pageContext.request.contextPath}/admin/goDelClass.do",{'id':id},function(){
		$("#classModal").modal('hide');
		refreshData();
	});
}
/**
 * 刷新表格数据
 */
function refreshData() {
	$("#classTable").bootstrapTable('refresh',{url:'getClassList.do'});
}
</script>
<h1 class="page-title">班级列表</h1>
<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-plus"></i><a href="${pageContext.request.contextPath}/cls/goEditView.do"> 班级新增</a></button>
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
       data-height="900" id="classTable">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="grade" data-align="right" data-sortable="true">年级</th>
        <th data-field="gradeName" data-align="center" data-formatter="gradeFormatter" data-sortable="true">班级</th>
        <th data-field="teacherName" data-align="center" data-sortable="true">班主任</th>
        <th data-field="id" data-formatter="opFormatter">操作</th>
	</tr>
	</thead>
</table>
</div>
<!-- 模态框 -->
<div class="modal fade" id="classModal" tabindex="-1" role="dialog" classId="">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
      </div>
      <div class="modal-body">
        <h4 class="modal-title">确认取消该班级？</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="delClass()">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->