<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거래대상지정</title>
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
	        <div><h2>거래설정</h2></div>
			<div class="div2">
				<select style="height: 30px;"  v-model="setid">
					<option value="" disabled> 거래자 선택 </option>
					<option V-for = "(commlist,index) in commlist" v-if="commlist.id!=listid" :value="commlist.id">{{commlist.nick}}</option>
				</select>
			</div>
			<div class="div2">
				<button id="btn" @click="fntradeset()">거래하기</button>
			</div>
     	</div>
	</div>
</body>
</html>

<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			tbno : opener.document.getElementById('tbno').value,
			sid: opener.document.getElementById('sid').value,
			// 세션
			sessionId:"${sessionId}",
			sessionName:"${sessionName}",
			sessionNick:"${sessionNick}",
			sessionUstatus:"${sessionUstatus}",
			commlist:{},
			setid:"",

		},methods: {
			//댓글 리스트
			fncommlist : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno};
				$.ajax({
					url:"/tradeSet/commlist.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.commlist=data.commlist;
						console.log(self.commlist);
					}
				}); 
			},
			fntradeset : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno, setuid:self.setid};
				$.ajax({
					url:"/tradeSet/fntradeset.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("거래 선택완료");
						opener.parent.apptv.fnGetList();
						window.close("tradeset.do");
						
					}
				}); 
			},


		}, created: function () {
			var self = this;
			self.fncommlist();
			console.log(self.tbno);
			
		}
	});

</script>