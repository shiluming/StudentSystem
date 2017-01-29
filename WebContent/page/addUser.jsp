<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/jquery-1.8.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-save"></i><a href="${pageContext.request.contextPath}/admin/saveStu.do"> Save</a></button>
  <div class="btn-group">
  </div>
</div>


<div class="well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
      <li><a href="#profile" data-toggle="tab">Password</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <form id="tab" action="" method="post">
        <label>姓名</label>
        <input type="text" value="${stu.name}" name="" class="input-xlarge">
        <label>学号</label>
        <input type="text" value="${stu.code}" class="input-xlarge">
        <label>注册时间</label>
           <input type="text" value="2017-01-01 10:00" id="datetimepicker" class="input-xlarge">

        <label>班主任</label>
        <input type="text" value="${stu.masterTeacher}" class="input-xlarge">
        <label>性别</label>
        <input type="text" value="${stu.sex}" class="input-xlarge">
        <label>年龄</label>
        <input type="text" value="${stu.age}" class="input-xlarge">
        <label>年级</label>
        	<select name="gradeName" id="gradeName" class="input-xlarge">
    		</select>
        <label>Email</label>
        <input type="text" value="${stu.email}" class="input-xlarge">
        <label>Address</label>
        <textarea  rows="3" class="input-xlarge">
			${stu.address}
        </textarea>
    </form>
      </div>
      <div class="tab-pane fade" id="profile">
    <form id="tab2">
        <label>New Password</label>
        <input type="password" class="input-xlarge">
        <div>
            <button class="btn btn-primary">Update</button>
        </div>
    </form>
      </div>
  </div>

</div>
<script type="text/javascript">

$('#datetimepicker').datetimepicker({
    format: 'yyyy-mm-dd hh:ii'
});

$(function() {
	init();
	
	
	
	
});

function init() {
	//设置年级下拉框
	var gradeName = $("#gradeName").val();
	if(gradeName=='' || gradeName==null) {
		$.get("${pageContext.request.contextPath}/cls/clsInfo.do",function(data){
			var json = $.parseJSON(data);
			if(json.result) {
				$("#gradeName").empty();
				$.each(json.data,function(i,n){
					var option = "<option value='"+n.id+"'>"+n.gradeName+"</option>";
					$("#gradeName").append(option);
				});
			}
		});
	}
	
	
}
</script>
    