<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>아이디 찾기</title>
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
	.div2 {
		margin-bottom : 30px;
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
	.btn2 {
		width : 10em;
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
			<h2>아이디 찾기</h2>
			<template v-if="verifyFlg == 1">
				<div class="div2">
					<p class="p1">이름</p>
					<input v-model="info.name" type="text" class="in">
				</div>
				<div class="div2">
					<p class="p1">이메일</p>
					<input v-model="info.email" type="email" class="in">
				</div>
				<button class="btn" @click="fnsearch">찾기</button>
			</template>
			<template v-if="verifyFlg == 2">
				<div class="div2">
					<p class="p1">{{info.name}}님의 아이디 : </p>
					<input v-model="info.id" type="text" class="in" disabled>
				</div>
				<button class="btn" @click="fnLogin">로그인</button>
				<button class="btn2" @click="fnFindPw">비밀번호 초기화</button>
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
    	fnsearch : function(){
    		var self = this;
    		var nparmap = {name : self.info.name, email : self.info.email};
    		$.ajax({
                url:"/find/id.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
 					if(data.result == "success") {
 						self.info.id = data.user.id;
 						self.verifyFlg = 2;
 					}
 					else {
 						alert("입력하신 정보와 일치하는 계정이 존재하지 않습니다.");
 						self.info.name = "";
 						self.info.email = "";
 					}
                 }
            }); 
    	}
    	, fnLogin : function() {
    		location.href = "login.do";
    	}
    	, fnFindPw : function() {
    		location.href = "findPw.do";
    	}
    	
    }   
    , created: function () {
    
	}
});
</script>