<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>댓글 신고</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<form id="report">
			
            <a href = "#"><img src=""></a>
            <br><br>
            <div class="logoImg"><h2>댓글 신고</h2></div>
		<div class="div2">
			<select>
				<option value=""> 신고 사유 </option>
			</select>
		</div>
		<div class="div2">
			<input type="text" placeholder="세부사유"></input>
		</div>
		<div class="div2">
			<button id="btn" @click="">신고하기</button>
		</div>
     </form>
	</div>
</body>
</html>

<script>

</script>