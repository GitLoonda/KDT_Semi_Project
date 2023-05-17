<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="../js/jquery.js"></script>
		<script src="../js/vue.js"></script>
		<title>관리자 등록</title>
		<style>
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
	            padding: 10px;
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
			<h2>관리자 등록</h2>
			<div class="div2">
				<input @keyup="fnChange" v-model="info.id" type="text" class="in" placeholder="아이디" ></input>
				<template v-if="info.joinId != ''">
					<span v-if="loginFlg && info.id != ''">사용가능한 아이디</span>
					<span v-else style="color:red;">사용불가</span>
				</template>
			
			
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호" v-model="info.pw"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호 확인" v-model="info.chpw"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="이름" v-model="info.name"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="닉네임" v-model="info.nick"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="010.xxxx.xxxx"  v-model="info.phone"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="...@example.com"  v-model="info.email"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="주소" v-model="info.roadFullAddr"></input>
				<button @click="fnSearchAddr">주소 검색</button>
			</div>
			
			<div class="div2">
				<select v-model="info.quiz">
					<option value="" selected>::::: 질문을 선택해주세요 :::::</option>
					<option v-for="(item , index) in quizList" :value="item.cnum">{{item.cinfo}}</option>
				</select>
			</div>
			
			<div class="div2">
				<input type="text" class="in" placeholder="답변" v-model="info.answer"></input>
			</div>
			

			<div class="div2">
				<button id="btn" @click="fnAddInfo" >등록</button>
				<button id="btn" @click="fnCancel" >취소</button>
			</div>
			
			<a href="login.do">로그인 하시겠습니까?></a>
			
		</div> 
	</body>
</html>
<script type="text/javascript">
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}
var app = new Vue({ 
    el: '#app',
    data: {
    	info : {
			id : ""
			, pw : ""
			, chpw : ""
			, name : ""
			, nick : ""
			, phone : ""
			, email : ""
			, roadFullAddr : ""
			, quiz : ""
			, answer : ""
    	}
    	, quizList : []
		, loginFlg : true
		, sessionId : "${sessionId}"
		
    }   
    , methods: {
    	
    	 fnGetQuiz : function(){
 	    	var self = this;
 	    	var nparmap = {};
 	        $.ajax({
 	            url:"/admin/quiz.dox",
 	            dataType:"json",	
 	            type : "POST", 
 	            data : nparmap,
 	            success : function(data) {
 	            	self.quizList = data.quizList
 	            }
 	        }); 
 	    }
 	    
 	    , 
    	
    	fnAddInfo  : function () {
    		var self = this;
    		console.log(self.info.quiz);
    		if(self.info.id == ""){
    			alert("아이디를 입력해라");
    			return;
    		}
    		
    		if(self.info.pw != self.info.chpw){
    			alert("비밀번호 두개가 다르다");
    			return;
    		}
    		if(self.info.name == ""){
    			alert("이름 입력해라");
    			return;
    		}
    		if(self.info.nick == ""){
    			alert("닉네임 입력해라");
    			return;
    		}
    		if(self.info.phone == ""){
    			alert("전화번호 입력해라");
    			return;
    		}
    		if(self.info.email == ""){
    			alert("이메일 입력해라");
    			return;
    		}
    		if(self.info.roadFullAddr == ""){
    			alert("주소 입력해라");
    			return;
    		}
    		if(self.info.qujiz == ""){
    			alert("퀴즈 입력해라");
    			return;
    		}
    		if(self.info.answer== ""){
    			alert("답변 입력해라");
    			return;
    		}
    		
    		var nparmap = self.info;
            $.ajax({
                url:"/admin/join.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("관리자 가입이 완료되었습니다.");
                	location.href="/admin/login.do";
                }
            }); 
    	}
    
	    , fnCheck : function(){
	    	var self = this;
	    	var nparmap = {id : self.info.id};
	        $.ajax({
	            url:"/admin/check.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	            	if(data.cnt > 0){
	            		alert("아이디가 이미 존재합니다.");
	            	} else {
	            		alert("사용 가능한 아이디입니다.");
	            		self.loginFlg = true;
	            	}
	            }
	        }); 
	    }
	    
	    , fnChange : function(){
	    	var self = this;
	    	var nparmap = {id : self.info.id};
            $.ajax({
                url:"/admin/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.cnt > 0){
                		self.loginFlg = false;
                	} else {
                		self.loginFlg = true;
                	}
                }
            }); 
	    }
    
    	, fnCancel : function() {
    		
    		location.href="/admin/login.do";
    		
    	}
    	
    	, fnSearchAddr : function(){
    		var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
    	}
    	
    	, fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.info.roadFullAddr = roadFullAddr;
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	}

    }   
    , created: function () {
    	this.fnGetQuiz();
	}
});
</script>
