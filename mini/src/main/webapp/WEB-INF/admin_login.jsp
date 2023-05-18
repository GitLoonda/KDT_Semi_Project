<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="../js/jquery.js"></script>
		<script src="../js/vue.js"></script>
		<title>관리자 로그인</title>
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
	            margin-bottom: 5px;
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
			<h2>👨🏻‍✈️ 관리자 로그인</h2>
			<div class="div2">
				<input type="text" class="in" v-model="id" placeholder="아이디"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" v-model="pw" placeholder="비밀번호"></input>
			</div>
			<div class="div2">
				<button id="btn" @click="fnLogin()">로그인</button>
				<button id="btn" @click="fnJoin" >관리자 등록</button>
			</div>
			<a href="/login.do"> ▪ 일반 사용자로 로그인 ▪ </a>
			<div><a href="find.do"> ▪ 비밀번호를 잊어버리셨나요? ▪ </a></div>
		</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : "",
    	pw : "",
    	user : {},
    }   
    , methods: {
    	fnLogin : function(){
            var self = this;
            var nparmap = {id : self.id, pw : self.pw};
            $.ajax({
                url:"/admin/login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	alert(data.message);
                	if(data.result == "success"){
                		location.href="/admin/main.do"
                	}
                }
            }); 
        }
    	,
    	fnJoin : function () {
    		location.href = "/admin/join.do"
    	}
    }   
    , created: function () {
    
	}
});
</script>
