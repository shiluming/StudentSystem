<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div style="margin-top: 20%;margin-left: 40%">
	<div class="col-md-4" style=""><h1 class="page-title">学生搜索系统</h1></div>
</div>
<div style="margin-top: 50px;margin-left: 40%">

    <div class="input-group">
      <form action="${pageContext.request.contextPath}/stu/searchList.do" method="post" onsubmit="return checkSearch()">
      <input type="text" id="searchKey" name="searchKey" class="form-control">
    	<span class="input-group-btn">
        <button class="btn btn-default" type="submit">Go！</button>
      </span>
      </form>
    </div><!-- /input-group -->


</div>
<script type="text/javascript">

function checkSearch() {
	var searchKey = $.trim($("#searchKey").val());
	if(searchKey=='') {
		return false;
	}
	return true;
}

</script>
