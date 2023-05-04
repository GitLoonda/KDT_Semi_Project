<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<style>
</style>
<body>
	<div id="app" class="div1">
		<div class="logoImg" ><h2>로고</h2></div>
		<div class="div2">
			<input type="text" class="in" placeholder="아이디"></input>
		</div>
		<div class="div2">
			<input type="password" class="in"  placeholder="비밀번호"></input>
		</div>
		<div class="div2">
			<button id="btn" @click="">로그인</button>
		</div>
		<div>계정이 없으신가요? <a href="http://localhost:8080/join.do">회원가입</a> </div>
		<div>아이디가 기억나지 않으시나요? <a href="http://localhost:8080/login/findId.do">아이디 찾기</a> </div>
		<div>비밀번호가 기억나지 않으시나요? <a href="http://localhost:8080/login/findPw.do">비밀번호 찾기</a> </div>
		
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