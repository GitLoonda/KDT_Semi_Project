<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/login.css">
	<title>아이디 찾기</title>
</head>
<style>
</style>
<body>
        <form id="signup">
                <a href = "http://localhost:8080/main.do"><img src="../images/insta.jpg"></a>
                <br><br>
               <div class="logoImg"><h2>아이디 찾기</h2></div>
		<div class="div2">
			<p class="p1">이름</p>
			<input type="text" class="in" required></input>
		</div>
		<div class="div2">
			<p class="p1">이메일</p>
			<input type="email" class="in" required></input>
		</div>
             <div class="div2">
			<button id="btn" @click="fnsearch">찾기</button>
			
		</div>
     </form>
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {

    }   
    , methods: {
    	fnsearch : function(){
    		
    	}
    	
    }   
    , created: function () {
    
	}
});
</script>