<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>최근 본 상품</title>
</head>
<style>
 * {
 	text-decoration : none;
 	line-style : none;
 }
 .container {
 	width : 1080px;
 	margin : auto;
 	margin-top : 250px;
 	
 }
 .listbox {
 	width : 80%;
 	display : block;
 	margin : auto;
 	text-align : center;
 }
 .listbox h2 {
 	text-align : left;
 }
 .itembox {
 	width : 100%;
 	display : flex;
 	margin : 25px 0;
 	background : #eee;
 	padding : 10px 10px 0 10px;
 	border-radius : 5px;
 }
 .itembox button {
 	width : 2em;
 	height : 2em;
 	border : none;
 	border-radius : 5px;
 }
 .itembox button:hover {
 	background : #ccc;

 }
 .imgbox {
 	width : 150px;
 	height : 150px;
 	margin : 15px;
 	background-image : url("../img/share/no-image01.gif");
 	background-size : 100% 100%;
 	overflow : hidden;
 }
 .imgbox img {
 	width : 150px;
 	height : 150px;
 }
 .descbox {
 	width : 80%;
 	margin-left : 30px;
 }
 .descbox p {
 	text-align : left;
 	font-size : 0.8em;
 }
 .btnbox button {
 	width : 5em;
 	height : 2em;
 	float : right;
 	margin : 0 10px 10px 10px;
 	border-radius : 0;
 	border : none;
 }
 .btnbox button:hover {
 	background : #ccc;
 }
</style>
<body>
	<div id="app">
		<div class="container">
			
			<div class="listbox">
			<h2>최근 본 상품</h2>
				<div class="itembox" v-for="(item, index) in list">
					<div class="imgbox">
						<img :src="item.path" alt="">
					</div>
					<div class="descbox">
						<p>{{item.btitle}}</p>
						<p>가격 : {{item.bprice}}</p>
						<p>NICK</p>
						<p>BPRICE</p>
						<p>LOCAL1 LOCAL2 LOCAL3</p>
						<div class="btnbox">
							<button>거래하기</button>
							<button>찜 하기</button>
						</div>	
					</div>
					<a @click="" href="javascript:;">X</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script>
var app = new Vue({ 
    el: '#app',
    data: {
    	sessionId : "${sessionId}",
    	sessionNick : "${sessionNick}",
		sessionStatus : "${sessionStatus}",
		recentList : "${recentlist}",
		list : []
    }   
    , methods: {
    	fnPermission : function() {
    		var self = this;
    		if(self.sessionId == "" || self.sessionId == null) {
    			location.href = "denied.do";
    			return;
    		}
    		self.fnGetRecentList();
    	}
		,  fnGetRecentList : function() {
			var self = this;
			var list = JSON.stringify(self.recentList);
			var nparmap = {"test" : 1, "list" : list};
			$.ajax({
                url:"/main/recentList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {            
               		self.list = data.list;
               		console.log(self.list);
                }
            });  
			
		}
    }   
    , created: function () {
    	var self = this;
    	self.$nextTick(self.fnPermission());
    	console.log(self.recentList);
	}
});
</script>