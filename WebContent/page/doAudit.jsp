<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 教师审核 -->
    
<h1 class="page-title">审核信息列表</h1>
<div class="btn-toolbar">
    <!-- 
    <button class="btn btn-primary"><i class="icon-plus"></i><a href="${pageContext.request.contextPath}/admin/goEditUser.do">学生添加</a></button>
     -->
    <!-- 
    <button class="btn">Import</button>
    <button class="btn">Export</button>
  	 -->
  <div class="btn-group">
  </div>
</div>
<script type="text/javascript">
function codeFormatter(code,row,index) {
	return '<a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=' + code + '">' + row.stu.code + '</a>';
}
function imgFormatter(img,row,index) {
	var index = img.lastIndexOf('\\');
	var file = img.substring(index+1);
	return '<a href="${pageContext.request.contextPath}/file/download.do?fileName='+file+'">' + file + '</a>';
}
function dateFormatter(joinTime) {
	return new Date(parseInt(joinTime)).toLocaleString().replace(/:\d{1,2}$/,' ');
}
function opFormatter(code) {
	return '<a href="#" class="stu_link" onclick="showStuModal(this);" data-stu="'+code+'">删除 </a>'+
	'<a href="${pageContext.request.contextPath}/admin/goEditUser.do?id=' + code + '">修改 </a>';
}
function auditFormatter(name,row,index) {
	return '<a href="#" class="stu_link" onclick="showStuModal(this);" data-auditId="'+row.id+'">通过 </a>'+
	'<a href="#" onclick="showStuModal(this);" data-uditdd="'+row.id+'" data-type="fail">不通过</a>';
}
function showStuModal(e) {
	var id = $(e).data('uditdd');
	console.log("id:"+id);
	var type = $(e).data('type');
	if(type=="fail") {
		$("#textTitle").text("确定不通过该申请吗？");
	}else {
		$("#textTitle").text("确定通过该申请吗？");
	}
	$("#stuModal").attr("stuId",id);
	$("#stuModal").attr("opType",type);
	$("#stuModal").modal();
}
/**
 * 
 */
function delStu() {
	var id = $("#stuModal").attr("stuId");
	var type = $("#stuModal").attr("opType");
	if(type=="fail") {
		$.get("${pageContext.request.contextPath}/tea/todoAudit.do",{'id':id,'type':'fail'},function(){
			$("#stuModal").modal('hide');
			refreshData();
		});
	} else {
		$.get("${pageContext.request.contextPath}/admin/todoAudit.do",{'id':id,'type':'success'},function(){
			$("#stuModal").modal('hide');
			refreshData();
		});
	}
}
/**
 * 刷新表格数据
 */
function refreshData() {
	$("#stuTable").bootstrapTable('refresh',{url:'${pageContext.request.contextPath}/stu/getAudit.do'});
}
function queryParams(params) {
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
      limit: params.limit,   //页面大小  
      pageNumber: params.pageNumber,  //页码  
      sort: params.sort,  //排序列名 
      offset:params.offset,
      search:params.search,
      status:'1',
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
        <th data-field="" data-formatter="codeFormatter" data-align="right" data-sortable="true" >学号</th>
        <th data-field="stu.name" data-align="center" data-sortable="true">学生姓名</th>
        <th data-field="type" data-align="center" data-sortable="true">评审类型</th>
        <th data-field="name" data-align="center" data-sortable="true">奖励名称</th>
        <th data-field="img" data-align="center" data-formatter="imgFormatter" data-sortable="true">奖励图片</th>
        <th data-field="requestTime" data-align="center" data-formatter="dateFormatter" data-sortable="true">申请时间</th>
        <th data-field="" data-align="center" data-formatter="auditFormatter" data-sortable="true">操作</th>
	</tr>
	</thead>
</table>
</div>
<!-- 模态框 -->
<div class="modal fade" id="stuModal" tabindex="-1" role="dialog" stuId="" opType="">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
      </div>
      <div class="modal-body">
        <h4 class="modal-title" id="textTitle">确认通过该申请 ？</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="delStu()">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">

</script>