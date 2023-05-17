<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>비밀번호 초기화</title>
</head>
<style>
	* {
		font-decoration : none;
		list-style : none;
	}
	.container {
		width : 500px;
		margin : 50px auto;
		text-align: center;
		background-color : #ccc;
		border-radius : 40px;
		padding : 50px 30px;
	}
	.logobox {
		margin-bottom : 50px;
	}
	.logobox img {
		margin-left : 300px;
		border-radius : 20px;
	}
	.container .div2 {
		margin-left: 90px;
		margin-bottom: 40px;
		text-align: left;
	}
	h2 {
		margin-bottom: 40px;
	}
	input:focus {
		outline: none;
	}
	input {
		width: 20em;
		height : 2em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
	}
	.btn {
		width : 6em;
		height : 2em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		background-color: none;
		margin-bottom : 50px;
	}
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="logobox">
				<img src="img/main/unity-logo-200x100-1.jpg" alt="logo">
			</div>
			<h2>비밀번호 초기화</h2>
			<template v-if="verifyFlg == 1">
				<div class="div2">
					<p class="p1">아이디</p>
					<input v-model="info.id" type="text" class="in">
				</div>
				<div class="div2">
					<p class="p1">이름</p>
					<input v-model="info.name" type="text" class="in">
				</div>
				<div class="div2">
					<p class="p1">이메일</p>
					<input v-model="info.email" type="email" class="in">
				</div>
		        <button class="btn" @click="fnFind">확인</button>
			</template>
			<template v-if="verifyFlg == 2">
				<div class="div2">
					<p class="p1">비밀번호 찾기 질문</p>
					<input v-model="info.quiz" type="text" class="in" disabled>
				</div>
				<div class="div2">
					<p class="p1">비밀번호 찾기 답변</p>
					<input v-model="info.answer" type="text" class="in">
				</div>
				<div class="div2">
		         	<button class="btn" @click="fnQuiz">확인</button>
				</div>
			</template>
			<template v-if="verifyFlg == 3">
				<div class="div2">
					<p class="p1">비밀번호 재설정</p>
					<input v-model="info.passwd" type="password" class="in">
				</div>
				<div class="div2">
					<p class="p1">비밀번호 확인</p>
					<input v-model="info.passwd2" type="password" class="in">
				</div>
		         	<button class="btn" @click="fnReset">확인</button>
			</template>
		</div>
	</div>
</body>
</html>


<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		verifyFlg : 1,
		info : {}
    }   
    , methods: {
    	fnFind : function(){
    		var self = this;
    		if(self.info.id == null) {
    			alert("아이디를 입력해주세요.");
    			return;
    		}
    		if(self.info.name == null) {
    			alert("이름을 입력해주세요.");
    			return;
    		}
    		if(self.info.email == null) {
    			alert("이메일을 입력해주세요.");
    			return;
    		}
    		var nparmap = self.info;
    		$.ajax({
                url:"/find/validate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
 					if(data.result == "success") {
 						self.verifyFlg = 2;
 						self.info.quiz = data.user.quiz;
 					}
 					else {
 						alert("입력하신 정보와 일치하는 계정이 존재하지 않습니다.");
 						self.info.id = "";
 						self.info.name = "";
 						self.info.email = "";
 					}
                 }
            }); 
    	}
    	, fnQuiz : function() {
    		var self = this;
    		if(self.info.answer == null) {
    			alert("비밀번호 초기화 답변을 입력해주세요.");
    			return;
    		}
    		var nparmap = self.info;
    		$.ajax({
                url:"/find/quiz.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
 					if(data.result == "success") {
 						self.verifyFlg = 3;
 					}
 					else {
 						alert("비밀번호 초기화 답변과 일치하지 않습니다.");
 						self.info.answer = "";
 					}
                 }
            }); 
    	} 
    	, fnReset : function() {
    		var self = this;
    		var pwJ = /^[A-Za-z0-9]{6,12}$/;
    		if(self.info.passwd == null || self.info.passwd2 == null) {
				alert("비밀번호와 비밀번호 확인을 입력해주세요.");
				return;
			}
			if(!pwJ.test(self.info.passwd)) {
				alert( "비밀번호는 6~12자리의 영문대소문자/숫자로 구성되어야합니다.");
				return;
			}
			if(self.info.passwd != self.info.passwd2) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
    		var nparmap = {id : self.info.id, passwd : self.info.passwd};
    		$.ajax({
                url:"/find/reset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
 					if(data.result == "success") {
 						alert("비밀번호를 변경하였습니다.");
 						location.href="login.do";
 					}
 					else {
 						alert("비밀번호 변경에 실패하였습니다.");
 						location.href="findPw.do";
 					}
                 }
            }); 
    	} 
    
    }   
    , created: function () {
    
	}
});
</script>