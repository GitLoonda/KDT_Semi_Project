<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글 신고</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="css/defcss.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="assets/ckeditor5/build/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
</head>
<style>
body{
	width: 650px;
	height: 550px;
	top: 300px;
	left: 300px;
	margin: auto;
	text-align: center;
}
img{
	margin-top: 30px;
}
select, textarea{
	width: 50%;
	margin: 10px;
	padding: 3px;
}
#btn {
	margin-top: 30px;
}
</style>
<body>
	<div id="app">
		<div id="report">
	        <img src="img/main/unity-logo-200x100-1.jpg">
	        <div><h2>댓글 신고</h2></div>
			<div class="div2">
				<select style="height: 30px;" v-model="report">
					<option value="0" disabled> 신고 사유 </option>
					<option v-for="(banlist,index) in banlist" :value="banlist.cnum">{{banlist.cinfo}}</option>
				</select>
			</div>
			<div class="div2">
				<textarea style="resize: none; height: 80px; " placeholder="세부사유" v-model="reconte"></textarea>
			</div>
			<div class="div2">
				<button id="btn" @click="fnbanin">신고하기</button>
			</div>
     	</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			// 세션
			tbno : opener.document.getElementById('tbno').value,
			brdflg : opener.document.getElementById('brdflg').value,
			id : opener.document.getElementById('listid').value,
			scno: opener.document.getElementById('scno').value,
			sessionId:"${sessionId}",
			sessionName:"${sessionName}",
			sessionNick:"${sessionNick}",
			sessionUstatus:"${sessionUstatus}",
			report:"0",
			setgrd:"",
			reconte:"",
			banlist:{},

		},methods: {
			//평점 주기
			banlistinfo(){
				var self = this;
         	  	var nparmap = {};
				$.ajax({
					url:"/report/banlist.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.banlist=data.banlist;
					}
				}); 
			},
			fnbanin : function(){
				var self = this;
				var cno=self.scno.slice(1,6);
				if(self.report=="0"){
					alert("신고사유를 선택해주세요");
					return;
				}
				
         	  	var nparmap = {cno : cno, id:self.id, brdflg:self.brdflg, bset:self.report, reconte:self.reconte};
				$.ajax({
					url:"/report/baninsert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("신고되었습니다.");
						window.close("reportboard.do");
						
					}
				}); 
			},


		}, created: function () {
			var self = this;
			self.banlistinfo();
			console.log(self.scno);
			console.log(self.scno.slice(1,6));
			
		}
	});

</script>