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
			<div class="logoImg">
				<img src="img/main/unity-logo-200x100-1.jpg">
			</div>
			<div class="div2">
				<input v-model="id" type="text" class="in" placeholder=" 아이디"></input>
			</div>
			<div class="div2">
				<input v-model="passwd" type="password" class="in" placeholder=" 비밀번호"></input>
			</div>
			<div class="div2">
				<button id="btn" @click="fnValidate">로그인</button>
			</div>
			<div>계정이 없으신가요? <a @click="fnJoin">회원가입</a> </div>
			<div>아이디가 기억나지 않으시나요? <a @click="fnFindId">아이디 찾기</a> </div>
			<div>비밀번호가 기억나지 않으시나요? <a @click="fnFindPw">비밀번호 찾기</a> </div>
		</div>
	</div> 
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		id : "",
		passwd : ""
    }   
    , methods: {
    	fnJoin :function() {
    		location.href = "join.do";
    	}
    	, fnFindId :function() {
    		location.href = "login/findId.do";
    	}
    	, fnFindPw :function() {
    		location.href = "login/findPw.do";
    	}
    	, fnValidate : function() {
            var self = this;
            var nparmap = {id : self.id, passwd : self.passwd};
            $.ajax({
                url:"/login/validate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	if(data.user.id == self.id) {
                		location.href= "main.do";
                	}
                	else if(data.result == "fail") {
                		alert("입력하신 아이디, 비밀번호와 일치하는 계정이 존재하지 않습니다.");
                	}
                }
            }); 
    	}
    }   
    , created: function () {
    
	}
});
</script>