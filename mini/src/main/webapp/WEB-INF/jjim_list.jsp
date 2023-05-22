<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>찜 목록</title>
</head>
<style>
 * {
 	text-decoration : none;
 	line-style : none;
 }
 .container {
 	width : 1080px;
 	margin : auto;
 	margin-top : 250px;
 	
 }
 .listbox {
 	width : 80%;
 	display : block;
 	margin : auto;
 	text-align : center;
 }
 .itembox {
 	width : 100%;
 	display : flex;
 	margin : 25px 0;
 	background : #eee;
 }
 .itembox a {
 	float : right;
 	margin : 10px;
 }
 .imgbox {
 	width : 150px;
 	height : 150px;
 	margin : 15px;
 	background-image : url("../img/share/no-image01.gif") ;
 	background-size : 100% 150px;
 }
 .imgbox img {
 	width : 150px;
 	height : 150px;
 }
 .descbox {
 	width : 80%;
 }
 .descbox p {
 	text-align : left;
 	font-size : 0.8em;
 }
 .btnbox button {
 	width : 5em;
 	height : 2em;
 	float : right;
 	margin : 0 10px 10px 10px;
 	border-radius : 0;
 	border : none;
 }
 .btnbox button:hover {
 	background : #ccc;
 }
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>찜 목록</h2>
			<div class="listbox">
				<div class="itembox">
					<div class="imgbox">
						<img src="" alt="">
					</div>
					<div class="descbox">
						<p>BSTATUS</p>
						<p>BTITLE</p>
						<p>NICK</p>
						<p>BPRICE</p>
						<p>LOCAL1 LOCAL2 LOCAL3</p>
						<div class="btnbox">
							<button>거래하기</button>
						</div>
					</div>
					<a @click="">X</a>
				</div>
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