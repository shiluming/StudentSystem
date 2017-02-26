<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <style>
<!--
	.a {
		background: red;
	}
-->
.b {
	font-size:25px;
	margin-left: 30px;
}
</style>
<script type="text/javascript">

</script>
<h1 class="page-title">学生个人信息面板</h1>

<div class="row-fluid">
    <div class="block">
        <p class="block-heading" data-toggle="collapse" data-target="#chart-container">个人详细信息</p>
        <div id="chart-container" class="block-body collapse in">
            <div id="line-chart">
            	<div class="" style="margin-left: 0px;margin-right: 0px">
            		<table style="border: 0px;">
            			<tr style="height: 60px;">
            				<td>
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-user" aria-hidden="true"></span> 姓名：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="${loginUser.name}" placeholder="请输入姓名" />
            				</td>
            				<td style="margin-left: 30px;">
            					<label style="float: left" class="b" style="size: 30px"><span class="icon-phone" aria-hidden="true"></span> 电    话：</label></td>
            				<td>
            					<input style="float: left;" value="${loginUser.tell }" placeholder="请输入电话" /></td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-briefcase"></span> 年级：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="${stuGrade.gradeName }" />
            				</td>
            				<td>
            					<label style="float:left;" class="b"><span class="icon-star"></span> 入学时间：</label>
            				</td>
            				<td>
            					<input style="float: left;" value="${loginUser.joinTime }" />
            				</td>
            			</tr>
            			<tr style="height: 60px;">
            				<td>
            					<label style="float:left;" class="b"><span class="icon-home"></span> 地址：</label>
            				</td>
            				<td colspan="3">
            					<textarea rows="3" cols="6" style="width: 100%">${loginUser.address }</textarea>
            				</td>
            			</tr>
            		</table>
            		
            		
            	</div>
            	
            	
            </div>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#tablewidget">学生奖惩情况</div>
        <div id="tablewidget" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th>奖励名称</th>
                  <th>奖励时间</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Mark</td>
                  <td>Tompson</td>
                </tr>
              </tbody>
            </table>
            <p><a href="users.html">More...</a></p>
        </div>
    </div><!-- 学生奖惩情况 end... -->
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget1container">班主任信息 </div>
        <div id="widget1container" class="block-body collapse in">
            <h2>${stuTeacher.name}</h2>
            <p>This template was developed with <a href="http://middlemanapp.com/" target="_blank">Middleman</a> and includes .erb layouts and views.</p>
            <p>All of the views you see here (sign in, sign up, users, etc) are already split up so you don't have to waste your time doing it yourself!</p>
            <p>The layout.erb file includes the header, footer, and side navigation and all of the views are broken out into their own files.</p>
            <p>If you aren't using Ruby, there is also a set of plain HTML files for each page, just like you would expect.</p>
        </div>
    </div><!-- 班主任 end -->
</div><!-- 学生奖惩情况 和 班主任  end... -->


<div class="row-fluid">
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget2container">宿舍成员信息<span class="label label-warning">+10</span></div>
        <div id="widget2container" class="block-body collapse in">
            <table class="table">
              <tbody>
                  <tr>
                      <td>
                          <p><i class="icon-user"></i> 小明</p>
                      </td>
                      <td>
                          <p>13570323486</p>
                      </td>
                      <td>
                          <p>班级: web开发一班</p>
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
    <div class="block span6">
        <p class="block-heading">正在审核中的信息</p>
        <div class="block-body">
            <h2>Tip of the Day</h2>
            <p>Fava bean jícama seakale beetroot courgette shallot amaranth pea garbanzo carrot radicchio peanut leek pea sprouts arugula brussels sprout green bean. Spring onion broccoli chicory shallot winter purslane pumpkin gumbo cabbage squash beet greens lettuce celery. Gram zucchini swiss chard mustard burdock radish brussels sprout groundnut. Asparagus horseradish beet greens broccoli brussels sprout bitterleaf groundnut cress sweet pepper leek bok choy shallot celtuce scallion chickpea radish pea sprouts.</p>
            <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>
        </div>
    </div>
</div>
