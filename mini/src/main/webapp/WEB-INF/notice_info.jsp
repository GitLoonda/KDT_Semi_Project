<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
						
	<!-- 폰트 추가 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="../css/style.css">
	<title>공지사항 상세</title>
</head>
<style>
	
		* {
		text-decoration: none;
		list-style: none;
		font-family: 'Nanum Gothic', sans-serif;
		}
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>📢 공지사항</h2>
			<div class="card">
				<h3 class="card-header p-4">
					{{info.atitle}}
					<div class="badge badge-pill badge-dark pull-right" style="float: right; font-size : 1.1rem">{{info.udate}}</div>
				</h3>
					
				<div class="card-body">
					<div style="float: right; padding : 10px" >조회수  :  {{info.hits}}</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		<pre>{{info.acont}}</pre>
				   	</div>
			   	</div>
			   	
			</div>
			<div>
				<button @click="fnList" class="btn" style="float: right;">목록으로</button>
				<button v-if="sessionAdminFlg == 'Y'" @click="fnUpdate" class="btn" style="float: right;">수정</button>
			</div>
		</div>
	</div>
</body>

</html>
<script type="text/javascript">

document.title="📢 공지사항 상세";

var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , info : {
    	   atitle : ""
    	   , id : ""
    	   , cdate : ""
    	   , acont : ""
    	   , hits : ""
    	   , udate : ""
       }
       , abNo : "${map.abNo}"	
       , tbNo : "${map.tbNo}"	
       , sessionId : "${sessionId}"
       , sessionStatus : "${sessionUstatus}"	// request 에있는걸 가져온다는 문법
       , sessionAdminFlg : "${sessionAdminFlg}"
       , comment : ""
       , commentList : []
       , commentNo : ""
       , cInfo : {}
    }   
    , methods: {

    	fnList : function(){
    		location.href="/notice.do";
    	}
    
    	,
    	fnUpdate : function(){
    		var self = this;
    		self.pageChange("/modify.do" , {abNo : self.abNo});
    	}
    	,
	    fnGetBoard : function(){
	        var self = this;
	        var nparmap = {abNo : self.abNo , info : self.info};
	        $.ajax({
	            url:"/notice/info.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	            	console.log();                                       
	                self.info = data.info;
	                self.commentList = data.commentList;
	            }
	        }); 
	    }
    	
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    		//	this.linkCall(url);
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	}
    
    }   
    , created: function () {		// 페이지 로드될때 바로 실행됨
    	var self = this;
    	self.fnGetBoard();
	}
});
</script>
