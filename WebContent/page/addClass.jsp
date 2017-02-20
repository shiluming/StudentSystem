<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/jquery-1.8.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/page/lib/bootstrap/js/bootstrap.js"></script>
<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-save"></i><a href="#" onclick="saveClass();"> Save</a></button>
  <div class="btn-group">
  </div>
</div>
<div id="alertInfo">
	<div class="alert alert-block hide" id="warning-block">
    <button type="button" class="close" onclick="$('#warning-block').hide();">&times;</button>
    <h4>成功!</h4> 新建班级...
</div>
<div>
<div class="alert alert-block hide" id="error-block">
    <button type="button" class="close" onclick="$('#error-block').hide();">&times;</button>
    <h4>失败</h4> 新建班级...
</div>
</div>

<div class="well">
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <form id="tab" action="" method="post" id='form001'>
        <label>年级</label>
        <input type="text" value="${stu.name}" name="grade" class="input-xlarge">
        <label>班级名称</label>
        <input type="text" value="${stu.code}" name="gradeName" class="input-xlarge">
        <label>班主任</label>
        	<select name="gradeName" id="teaName" class="input-xlarge">
    		</select>
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

function saveClass() {
	var grade = $("input[name='grade']").val();
	var gradeName = $("input[name='gradeName']").val();
	var tea = $("#teaName").val();
	$.post("${pageContext.request.contextPath}/cls/saveCls.do",
			{
				'grade':grade,
				'gradeName':gradeName,
				'teacher':tea
				},function(data) {
		var json = $.parseJSON(data);
		if(json.success) {
			clearValue();
			$("#warning-block").show();
		} else {
			$("#error-block").show();
		}
	});
}
/**
 * 清除值
 */
function clearValue() {
	$("input[name='grade']").val("");
	$("input[name='gradeName']").val("");
}
$(function() {
	init();
});

function init() {
	//设置班主任
	var gradeName = $("#teaName").val();
	if(gradeName=='' || gradeName==null) {
		$.get("${pageContext.request.contextPath}/admin/getTeaList.do",{'limit':400000,'offset':0},function(data){
			var json = $.parseJSON(data);
			console.log(json);
			console.log(json.rows);
				$("#gradeName").empty();
				$.each(json.rows,function(i,n){
					var option = "<option value='"+n.id+"'>"+n.name+"</option>";
					$("#teaName").append(option);
				});
		});
	}
	
	
}
</script>
    