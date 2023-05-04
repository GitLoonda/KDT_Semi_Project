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
    <div class="container">
        <form id="signup">
            <fieldset>
                <img src="../images/insta.jpg">
                <br><br>
               <div id="idtext">아이디 찾기</div>
                <ul>
                  <li>
                    <label for="id"> 이름 </label>
                    <br>
                    <input id="id" name="id" type="text" required>
                  </li>
                  <li>
                    <label for="ps">이메일</label>
                    <br>
                    <input id="ps" name="ps" type="password" required>
                  </li>          
                </ul>
                <br>
                <form id="signup">
                    <button type="submit" @click="fnsearch"> 찾기 </button> 
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
    	fnsearch : function(){
    		
    	}
    	
    }   
    , created: function () {
    
	}
});
</script>