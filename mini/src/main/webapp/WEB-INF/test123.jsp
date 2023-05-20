<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<title>Insert title here</title>
</head>
<style>
	
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="card">
				<h3 class="card-header p-4">
					{{info.title}}
					<span class="badge badge-pill badge-dark pull-right" style="float: right;">{{info.cdatetime}}</span>
				</h3>
				<div class="card-body">
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			</div>
			<div>
				<button @click="fnList" class="btn" style="float: right;">목록으로</button>
				<button v-if="info.id == sessionId || sessionStatus == 'A'" @click="fnUpdate" class="btn" style="float: right;">수정</button>
			</div>
			
			<h2 style="margin-top : 50px;">댓글</h2>
			<div style="clear : both; border-top : 1px solid #000"></div>
			
			<div v-for="(item, index) in commentList" style="font-size : 1.5em; margin : 10px;">
				<div v-if="item.commentNo != commentNo">
					<span v-if="item.delYn == 'N'">
						{{item.id}}({{item.cdatetime}}) : {{item.content}} 
						<button v-if="item.id == sessionId" @click="fnEdit(item)">수정</button>
						<button v-if="item.id == sessionId" @click="fnRemoveComment(item)">삭제</button>
					</span>
					<span v-else>
						삭제된 댓글 입니다.
					</span>
				</div>
				<div v-else style="margin-top : 10px;">
					<textarea v-model="commentInfo.content" rows="3" cols="100" style="width : 90%;"></textarea>
					<button @click="fnCommentEdit" class="btn" style="margin-bottom : 30px;">수정</button>
				</div>
			</div>
			<div style="margin-top : 10px;">
				<textarea v-model="comment" rows="3" cols="100" style="width : 90%;"></textarea>
				<button @click="fnComment" class="btn" style="margin-bottom : 30px;">댓글 등록</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , info : {}
       , boardNo : "${map.boardNo}"
   	   , sessionId : "${sessionId}"
 	   , sessionStatus : "${sessionStatus}"
 	   , comment : ""
 	   , commentList : []
 	   , commentNo : ""
 	   , commentInfo : {}
    }   
    , methods: {
    	fnGetBoard : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"/bbs/read.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	console.log(data);
	                self.info = data.info;
	                self.commentList = data.commentList;
                }
            }); 
        }
    	, fnList : function(){
    		location.href="/bbs.do";
    	}
    	, fnUpdate : function(){
    		var self = this;
    		self.pageChange("/modify.do", {boardNo : self.boardNo});
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
    	, fnComment : function(){
    		var self = this;
            var nparmap = {boardNo : self.boardNo, comment : self.comment, userId : self.sessionId};
            $.ajax({
                url:"/bbs/comment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.comment = "";
	                alert("성공");
	                self.fnGetBoard();
                }
            }); 
    	}
    	, fnRemoveComment : function(item){
    		var self = this;
            var nparmap = item;
            $.ajax({
                url:"/comment/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                alert("성공");
	                self.fnGetBoard();
                }
            }); 
    	}
    	, fnEdit : function(item){
    		var self = this;
    		self.commentNo = item.commentNo;
    		self.commentInfo = item;
    	}
    	
    	, fnCommentEdit : function(){
    		var self = this;
            var nparmap = self.commentInfo;
            $.ajax({
                url:"/comment/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                alert("성공");
	                self.commentInfo = {};
	                self.commentNo = "";
	                self.fnGetBoard();
                }
            }); 
    	}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetBoard();
	}
});
</script>