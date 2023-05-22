<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 신고</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="css/defcss.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="assets/ckeditor5/build/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
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
	        <div><h2>거래설정</h2></div>
			<div class="div2">
				<select style="height: 30px;">
					<option hidden> 거래자 선택 </option>
					<option value="1"> 스팸 홍보/ 도배 </option>
					<option value="2"> 음란물 </option>
					<option value="3"> 불법정보 포함 </option>
					<option value="4"> 청소년에게 유해한 내용 </option>
					<option value="5"> 욕설/혐오/차별적 표현 </option>
					<option value="6"> 개인정보 노출 </option>
				</select>
			</div>
			<div class="div2">
				<button id="btn" @click="">거래하기</button>
			</div>
     	</form>
	</div>
</body>
</html>

<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			tbno : "${tbno}",
			// 세션
			sessionId:"${sessionId}",
			sessionName:"${sessionName}",
			sessionNick:"${sessionNick}",
			sessionUstatus:"${sessionUstatus}",

		},methods: {



		}, created: function () {
			var self = this;
			console.log(self.tbno);
			console.log(opener.document.getElementById('tbno').value);
			console.log(self.sessionName);
			console.log(self.sessionNick);
			console.log(self.sessionUstatus);
			
			
			
		}
	});

</script>