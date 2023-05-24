<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거래점수</title>
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

#btn {
	margin-top: 30px;
}
.radiobox{
	
}
</style>
<body>
	<div id="app">
		<div id="report">
	        <img src="img/main/unity-logo-200x100-1.jpg">
	        <div><h2>거래점수</h2></div>
			<div class="radiobox">
				<label for="g1"><input id="g1" type="radio" name="setbox" value="GR1" v-model="setgrd">아주 별로에요</label>
				<label for="g2"><input id="g2" type="radio" name="setbox" value="GR2" v-model="setgrd">별로에요</label>
				<label for="g3"><input id="g3" type="radio" name="setbox" value="GR3" v-model="setgrd">보통이에요</label>
				<label for="g4"><input id="g4" type="radio" name="setbox" value="GR4" v-model="setgrd">좋아요</label>
				<label for="g5"><input id="g5" type="radio" name="setbox" value="GR5" v-model="setgrd">아주 좋아요</label>
			</div>
			<div class="div2">
				<button id="btn" @click="fngrdset()">점수보내기</button>
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
			brdflg : opener.document.getElementById('brdflg').value,
			sid:opener.document.getElementById('sid').value,
			// 세션
			sessionId:"${sessionId}",
			sessionName:"${sessionName}",
			sessionNick:"${sessionNick}",
			sessionUstatus:"${sessionUstatus}",
			gralist:{

			},
			setgrd:"",

		},methods: {
			//평점 주기
			fngrdset : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno, id:self.sid, setgrd:self.setgrd, brdflg:self.brdflg};
				$.ajax({
					url:"/tradeGrd/fngrdset.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("평점주기완료!");
						opener.parent.apptv.fnrebtn();
						window.close("usergrade.do");
						
					}
				}); 
			},


		}, created: function () {
			var self = this;
		}
	});

</script>