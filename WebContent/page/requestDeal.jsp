<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <style>
<!--
	
-->
.b {
	font-size:25px;
	margin-left: 30px;
}
</style>
<!-- 文件上传组件采用 Bootstrap FileInput, 至于源码没下载，是使用cdn方式 -->
<link href="//cdn.bootcss.com/bootstrap-fileinput/3.0.0/css/fileinput.min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/bootstrap-fileinput/3.0.0/js/fileinput.min.js"></script>

<!-- 提申请审核页面 -->
<script type="text/javascript">
	function doSubmit() {
		var name = $('input[name="stu.name"]').val();
		var tell = $('input[name="stu.tell"]').val();
		var requestReason = $('textarea[name="requestReason"]').val();
		var file = $("#file").val();
		if(name == '' || name == null) {
			jAlert('请输入学生名字', '提示');
			return;
		} 
		if(tell == '' || tell == null) {
			jAlert('请输入学生联系方式', '提示');
			return ;
		}
		if(requestReason == '' || requestReason == null) {
			jAlert('请输入申请原因', '提示');
			return ;
		}
		
		if(file == '' || file == null) {
			jAlert('请上传申请材料', '提示');
			return ;
		}
		$("#doForm").submit();
	}
	$(function(){
		var flag = '${msg[success]}';
		console.log(flag);
		if(flag) {
			jAlert('申请提交成功!', 'Alert Dialog');
		}
	});
</script>
<h1 class="page-title">填写审核信息面板</h1>

<div class="row-fluid">
    <div class="block">
        <p class="block-heading" data-toggle="collapse" data-target="#chart-container">
        	信息填写
        
        <div id="chart-container" class="block-body collapse in" style="height: 1000px">
            <div id="line-chart">
            	<div id="alertInfo">
					<div class="alert alert-block" id="warning-block">
				    <button type="button" class="close" onclick="$('#warning-block').hide();">&times;</button>
				    <h4>只能申请个人奖项，其他同学请登陆各自的账号申请，教导处声明</h4>
				</div>
				<div>
            
            	<div class="a" style="margin-left: 0px;margin-right: 0px">
            		<form id="doForm" action="${pageContext.request.contextPath}/stu/audit.do" enctype="multipart/form-data" method="post">
            		<table style="border: 0px;">
            			<tr style="height: 60px;">
            				<td>
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-user" aria-hidden="true"></span> 姓名：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="" name="stu.name" placeholder="请输入姓名" />
            				</td>
            				<td style="margin-left: 30px;">
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-phone" aria-hidden="true"></span> 电    话：</label></td>
            				<td>
            					<input style="float: left;" placeholder="请输入电话" name="stu.tell"/></td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-briefcase"></span> 年级：</label>
            				</td>
            				<td>
            					<input style="float: left;" class="" value="" placeholder="请输入年级" />
            				</td>
            				<td>
            					<label style="float:left;" class="b"><span class="icon-star"></span> 奖 项：</label>
            				</td>
            				<td>
            					<select name="name">
            						<option>sss</option>
            						<option>fff</option>
            					</select>
            				</td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-file"></span> 相关文件：</label>
            				</td>
            				<td colspan="3">
            					<input type="file" id="file" class="file" name="file">
            				</td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-home"></span> 申请原因：</label>
            				</td>
            				<td colspan="3">
            					<textarea rows="3" cols="6" style="width: 100%" name="requestReason"></textarea>
            				</td>
            			</tr>
            			
            			
            			<tr style="margin-top: 40px">
            				<td></td>
            				<td></td>
            			</tr>
            		</table>
            		</form><!-- 表单结束 -->	
            		
            	</div>
            	<table>
            		<tr style="margin-top: 40px">
            				<td></td>
            				<td colspan="2" style="text-align: center;"><button onclick="doSubmit()" class="btn btn-default">申请</button></td>
            				<td></td>
            			</tr>
            	</table>
            	
            </div>
        </div>
    </div>
</div>

