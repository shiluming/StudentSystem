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
            <table class="table">
              <thead>
                <tr>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Mark</td>
                  <td>Tompson</td>
                  <td>the_mark7</td>
                </tr>
                <tr>
                  <td>Ashley</td>
                  <td>Jacobs</td>
                  <td>ash11927</td>
                </tr>
                <tr>
                  <td>Audrey</td>
                  <td>Ann</td>
                  <td>audann84</td>
                </tr>
                <tr>
                  <td>John</td>
                  <td>Robinson</td>
                  <td>jr5527</td>
                </tr>
                <tr>
                  <td>Aaron</td>
                  <td>Butler</td>
                  <td>aaron_butler</td>
                </tr>
                <tr>
                  <td>Chris</td>
                  <td>Albert</td>
                  <td>cab79</td>
                </tr>
              </tbody>
            </table>
            <p><a href="users.html">More...</a></p>
        </div>
    </div><!-- 学生奖惩情况 end... -->
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget1container">待审核信息 </div>
        <div id="widget1container" class="block-body collapse in">
            <h2>Using Ruby?</h2>
            <p>This template was developed with <a href="http://middlemanapp.com/" target="_blank">Middleman</a> and includes .erb layouts and views.</p>
            <p>All of the views you see here (sign in, sign up, users, etc) are already split up so you don't have to waste your time doing it yourself!</p>
            <p>The layout.erb file includes the header, footer, and side navigation and all of the views are broken out into their own files.</p>
            <p>If you aren't using Ruby, there is also a set of plain HTML files for each page, just like you would expect.</p>
        </div>
    </div><!-- 班主任 end -->
</div><!-- 学生奖惩情况 和 班主任  end... -->


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
