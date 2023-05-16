<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>로그인</title>
</head>
<style>
	* {
		text-decoration: none;
		list-style: none;
	}
	a:visited {
		color: #5a5d69;
	}
	.container {
		width : 500px;
		margin : 30px auto;
		text-align: center;
		border-radius: 50px;
		background-color: #ccc;
		padding : 40px 40px 80px 40px;
	}
	.container .div2 {
		margin-left: 80px;
		margin-bottom: 40px;
		text-align: left;
	}
	.in {
		width: 20em;
		height : 1.5em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
	}
	.in2 {
		width: 14em;
		height : 1.5em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
	}
	.in3 {
		width: 14em;
		height : 1.5em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		margin-bottom: 40px;
	}
	input:focus, select:focus {
		outline: none;
	}
	select {
		width : 5.5em;
		height : 1.5em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
	}
	.quiz {
		width : 20em;	
	}
	span {
		font-size: 16px;
	}
	button {
		width : 5.5em;
		height : 1.7em;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		background-color: white;
	}
	p {
		margin : 1px;
		font-size : 12px;
	}
</style>
<body>
	<div id="app" class="div1">
		<div class="container">
			<h2 style="margin-bottom: 30px;">회원가입</h2>
			<div class="div2">
				<input v-model="list.id" type="text" class="in2" placeholder=" 아이디"></input>
				<button id="btn" @click="fnIdCheck">중복확인</button>
				<p v-if="idFlg == 1" style="color:blue">사용하실 수 있는 아이디입니다.</p>
				<p v-if="idFlg == 2" style="color:red">{{idFalse}}</p>
			</div>
			<div class="div2">
				<input v-model="list.passwd" type="password" class="in" placeholder=" 비밀번호"></input>
			</div>
			<div class="div2">
				<input @keyup="fnPwdCheck" v-model="list.passwd2" type="password" class="in" placeholder=" 비밀번호 확인"></input>
				<p v-if="pwFlg == 1" style="color:blue">비밀번호가 일치합니다.</p>
				<p v-if="pwFlg == 2" style="color:red">{{pwFalse}}</p>
			</div>
			<div class="div2">
				<label>
					<select @change="fnSetQuiz" class="quiz" v-model="sQuiz">
						<option value="" >비밀번호 찾기 질문</option>
						<option v-for="item in quizList" :value="item.cNum">{{item.cInfo}}</option>					
					</select>
				</label>
			</div>
			<div class="div2">
				<input v-model="list.answer" type="text" class="in" placeholder=" 비밀번호 찾기 답변"></input>
			</div>
			<div class="div2">
				<input v-model="list.name" type="text" class="in" placeholder=" 이름"></input>
			</div>
			<div class="div2">
				<input v-model="list.nick" type="text" class="in" placeholder=" 닉네임"></input>
			</div>
			<div class="div2">
				<label>
					<select @change="fnSetGender" v-model="gender">
						<option value="" >성별</option>
						<option value="GE1">남성</option>
						<option value="GE2">여성</option>
						<option value="GE3">기타</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<label>
					<select v-model="bYear">
						<option value="">생년</option>
						<option v-for="item in year" :value="item.year">{{item.year}}</option>
					</select>
					<span> 년</span>
				</label>
				<label>
					<select v-model="bMonth">
						<option value="">생월</option>
						<option v-for="item in month" :value="item.month">{{item.month}}</option>
					</select>
					<span> 월</span>
				</label>
				<label>
					<select @change="fnSetBirth" v-model="bDay">
						<option value="">생일</option>
						<option v-for="item in day" :value="item.day">{{item.day}}</option>
					</select>
					<span> 일</span>
				</label>
			</div>
			<div class="div2">
				<input v-model="list.phone" type="text" class="in" placeholder=" 전화번호"></input>
			</div>
			<div class="div2">
				<input v-model="list.email" type="text" class="in" placeholder=" 이메일"></input>
			</div>
			<div class="div2">
				<input v-model="addr" type="text" class="in3" placeholder=" 주소" disabled></input>
				<button id="btn" @click="fnSearchAddr">주소 찾기</button>
				<input v-model="addrDetail" type="text" class="in" placeholder=" 상세주소"></input>
			</div>
			<div>
				<button id="btn" @click="fnSignIn">회원가입</button>
				<button id="btn" @click="fnCancel">취소</button>
			</div>
		</div>
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
		year : []
		, month : []
		, day : []
		, quizList : []
		, idFalse : ""
		, idFlg : 0
		, pwFalse : ""
		, pwFlg : 0
		, gender : ""
		, bYear : ""
		, bMonth : ""
		, bDay : ""
		, sQuiz : ""
		, roadFullAddr : ""
		, addr : ""
		, addrDetail : ""
		, list : []
    }   
    , methods: {
    	init : function() { // 생년월일 select option 생성 / 배치
			var self = this;
			var initYear = 2023;
			for(i = 0; i < 80; i++) {
				self.year[i] = {year : initYear};
				initYear--;
			}
			var initMonth = 1;
			for(i = 0; i < 12; i++) {
				self.month[i] = {month : initMonth};
				initMonth++;
			}
			var initDay = 1;
			for(i = 0; i < 31; i++) {
				self.day[i] = {day : initDay};
				initDay++;
			}
			var nparmap = {};
	            $.ajax({
	                url:"/login/load.dox",
	                dataType:"json",	
	                type : "POST",
	                data : nparmap,
	                success : function(data) {
	                	self.quizList = data.quiz;
	                }
	            });
		}
		, fnIdCheck : function() { // id 유효성 검사
			var self = this;
			var idJ = /^[a-z0-9]{6,12}$/;
			if(self.list.id == null) {
				self.idFlg = 2;
				self.idFalse = "아이디를 입력해주세요.";
				return;
			}
			if(!idJ.test(self.list.id)){
				self.idFlg = 2;
				self.idFalse = "아이디는 6~12자리의 영문소문자/숫자로 구성되어야합니다.";
				return;
			}
            var nparmap = {id : self.list.id};
            $.ajax({
                url:"/login/idCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
					if(data.result == "success") {
						self.idFlg = 1;
					}
					else {
						self.idFlg = 2;
						self.idFalse = "사용하실 수 없는 아이디입니다.";
					}
                }
            }); 
		}
		, fnPwdCheck : function() { // 비밀번호 유효성 검사
			var self = this;
			var pwJ = /^[A-Za-z0-9]{6,12}$/;
			if(self.list.passwd == null || self.list.passwd2 == null) {
				self.pwFlg = 0;
				return;
			}
			if(!pwJ.test(self.list.passwd)) {
				self.pwFlg = 2;
				self.pwFalse = "비밀번호는 6~12자리의 영문대소문자/숫자로 구성되어야합니다.";
				return;
			}
			if(self.list.passwd != self.list.passwd2) {
				self.pwFlg = 2;
				self.pwFalse = "두 비밀번호가 일치하지 않습니다.";
				return;
			}
			if(self.list.passwd == self.list.passwd2) {
				self.pwFlg = 1;
				return;
			}
		}
		, fnSetQuiz : function() { // select 성별 저장
			var self = this;
			self.list.quiz = self.sQuiz;
		}
		, fnSetGender : function() { // select 성별 저장
			var self = this;
			self.list.gender = self.gender;
		}
		, fnSetBirth : function() { // select 생년월일 조합
			var self = this;
			self.list.birth = self.bYear + "-" + self.bMonth + "-" + self.bDay;
		}
		, fnSearchAddr : function(){ // 주소 검색창 생성
    		var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
    	}
		, fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.roadFullAddr = roadFullAddr;
    		// 도로명 주소
    		self.addr = roadAddrPart1;
    		// 상세 주소
    		self.addrDetail = addrDetail;
    	}
		, fnSignIn : function() {
			var self = this;
			var idJ = /^[a-z0-9]{6,12}$/;
			var pwJ = /^[A-Za-z0-9]{6,12}$/;
			var nmJ = /^[ㄱ-힣]{2,6}$/;
			var nkJ = /^[a-zA-zㄱ-힣0-9]{2,6}$/;
			if(self.list.id == null) {
				alert("아이디를 입력해주세요.");
				return;
			}
			if(!idJ.test(self.list.id)){
				alert("아이디는 6~12자리의 영문소문자/숫자로 구성되어야합니다.");
				return;
			}
			if(self.list.passwd == null || self.list.passwd2 == null) {
				alert("비밀번호와 비밀번호 확인을 입력해주세요.");
				return;
			}
			if(!pwJ.test(self.list.passwd)) {
				alert( "비밀번호는 6~12자리의 영문대소문자/숫자로 구성되어야합니다.");
				return;
			}
			if(self.list.passwd != self.list.passwd2) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
			if(self.list.quiz == null) {
				alert("비밀번호 찾기 질문을 선택해주세요.");
				return;
			}
			if(self.list.answer == null) {
				alert("비밀번호 찾기 답변을 입력해주세요.");
				return;
			}
			if(self.list.name == null) {
				alert("이름을 입력해주세요.");
				return;
			}
			if(!nmJ.test(self.list.name)) {
				alert("이름은 2~6자리의 한글로 구성되어야합니다.");
				return;
			}
			if(self.list.nick == null) {
				alert("닉네임을 입력해주세요.");
				return;
			}
			if(!nkJ.test(self.list.nick)) {
				alert("닉네임은 2~6자리의 영문대소문자/한글/숫자로 구성되어야합니다.");
				return;
			}
			if(self.list.gender == null) {
				alert("성별을 선택해주세요.");
				return;
			}
			if(self.bYear == null) {
				alert("생년을 선택해주세요.");
				return;
			}
			if(self.bMonth == null) {
				alert("생월을 선택해주세요.");
				return;
			}
			if(self.bDay == null) {
				alert("생일을 선택해주세요.");
				return;
			}
			if(self.list.phone == null) {
				alert("전화번호를 입력해주세요.");
				return;
			}
			if(self.list.email == null) {
				alert("이메일을 입력해주세요.");
				return;
			}
			self.list.addr = self.addr + ", " + self.addrDetail;
			if(self.list.addr == null) {
				alert("주소를 입력해주세요.");
				return;
			}
			
			var nparmap = {id : self.list.id, passwd : self.list.passwd, quiz : self.list.quiz
					, answer : self.list.answer, name : self.list.name, nick : self.list.nick
					, gender : self.list.gender, birth : self.list.birth, phone : self.list.phone
					, email : self.list.email, addr : self.list.addr};
			console.log(nparmap);
            $.ajax({
                url:"/login/addAccount.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
					if(data.result == "success") {
						alert("가입을 환영합니다.");
						location.href='login.do';
					}
					else {
						alert("가입에 실패하였습니다.");
					}
                }
            }); 
		}
		, fnCancel : function() {
			if(confirm("작성을 취소하시겠습니까?")) {
				location.href = "main.do";
			}
			else {
				return;
			}
		}
    }   
    , created: function () {
		var self = this;
		self.$nextTick(self.init());
	}
});
</script>