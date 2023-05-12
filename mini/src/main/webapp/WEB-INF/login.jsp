<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>회원가입</title>
</head>
<style>
	* {
		text-decoration: none;
		list-style: none;
	}
	a:visited {
		color: #5a5d69;
	}
	.container {
		width : 500px;
		margin : 200px auto;
		text-align: center;
		border-radius: 10%;
		background-color: #ccc;
		padding : 30px;
	}
	.container div {
		margin-bottom: 40px;
	}
	input {
		width: 20em;
		height : 2em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
	}
	input:focus {
		outline: none;
	}
	button {
		width : 5.5em;
		height : 2.5em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
		background-color: white;
	}
</style>
<body>
	<div id="app" class="div1">
		<div class="container">
			<div class="logoImg"><h2>로고</h2></div>
			<div class="div2">
				<input type="text" class="in" placeholder=" 아이디"></input>
			</div>
			<div class="div2">
				<input type="password" class="in"  placeholder=" 비밀번호"></input>
			</div>
			<div class="div2">
				<button id="btn" @click="">로그인</button>
			</div>
			<div>계정이 없으신가요? <a href="http://localhost:8080/join.do">회원가입</a> </div>
			<div>아이디가 기억나지 않으시나요? <a href="http://localhost:8080/login/findId.do">아이디 찾기</a> </div>
			<div>비밀번호가 기억나지 않으시나요? <a href="http://localhost:8080/login/findPw.do">비밀번호 찾기</a> </div>
		</div>
	</div> 
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {

    }   
    , methods: {
    	
    }   
    , created: function () {
    
	}
});
</script>