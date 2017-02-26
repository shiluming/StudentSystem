<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <!-- 教师个人信息页面 -->
<style>
.b {
	font-size:25px;
	margin-left: 30px;
}
</style>
<script type="text/javascript">

</script>
<h1 class="page-title">教师个人信息面板</h1>

<div class="row-fluid">
    <div class="block">
        <p class="block-heading" data-toggle="collapse" data-target="#chart-container">个人详细信息</p>
        <div id="chart-container" class="block-body collapse in">
            <div id="line-chart">
            	<div class="a" style="margin-left: 0px;margin-right: 0px">
            	<form action="${pageContext.request.contextPath}/tea/saveTeacher.do">
            		<table style="border: 0px;">
            			<tr style="height: 60px;">
            				<td>
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-user" aria-hidden="true"></span> 姓名：</label>
            				</td>
            				<td>
            					<input style="float: left;" name="name" value="${teaObj.name}" readonly="readonly" />
            				</td>
            				<td style="margin-left: 30px;">
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-phone" aria-hidden="true"></span> 电    话：</label></td>
            				<td>
            					<input style="float: left;" name="tell" value="${teaObj.tell}" placeholder="请输入电话" /></td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-bookmark"></span> Email：</label>
            				</td>
            				<td>
            					<input style="float: left;" name="email" value="${teaObj.email}" placeholder="请输入Email" />
            				</td>
            				<td>
            					<label style="float:left;" class="b"><span class="icon-qrcode"></span> 年 龄：</label>
            				</td>
            				<td>
            					<input style="float: left;" name="age" value="${teaObj.age}" placeholder="请输入年龄"/>
            				</td>
            			</tr>
            			<tr style="height: 60px;">
            				
            				<td>
            					<label style="float:left;" class="b"><span class="icon-star"></span> 性 别：</label>
            				</td>
            				<td>
            					<select name="sexual">
            						<option>男</option>
            						<option>女</option>
            					</select>
            				</td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-home"></span> 地址：</label>
            				</td>
            				<td colspan="3">
            					<textarea rows="3" cols="6" style="width: 100%" placeholder="请输入地址" name="address">${teaObj.address}</textarea>
            				</td>
            			</tr>
            			<tr>
            				<td></td>
            			</tr>
            		</table>
            		</form><!-- 表单结束 -->
            	</div>
            </div>
        </div><!-- 标签<p> 下面的div结束 -->
    </div>
</div>

<div class="row-fluid">
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#tablewidget">班级情况</div>
        <div id="tablewidget" class="block-body collapse in">
            <div class="well" style="height: 100%">
				    <table data-toggle="table"
				       data-url="${pageContext.request.contextPath}/admin/getClassList.do"
				       data-pagination="true"
				       data-side-pagination="server"
				       data-page-list="[10,20, 50, 100, 200]"
				       data-search="true"
				       data-locale="zh-US"
				       data-height="400" id="classTable">
				    <thead>
				    <tr>
				        <th data-field="state" data-checkbox="true"></th>
				        <th data-field="grade" data-align="right" data-sortable="true">年级</th>
				        <th data-field="gradeName" data-align="center" data-formatter="gradeFormatter" data-sortable="true">班级</th>
				        <th data-field="id" data-formatter="opFormatter">操作</th>
					</tr>
					</thead>
				</table>
			</div><!-- 班级请客div结束 -->
        </div>
    </div><!-- 学生奖惩情况 end... -->
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget1container">待审核信息 </div>
        <div id="widget1container" class="block-body collapse in">
          
          <div class="well" style="height: 100%">
			    <table data-toggle="table"
			       data-url="${pageContext.request.contextPath}/stu/getAudit.do"
			       data-pagination="true"
			       data-side-pagination="server"
			       data-query-params="queryParams"
			       data-page-list="[10,20, 50, 100, 200]"
			       data-search="false"
			       data-height="400" id="stuTable">
				    <thead>
				    <tr>
				        <th data-field="stu.name" data-align="center" data-sortable="true">学生姓名</th>
				        <th data-field="type" data-align="center" data-sortable="true">评审类型</th>
				        <th data-field="name" data-align="center" data-sortable="true">奖励名称</th>
				        <th data-field="requestTime" data-align="center" data-sortable="true">申请时间</th>
					</tr>
					</thead>
				</table>
		</div>
          
          
            
        </div>
    </div><!-- 班主任 end -->
</div><!-- 学生奖惩情况 和 班主任  end... -->


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
		       data-url="${pageContext.request.contextPath}/admin/getStuList.do"
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


<script type="text/javascript">
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
	$("#classTable").bootstrapTable('refresh',{url:'${pageContext.request.contextPath}/admin/getClassList.do'});
}

function refreshDataStu() {
	$("#stuTable").bootstrapTable('refresh',{url:'${pageContext.request.contextPath}/admin/getStuList.do',classId:'1'});
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
<!-- 
<div class="row-fluid">
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget2container">记事本<span class="label label-warning">+10</span></div>
        <div id="widget2container" class="block-body collapse in">
            <table class="table">
              <tbody>
                  <tr>
                      <td>
                          <p><i class="icon-user"></i> Mark Otto</p>
                      </td>
                      <td>
                          <p>Amount: $1,247</p>
                      </td>
                      <td>
                          <p>Date: 7/19/2012</p>
                          <a href="#">View Transaction</a>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <p><i class="icon-user"></i> Audrey Ann</p>
                      </td>
                      <td>
                          <p>Amount: $2,793</p>
                      </td>
                      <td>
                          <p>Date: 7/12/2012</p>
                          <a href="#">View Transaction</a>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <p><i class="icon-user"></i> Mark Tompson</p>
                      </td>
                      <td>
                          <p>Amount: $2,349</p>
                      </td>
                      <td>
                          <p>Date: 3/10/2012</p>
                          <a href="#">View Transaction</a>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <p><i class="icon-user"></i> Ashley Jacobs</p>
                      </td>
                      <td>
                          <p>Amount: $1,192</p>
                      </td>
                      <td>
                          <p>Date: 1/19/2012</p>
                          <a href="#">View Transaction</a>
                      </td>
                  </tr>
                    
              </tbody>
            </table>
        </div>
    </div>
</div>
 -->
