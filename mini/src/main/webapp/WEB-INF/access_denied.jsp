<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<title>접근 거부</title>
</head>
<style>
	* {
		text-decoration: none;
		list-style: none;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.div1 {
		width : 1080px;
		margin : auto;
	}
	.controller {
		width : 100%;
		margin : auto;
		background : #ccc;
	}
	.controller div {
		position : absolute;
		top : 50%;
		left : 50%;
		padding : 50px;
		text-align : center;
	}
	.controller div a {
		color : #5a5d69;
	}
	.controller div a:visited {
		color : #5a5d69;
	} 
	
</style>
<body>
	<div id="app" class="div1">
		<div class="container">
			<div>
				<p>페이지 접근이 거부되었습니다.</p>
				<a href="javascript:;" @click="fnMain">메인화면</a>
			</div>
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
    	fnMain : function() {
    		location.href = "main.do";
    	} 
    }   
    , created: function () {
    
	}
});
</script>