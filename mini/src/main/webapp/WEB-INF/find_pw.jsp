<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<link rel="stylesheet" href="css/find.css">
	<title>비밀번호 찾기</title>
</head>
<style>
	* {
		font-decoration : none;
		list-style : none;
	}
</style>
<body>
	<div id="app">
		<div class="logoImg"><h2>비밀번호 찾기</h2></div>
		<template v-if="verifyFlg == false">
			<div class="div2">
				<input type="text" class="in" placeholder="아이디" required></input>
			</div>
			<div class="div2">
				<input type="text" class="in"  placeholder="이름" required></input>
			</div>
			<div class="div2">
				<input type="email" class="in" placeholder="이메일" required></input>
			</div>
			<div class="div2">
	         	<button id="btn" @click="fnset">찾기</button>
			</div>
		</template>
		<template v-if="verifyFlg == true">
			<div class="div2">
				<p class="p1">아이디</p>
				<input type="text" class="in" required></input>
			</div>
			<div class="div2">
				<p class="p1">이름</p>
				<input type="text" class="in" required></input>
			</div>
			<div class="div2">
				<p class="p1">이메일</p>
				<input type="email" class="in" required></input>
			</div>
			<div class="div2">
	         	<button id="btn" @click="fnset">찾기</button>
			</div>
		</template>
		
	</div>
</body>
</html>


<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		verifyFlg : false;
    }   
    , methods: {
    	fnset : function(){
    		
    	}
    }   
    , created: function () {
    
	}
});
</script>