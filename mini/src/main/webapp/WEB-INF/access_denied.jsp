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
		margin-top : 200px;
		text-align : center;
	}
	.container div a {
		color : #5a5d69;
	}
	.container div a:visited {
		color : #5a5d69;
	}
	.container div button {
		background : white;
		border : none;
		width: 8em;
    	height: 30px;
	}
	.container div button:hover {
		background : #ccc;
	}
	
</style>
<body>
	<div id="app" class="div1">
		<div class="container">
			<div>
				<p>페이지 접근이 거부되었습니다.</p>
				<a href="javascript:;" @click="fnMain"><button>메인화면</button></a>
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