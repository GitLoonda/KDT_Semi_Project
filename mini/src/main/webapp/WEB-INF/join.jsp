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
		margin : 50px auto;
		text-align: center;
		border-radius: 50px;
		background-color: #ccc;
		padding : 40px 40px 80px 40px;
	}
	.container .div2 {
		margin-left: 50px;
		margin-bottom: 40px;
		text-align: left;
	}
	.in {
		width: 20em;
		height : 1.5em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
	}
	.in2 {
		width: 14em;
		height : 1.5em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
	}
	.in3 {
		width: 14em;
		height : 1.5em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
		margin-bottom: 40px;
	}
	input:focus, select:focus {
		outline: none;
	}
	select {
		width : 5.5em;
		height : 1.5em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
	}
	span {
		font-size: 20px;
	}
	button {
		width : 5.5em;
		height : 1.5em;
		font-size: 20px;
		border: none;
		border-radius: 10px;
		background-color: white;
	}
</style>
<body>
	<div id="app" class="div1">
		<div class="container">
			<h2 style="margin-bottom: 40px;">회원가입</h2>
			<div class="div2">
				<input v-model="list.id" type="text" class="in2" placeholder=" 아이디"></input>
				<button id="btn" @click="fnIdCheck">중복확인</button>
				<p v-if="idFlg == 1" style="color:blue">사용하실 수 있는 아이디입니다.</p>
				<p v-if="idFlg == 2" style="color:red">사용하실 수 없는 아이디입니다.</p>
			</div>
			<div class="div2">
				<input v-model="list.passwd" type="password" class="in" placeholder=" 비밀번호"></input>
			</div>
			<div class="div2">
				<input @keyup="fnPwdCheck" v-model="list.passwd2" type="password" class="in" placeholder=" 비밀번호 확인"></input>
				<p v-if="pwFlg == 1" style="color:blue">비밀번호가 일치합니다.</p>
				<p v-if="pwFlg == 2" style="color:red">비밀번호가 일치하지 않습니다.</p>
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
						<option value="M">남성</option>
						<option value="F">여성</option>
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
				<input type="text" class="in" placeholder=" 전화번호"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder=" 이메일"></input>
			</div>
			<div class="div2">
				<input type="text" class="in3" placeholder=" 주소"></input>
				<button id="btn" @click="">주소 찾기</button>
				<input type="text" class="in" placeholder=" 상세주소"></input>
			</div>
			<div>
				<button id="btn" @click="">회원가입</button>
				<button id="btn" @click="fnCancel">취소</button>
			</div>
		</div>
	</div> 
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		year : []
		, month : []
		, day : []
		, idFlg : 0
		, pwFlg : 0
		, gender : ""
		, bYear : ""
		, bMonth : ""
		, bDay : ""
		, list : []
    }   
    , methods: {
    	init : function() {
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
		}
		, fnIdCheck : function() {
			var self = this;
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
					}
                }
            }); 
		}
		, fnPwdCheck : function() {
			var self = this;
			console.log("enabled");
			if(self.list.passwd == self.list.passwd2) {
				pwFlg = 1;
			}
			else {
				pwFlg = 2;
			}
		}
		, fnSetGender : function() {
			var self = this;
			self.list.gender = self.gender;
			console.log(self.list);
		}
		, fnSetBirth : function() {
			var self = this;
			self.list.birth = self.bYear + "/" + self.bMonth + "/" + self.bDay;
			console.log(self.list);
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
		self.init();
	}
});
</script>