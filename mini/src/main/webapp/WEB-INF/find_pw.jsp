<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/find.css">
	<title>아이디 찾기</title>
</head>
<style>
</style>
<body>
    <div class="container">
        <form id="signup">
            <fieldset>
                <img src="../images/insta.jpg">
                <br><br>
               <div id="idtext">비밀번호 초기화</div>
                <ul>
                  <li>
                    <label for="id">아이디</label>
                    <br>
                    <input id="id" name="id" type="text" required>
                  </li>
                  <li>
                    <label for="name">이름</label>
                    <br>
                    <input id="name" name="name" type="text" required>
                  </li>  
                  <li>
                    <label for="email">이메일</label>
                    <br>
                    <input id="email" name="email" type="email" required>
                  </li>        
                </ul>
                <br>
                <form id="signup">
                    <button type="submit"> 초기화 </button> 
                    </form>
              </fieldset>
     </form>
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