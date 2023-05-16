<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<jsp:include page="/defult/def.jsp"></jsp:include>
			<<style>
				@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
		
				* {
					font-family: 'Noto Sans KR', sans-serif;
				}
		
				body {
					background-color: #1BBC9B;
				}
		
				.div1 {
					margin: auto;
					width: 300px;
					background-color: #EEEFF1;
					border-radius: 5px;
					text-align: center;
					padding: 20px;
				}
				 .div2 {
					margin: auto;
					width: 250px;
					background-color: #EEEFF1;
					border-radius: 5px;
					text-align: center;
					padding: 20px;
				}
		
				input {
					width: 100%;
					padding: 10px;
					box-sizing: border-box;
					border-radius: 5px;
					border: none;
				}
		
				.in {
					margin-bottom: 10px;
				}
		
				#btn {
					background-color: #1BBC9B;
					margin-bottom: 30px;
					color: white;
				}
		
				a {
					text-decoration: none;
					color: #9B9B9B;
					font-size: 12px;
				}
			</style>
		</head>
		<body>
			<div id="app" class="div1">
				<div class="div2">
					<input type="text" class="in" v-model="id" placeholder="아이디"></input>
				</div>
				<div class="div2">
					<input type="password" class="in" v-model="pwd" placeholder="비밀번호"></input>
				</div>
				<div class="div2">
					<button id="btn" @click="fnLogin">로그인</button>
					<button id="btn" >회원가입</button>
				</div>
				<a href="find.do">비밀번호를 잊어버리셨나요?</a>
			</div> 
		</body>
	</html>
	<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			id : "",
			pwd : "",
			user : {}
		}   
		, methods: {
			fnLogin : function(){
				var self = this;
				var nparmap = {id : self.id, pwd : self.pwd};
				$.ajax({
					url:"/login.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						if(data.result == "success"){
							location.href="/bbs.do"
						}
					}
				}); 
			} 
		}   
		, created: function () {
		
		}
	});
	</script>