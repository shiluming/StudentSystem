<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 教师审核结果是没有通过的-->
    
<h1 class="page-title">未通过审核信息列表</h1>
<div class="btn-toolbar">
  
  <div class="btn-group">
  </div>
</div>
<script type="text/javascript">
function codeFormatter(code,row,index) {
	return '<a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=' + code + '">' + row.stu.code + '</a>';
}
function registerFormatter(requestTime) {
	return new Date(parseInt(requestTime)).toLocaleString().replace(/:\d{1,2}$/,' ');
}
function imgFormatter(img,row,index) {
	var index = img.lastIndexOf('\\');
	var file = img.substring(index+1);
	return '<a href="${pageContext.request.contextPath}/file/download.do?fileName='+file+'">' + file + '</a>';
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
function queryParams(params) {
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
      limit: params.limit,   //页面大小  
      pageNumber: params.pageNumber,  //页码  
      sort: params.sort,  //排序列名 
      offset:params.offset,
      search:params.search,
      status:'0',
      sortOrder: params.order//排位命令（desc，asc）  
    };  
    return temp;  
}

</script>
<div class="well" style="height: 100%">
    <table data-toggle="table"
       data-url="${pageContext.request.contextPath}/stu/getAudit.do"
       data-pagination="true"
       data-side-pagination="server"
       data-query-params="queryParams"
       data-page-list="[10,20, 50, 100, 200]"
       data-search="true"
       data-height="900" id="stuTable">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="code" data-formatter="codeFormatter" data-align="right" data-sortable="true" >学号</th>
        <th data-field="stu.name" data-align="center" data-sortable="true">学生姓名</th>
        <th data-field="type" data-align="center" data-sortable="true">评审类型</th>
        <th data-field="name" data-align="center" data-sortable="true">奖励名称</th>
        <th data-field="img" data-align="center" data-formatter="imgFormatter" data-sortable="true">奖励图片</th>
        <th data-field="requestTime" data-align="center" data-formatter="registerFormatter" data-sortable="true">申请时间</th>
        <th data-field="status" data-align="center" data-sortable="true">结果</th>
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