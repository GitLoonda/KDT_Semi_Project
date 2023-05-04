<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	
	* {
	            font-family: 'Noto Sans KR', sans-serif;
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
	    border-radius: 10px;
	    display: block;
	    letter-spacing: 1px;
	    margin: auto;
	    padding: 7px 25px;
    }
	
    a {
       text-decoration: none;
       color: #9B9B9B;
       font-size: 12px;
    }
	
</style>
<body>
	<div id="app" class="div1">
		<div class="logoImg"><h2>로고</h2></div>
		<div class="div2">
			<input type="text" class="in" placeholder="아이디"></input>
		</div>
		<div class="div2">
			<input type="password" class="in"  placeholder="비밀번호"></input>
		</div>
		<div class="div2">
			<button id="btn" @click="">로그인</button>
		</div>
		<div>계정이 없으신가요? <a href="#">회원가입</a> </div>
		<div>아이디가 기억나지 않으시나요? <a href="#">아이디 찾기</a> </div>
		<div>비밀번호가 기억나지 않으시나요? <a href="#">비밀번호 찾기</a> </div>
		
	</div> 
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {

    }   
    , methods: {
    	
    }   
    , created: function () {
    
	}
});
</script>