<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/jquery-1.8.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/page/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">

function saveTea() {
	var name = $("input[name='name']").val();
	var tell = $("input[name='tell']").val();
	var email = $("input[name='email']").val();
	var age = $("input[name='age']").val();
	var address = $("textarea[name='address']").val();
	var sexual = $("select[name='sexual']").val();
	<!--
	//姓名验证
	var namereg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
	if(!namereg.test(name)) {
		jAlert('名字不符合规范！', 'Alert Dialog');
		return ;
	}
	//电话号码验证
	var tellreg =/^1\d{10}$/;
	if(!tellreg.test(tell)) {
		jAlert('请输入正确的电话号码', 'Alert Dialog');
		return ;
	}

	//email 验证
	var emailreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(!emailreg.test(email)) {
		jAlert('电子邮件格式输入错误！', 'Alert Dialog');
		return ;
	}
	-->
	console.log('name:' + name + ", tell:"+tell+" , email: "+email+", age: "+ age + " , address : " + address + " ,sexula : " + sexual );
	$.post("${pageContext.request.contextPath}/tea/saveTeacher.do",
			{
				'name':name,
				'tell':tell,
				'age':age,
				'address':address,
				'sex':sexual,
				'email':email
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
    <button class="btn btn-primary"><i class="icon-save"></i><a href="#" onclick="saveTea();"> Save</a></button>
  <div class="btn-group">
  </div>
</div>
<div class="alert alert-block hide" id="error-block">
    <button type="button" class="close" onclick="$('#error-block').hide();">&times;</button>
    <h4>失败</h4> 新建班级...
</div>
<div id="alertInfo">
	<div class="alert alert-block hide" id="warning-block">
    <button type="button" class="close" onclick="$('#warning-block').hide();">&times;</button>
    <h4>成功!</h4> 老师入职
	</div>
</div>

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
            					<input style="float: left;" value="" name="name" placeholder="请输入姓名" />
            				</td>
            				<td style="margin-left: 30px;">
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-phone" aria-hidden="true"></span> 电    话：</label></td>
            				<td>
            					<input style="float: left;" value="" name="tell" placeholder="请输入电话" /></td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-bookmark"></span> Email：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="" name="email" placeholder="请输入Email" />
            				</td>
            				<td>
            					<label style="float:left;" class="b"><span class="icon-qrcode"></span> 年 龄：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="" name="age" placeholder="请输入年龄"/>
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
            					<textarea rows="3" cols="6" style="width: 100%" placeholder="请输入地址" name="address"></textarea>
            				</td>
            			</tr>
            			<tr>
            				<td></td>
            			</tr>
            		</table>
            		</form><!-- 表单结束 -->
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
    