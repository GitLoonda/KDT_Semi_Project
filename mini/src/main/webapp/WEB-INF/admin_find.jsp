<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="../js/jquery.js"></script>
		<script src="../js/vue.js"></script>
		<title>비밀번호 찾기</title>
		<link href="/img/main/unity-logo-200x100-1.jpg" rel="shortcut icon" type="image/x-icon">
		<style>
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #ADD4D9;
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
	            background-color: #9B9B9B;
	            margin-bottom: 20px;
	            color: white;
	            border-radius: 5px;
	            border-style: hidden;
	            margin-right: 8px; 
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
			<h2>🤷🏻‍♀️ 비밀번호 찾기</h2>
			<div>
			
				<div class="div2">
					<input type="text" class="in" v-model="id" placeholder="아이디"></input>
				</div>
				<div class="div2">
					<input type="text" class="in" v-model="email" placeholder="이메일"></input>
				</div>
				<div class="div2">
					<button id="btn" @click="fnMatch()">입력</button>
				</div>
			
			
				<div class="div2" v-if="quiz != ''">
					{{quiz}}
					<div class="div2">
						<input type="text" class="in" v-model="answer" placeholder="답변하세요"></input>
				</div>
		
				<div class="div2">
					<button id="btn" @click="fnFind()">비밀번호 찾기</button>
				</div>
					<div class="div2" v-if="passwd != ''">비밀번호는 {{passwd}} 입니다</div>
				</div>
			</div>
			<div><a href="login.do"> ▪ 로그인 하시겠습니까? ▪ </a></div>
			<a href="join.do"> ▪ 아직 회원가입을 안하셨나요? ▪ </a>
		</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	list : [],
    	quizlist : [],
    	id : "",
    	email : "",
    	passwd : "",
    	quiz : "",
    	answer : "",
    	user : {}
    }   
    , methods: {
    	
    	fnFind : function(){
	        var self = this;
	        var nparmap = {id : self.id , answer : self.answer};
	        $.ajax({
	            url:"/admin/findpasswd.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 
	            	console.log(data);
	            	
	            	if(data.result == "success"){
                		self.passwd = data.user.passwd;
                	}else{
                		alert(data.message);
                	}
	            }
	        }); 
	    }
    	, fnMatch : function(){
            var self = this;
            var nparmap = {id : self.id, email : self.email};
            $.ajax({
                url:"/admin/find.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	
                	if(data.message != undefined){
                		alert(data.message);
                	}
                	if(data.result == "success"){
                		self.quiz = data.user.cinfo;
                	}
                }
            }); 
        }
    	, fnJoin : function () {
    		location.href = "/admin/join.do"
    	}
    }   
    , created: function () {
    	
	}
});
</script>
