<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<<script type="text/javascript">
function opFormatter(id) {
	return '<a href="#" onclick="showClassModal(this);" data-class="'+id+'">删除 </a>&nbsp;'+
	'<a href="${pageContext.request.contextPath}/cls/goEditView.do?id='+id+'">修改 </a>';
}
function showClassModal(e) {
	var id = $(e).data('class');
	$("#classModal").attr("classId",id);
	$("#classModal").modal();
}
function showStusModal(e) {
	var id = $(e).data('class');
	$("#stusModal").attr("classId",id);
	
	refreshDataStu();
	
	$("#stusModal").modal();
}
function queryParams(params) {  //配置参数  
	var classId = $("#stusModal").attr("classId");
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
      limit: params.limit,   //页面大小  
      pageNumber: params.pageNumber,  //页码  
      sort: params.sort,  //排序列名 
      offset:params.offset,
      search:params.search,
      classId:classId,
      sortOrder: params.order//排位命令（desc，asc）  
    };  
    return temp;  
  }  
function gradeFormatter(value,row,index) {
	return '<a href="#" onclick="showStusModal(this)" data-class="'+row.id+'">'+value+'</a>';
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

function refreshDataStu() {
	$("#stuTable").bootstrapTable('refresh',{url:'getStuList.do',classId:'1'});
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
       data-ajax-options={id:id}
       data-side-pagination="server"
       data-page-list="[10,20, 50, 100, 200]"
       data-search="true"
       data-locale="zh-US"
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


<!-- 模态框 -->
<div class="modal fade" id="stusModal" tabindex="-1" role="dialog" classId="" style="width: 900px;height: 500px">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-title">
      	<h4 class="modal-title"> &nbsp;&nbsp;班级学生列表</h4>
      </div>
      <div class="modal-body">
      
      
        <div class="" style="height: auto">
		    <table data-toggle="table"
		       data-url="getStuList.do"
		       data-pagination="true"
		       data-query-params="queryParams"
		       data-side-pagination="server"
		       data-page-list="[10,20, 50, 100, 200]"
		       data-search="true"
		       data-height="auto" id="stuTable">
		    	<thead>
			    	<tr>
				        <th data-field="code" data-align="right" data-sortable="true" >学号</th>
				        <th data-field="name" data-align="center" data-sortable="true">学生姓名</th>
				        <th data-field="sex" data-align="center" data-sortable="true">性别</th>
				        <th data-field="tell" data-align="center" data-sortable="true">电话</th>
				        <th data-field="email" data-align="center" data-sortable="true">email</th>
					</tr>
				</thead>
			</table>
		</div>
      
      
      
      </div><!-- 学生列表模态框结束 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
