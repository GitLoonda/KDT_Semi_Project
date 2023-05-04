<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>회원가입</title>
</head>
<style>
</style>
<body>
	<div id="app" class="div1">
		<h2>회원가입</h2>
		<div class="div2">
			<input type="password" class="in" placeholder="아이디"></input>
			<button id="btn" @click="">중복확인</button>
		</div>
		<div class="div2">
			<input type="password" class="in" placeholder="비밀번호"></input>
		</div>
			<div class="div2">
			<input type="password" class="in" placeholder="비밀번호 확인"></input>
		</div>
		<div class="div2">
			<input type="text" class="in" placeholder="이름"></input>
		</div>
		<div class="div2">
			<input type="text" class="in" placeholder="닉네임"></input>
		</div>
		<div class="div2">
			<label> 성별 
				<select style="width : 100px;">
					<option value=""></option>
					<option value=""></option>
				</select>
			</label>
		</div>
		<div class="div2">
			<label>
				<select style="width : 100px;">
					<option value=""></option>
					<option value=""></option>
				</select>
				<span> 년</span>
			</label>
			<label>
				<select style="width : 100px;">
					<option value=""></option>
					<option value=""></option>
				</select>
				<span> 월</span>
			</label>
			<label>
				<select style="width : 100px;">
					<option value=""></option>
					<option value=""></option>
				</select>
				<span> 일</span>
			</label>
		</div>
		<div class="div2">
			<input type="text" class="in" placeholder="전화번호"></input>
		</div>
		<div class="div2">
			<input type="text" class="in" placeholder="이메일"></input>
		</div>
		<div class="div2">
			<input type="text" class="in" placeholder="우편번호"></input>
			<button id="btn" @click="fnAdr">주소 찾기</button>
			<input type="text" class="in" placeholder="상세주소"></input>
		</div>
		<div class="div2">
			<button id="btn" @click="fnJoin">회원가입</button>
			<button id="btn" @click="fnCancle">취소</button>
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
    	fnAdr : function(){
    		
    	}
    
    	,fnJoin : function(){
    		
    	}
    
    	,fnCancle : function(){
    		
    	}
    	
    }   
    , created: function () {
    
	}
});
</script>