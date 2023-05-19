<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>커뮤니티 게시판</title>
</head>
<style>
	.card1{
		width: 1080px;
		margin: 1px auto;
		padding: 20px 0 20px 0;
	}
	.card2{
		position: relative; 
		display: flex; 
		flex-direction: column; 
		min-width: 0; 
		word-wrap: break-word; 
		background-clip: border-box;
    	border: 1px solid rgba(0, 0, 0, 0.125); 
    	border-radius: 0.25rem; 
    	margin-bottom: 10px;
    }
    .card-header{
    	padding: 0.75rem 1.25rem; 
    	margin-bottom: 0; 
    	background-color: rgba(0, 0, 0, 0.03); 
    	border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    }
    .card-body{
    	margin: 10px;
    }
    .commbox{
    	margin-top : 30px;
    	clear : both; 
		margin-bottom: 20px;
		border-bottom: 1px solid #ccc;
	}
	.commpath{
		margin-bottom : 10px;
	}
	.cimg{
		width: 250px;
		height: 200px;
		margin: 5px;
	}
	.commsecret {
		text-align: right;
	}
    .pimg{
    	width: 50px;
		border-radius: 100%;
		border: 1px solid black;
		margin-right: 10px;
	}
	.commbox2{
		display: flex;
		align-items: center;
   		justify-content: space-between;
		margin-bottom: 20px;
	}
	.commbox2_1{
		display: flex;
		text-align: center;
		flex-direction: row;
		align-items: center;
		margin-left: 20px;
	}
    .commbox2_1_1{
		display: flex;
		flex-direction: column;
		align-items: baseline;
	}
	.commid{
		font-size: 15pt;
		margin-bottom: 5px;
	}
    .btns {
		text-align: right;
		margin-right: 5px;
	}
	textarea {
		width : 90%; 
		resize: none;
	}
	.commbox{
		padding-bottom: 10px; 
		margin: 10px; 
		border-bottom: 1px solid #ccc;
	}
	.coma{
		margin: 0px 3px ;
	}
	.editbox{
		margin-top: 10px;
	}
	
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="card1">
				<div class="card2">
					<h3 class="card-header" v-if="info.udate == null">
						{{info.ctitle}}
						<span  style="float: right;">{{info.cdate}}</span>
					</h3>
					<!-- 수정 시 작성시간 udate 출력 -->
					<h3 class="card-header" v-else>
						{{info.ctitle}}
						<span  style="float: right;">{{info.udate}}</span>
					</h3>
					<div class="card-body">
					   	<div  v-html="info.ccont"></div>
				   	</div>
				</div>
				<div class="btns">
					<button v-if="info.id == sessionId || sessionAdminflg == 'Y'" @click="fnUpdate()" >수정</button>
					<button v-if="info.id == sessionId || sessionAdminflg == 'Y'" @click="fnRemoveBoard()" >삭제</button>
					<button v-else target="_blank" @click="fnReportBoard(cbno)" >신고</button>
					<button @click="fnList()" class="btn">목록으로</button>
				</div>
				
				<div class="commbox">
					<h4>댓글 ({{info.commentcnt}}개)</h4>
					<div v-if="sessionId != null">
						<div>
							<div class="commpath">첨부파일 <input type="file" id="file1"></div>
							<div class="commimg" > <img class="cimg" src=""> 이미지 미리보기</div>
						</div>
						<textarea v-model="comment" rows="3" cols="100"></textarea>
						<button @click="fnComment()" class="btn">등록</button>
						<div class="commsecret"><input type="checkbox">비밀댓글 설정</div>
					</div>
				</div>
				<div v-for="(item, index) in commentList">
					<div class="commbox2" v-if="item.delYn == 'N'">
						<div class="commbox2_1">
							<div><img class="pimg" src="img/board/160628_7.png"></div>
							<div class="commbox2_1_1">
								<div class="commid">{{item.id}}</div>
								<div>{{item.conte}}</div>
							</div>
						</div>
						<div class="commbox2_2">
							<span v-if="info.id == sessionId || sessionAdminflg == 'Y'">
								<span class="coma" @click="fnEdit(item)">수정</span>
								<span class="coma" @click="fnRemoveComment(item)">삭제</span>
							</span>
							<span v-else>
								<span class="coma" @click="fnReportComment(cbno)">신고</span>
								<span class="coma" @click="">답글</span>
							</span>
							<span class="coma">{{item.cdate}}</span>
						</div>
					</div>
					<div class="commbox" v-else>
						<span>
						삭제된 댓글 입니다.
						</span>
					</div>
					<div class="editbox" v-if="cInfo.cno == item.cno">
						<textarea v-model="editconte" rows="3" cols="100"></textarea>
						<button @click="fnEditComment" class="btn" style="margin-bottom : 30px;">수정</button>
					</div>
				</div>
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
       , cbno : "${map.cbno}"
       , sessionId : ""
       , sessionAdminflg : ""
 	   , comment : ""
 	   , commentList : []
 	   , cInfo : {}
       , editconte : ""
    }   
    , methods: {
    	fnGetBoard : function(){
            var self = this;
            var nparmap = {cbno : self.cbno};
            $.ajax({
                url:"/comm/read.dox",
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
		
    	//게시글 수정
    	, fnUpdate : function(){
    		var self = this;
    		self.pageChange("/commedit.do", {cbno : self.cbno});
    	}
    	
    	//게시글 삭제
    	, fnRemoveBoard : function(cbno){
   		 var self = this;
   		 if(!confirm("정말 삭제하시겠습니까?")){
   			 return;
   		 }
            var nparmap = {boardKey : cbno};
            $.ajax({
                url:"/comm/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
               	alert("삭제되었습니다.");
               	location.href="/comm.do";
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
    	
        //게시글 목록 이동
    	, fnList : function(){
    		location.href="/comm.do";
    	}
    	
    	//게시글 신고 팝업
    	, fnReportBoard : function(cbno) {
    		let popUrl = "/reportboard.do";
    		let popOption = "width = 650px, height=550px, top=200px, left=300px, scrollbars=yes";
    		window.open(popUrl,"게시글 신고",popOption);	
    	}
    	
    	//댓글 신고 팝업
    	, fnReportComment : function(cbno) {
    		let popUrl = "/reportcomment.do";
    		let popOption = "width = 650px, height=550px, top=200px, left=300px, scrollbars=yes";
    		window.open(popUrl,"댓글 신고",popOption);	
    	}
    	
    	//댓글    	
    	, fnComment : function(){
    		var self = this;
            var nparmap = {cbno : self.cbno, conte : self.conte, id : self.id};
            $.ajax({
                url:"/comm/comment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.conte = "";
	                alert("댓글이 작성되었습니다.");
	                self.fnGetBoard();
                }
            }); 
    	}
    	
    	//댓글 삭제
    	, fnRemoveComment : function(item){
    		var self = this;
            var nparmap = item;
            $.ajax({
                url:"/comment/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                alert("댓글이 삭제되었습니다.");
	                self.fnGetBoard();
                }
            }); 
    	}
    	
    	//댓글 수정
    	, fnEditComment : function(){
    		var self = this;
            var nparmap = self.cInfo;
            $.ajax({
                url:"/comment/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.editconte = self.cInfo.conte;
	                alert("댓글이 수정되었습니다.");
	                self.cInfo = {};
	                self.fnGetBoard();
                }
            }); 
    	} 
    	
    	
    	, fnEdit : function(item){
    		var self = this;
    		self.cInfo = item;
    	}
    	
    	
    }   
    , created: function () {
    	var self = this;
    	self.fnGetBoard();
	}
});
</script>