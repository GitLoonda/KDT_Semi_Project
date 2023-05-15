<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 신고</title>
</head>
<style>
body{
	width: 650px;
	height: 550px;
	top: 300px;
	left: 300px;
	margin: auto;
	text-align: center;
}
img{
	margin-top: 30px;
}
select, textarea{
	width: 50%;
	margin: 10px;
	padding: 3px;
}
#btn {
	margin-top: 30px;
}
</style>
<body>
	<div id="app">
		<form id="report">
	        <img src="img/main/unity-logo-200x100-1.jpg">
	        <div><h2>게시글 신고</h2></div>
			<div class="div2">
				<select style="height: 30px;">
					<option hidden> 신고 사유 </option>
					<option value=""> 스팸 홍보/ 도배 </option>
					<option value=""> 음란물 </option>
					<option value=""> 불법정보 포함 </option>
					<option value=""> 청소년에게 유해한 내용 </option>
					<option value=""> 욕설/혐오/차별적 표현 </option>
					<option value=""> 개인정보 노출 </option>
				</select>
			</div>
			<div class="div2">
				<textarea style="resize: none; height: 80px; " placeholder="세부사유"></textarea>
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