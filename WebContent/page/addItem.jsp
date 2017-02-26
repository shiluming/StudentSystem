<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/jquery-1.8.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/page/lib/bootstrap/js/bootstrap.js"></script>
<!-- 添加奖项页面 -->
<script type="text/javascript">

function saveItem() {
	var name = $("input[name='name']").val();
	var auditor = $("select[name='gradeName']").val();
	var type = $("select[name='type']").val();
	console.log("name:" + name + " "+ auditor + " " + type);	
	$.post("${pageContext.request.contextPath}/admin/saveItem.do",
			{
				'name':name,
				'teaId':auditor,
				'type':type
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
function clearValue() {
	$("input[name='name']").val("");
	$("input[name='tell']").val("");
	$("input[name='email']").val("");
	$("input[name='age']").val("");
	$("textarea[name='address']").val("");
}

function alert11() {
	jAlert('This is a custom alert box', 'Alert Dialog');
}
</script>
<style>
.b {
	font-size:25px;
	margin-left: 30px;
}
</style>

<div class="btn-toolbar">
    <button class="btn btn-primary"><i class="icon-save"></i><a href="#" onclick="saveItem();"> 添加</a></button>
  <div class="btn-group">
  </div>
</div>
<div class="alert alert-block hide" id="error-block">
    <button type="button" class="close" onclick="$('#error-block').hide();">&times;</button>
    <h4>失败</h4> 添加失败...
</div>
<div id="alertInfo">
	<div class="alert alert-block hide" id="warning-block">
    <button type="button" class="close" onclick="$('#warning-block').hide();">&times;</button>
    <h4>成功!</h4> 添加成功！
	</div>
</div>

<div class="row-fluid">
    <div class="block">
        <p class="block-heading" data-toggle="collapse" data-target="#chart-container">填写奖项信息</p>
        <div id="chart-container" class="block-body collapse in">
            <div id="line-chart">
            	<div class="a" style="margin-left: 0px;margin-right: 0px">
            	
            		<table style="border: 0px;">
            			<tr style="height: 60px;">
            				<td>
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-user" aria-hidden="true"></span> 名称：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="" name="name" placeholder="请输入奖项名称" />
            				</td>
            				<td style="margin-left: 30px;">
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-phone" aria-hidden="true"></span> 审核人：</label></td>
            				<td>
            					<select name="gradeName" id="teaName" class="input-xlarge">
    							</select>
            					
            					</td>
            			</tr>
            			
            			<tr style="height: 60px;">
            				
            				<td>
            					<label style="float:left;" class="b"><span class="icon-star"></span> 类 别：</label>
            				</td>
            				<td>
            					<select name="type">
            						<option>奖励</option>
            					</select>
            				</td>
            			</tr>
            			
            			<tr>
            				<td></td>
            			</tr>
            		</table>
            			
            	</div>
            </div>
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
    