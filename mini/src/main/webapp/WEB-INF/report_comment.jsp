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
				<option value=""> 스팸 홍보/ 도배 </option>
				<option value=""> 음란물 </option>
				<option value=""> 불법정보 포함 </option>
				<option value=""> 청소년에게 유해한 내용 </option>
				<option value=""> 욕설/혐오/차별적 표현 </option>
				<option value=""> 개인정보 노출 </option>
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