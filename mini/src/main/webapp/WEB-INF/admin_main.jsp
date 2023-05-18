<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	
	<!-- 폰트 추가 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!--  페이징 추가 1 -->
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<link rel="stylesheet" href="../css/style.css">
	<title>📰 관리자 메인페이지</title>

</head>
<style>
	<!-- 페이징 추가 2 -->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
        text-align: center;
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
	

	* {
			text-decoration: none;
			list-style: none;
			font-family: 'Nanum Gothic', sans-serif;
		}

	.btn5 {
	 		background-color: #9B9B9B;
            color: white;
            border-radius: 5px;
            border-style: hidden;
            margin-right: 8px; 
            padding : 4px;
            font-size : 0.7rem;
            
		}
	
</style>
<body>
	<div id="app" >
		<div class="container">
			<div><h2>📰 관리자 메인 페이지</h2> </div>
			<div style="float : right; margin-right : 20px">
				<div>{{sessionId}} 님 환영합니다 😀</div>
			</div>
			<pre>
			</pre>
			<div style="float : right; margin-right : 20px">
				<div><a href="../admin/login.do" v-if="sessionId != ''">로그아웃 📴</a></div>
			</div>
				<li><h4 style="color: gray;"><pre> ※ 처리현황 ※ </pre></h4></li>
				<pre>
				</pre>
				<li>⩊ 관리자 {{adminCnt}}명 </li>
				<li><a href="/notice/insert.do">⩊ 공지사항 업로드</a></li>
				<li>⩊ 크리에이터 승인 대기 <a href="/admin/main.do">{{recogCnt}}</a>개 </li>
				<li>⩊ 신고 처리 대기 <a href="/admin/blacklist.do">{{cnt}}</a>개</li>
			

			<pre>
			</pre>
	        <div class="table-list">
	        	<h3 style="font-size : 1.2rem">
	        	  ▪  크리에이터 승인 목록  ▪ 	        		
	        	  	<div style="float:right;">
						<input class=txtbox1 type="text" v-model="keyword" @keyup.enter="fnGetList">
						<button class=btn @click="fnGetList">검색</button>
					</div></h3>
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">No.</th>
	                        <th scope="col">ID</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">내용</th>
	                        <th scope="col">신청일</th>
	                        <th scope="col">승인여부</th>
	                        <th scope="col">등록</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            
                            <td>{{item.creno}}</td>
                            <td>{{item.id}}</a></td>
                            <td>{{item.cretitle}}</a></td>
                            <td>{{item.crecont}}</a></td>
                            <td>{{item.cdate}}</td>     
                            <td v-if="item.creYn == 'Y'">승인완료</td>     
                            <td v-else></td>     
                            <td>
                            	<button class=btn5 @click="fnRecogCreator('Y' , item)">승인</button>  
                           		<button class=btn5 @click="fnRecogCreator('N' , item)">거부</button>
                           	</td>      
                        </tr>                                       
	                </tbody>                   
	            </table>
	            <!-- 페이징 추가 3-->
				<template>
				  <paginate
				    :page-count="pageCount"
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
	           
	        </div>
	        <div>
	        	<!-- <button class="btn">삭제</button> -->
	        	<!-- <button class="btn" @click="fnAdd()">등록</button> -->
	        </div>
        </div>
	</div>
	
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
    	, blackcnt : ""
    	, cnt : 0
    	, recogCnt : 0
    	, adminCnt : 0
   		, sessionId : "${sessionId}"
   		, sessionUstatus : "${sessionUstatus}"
   		, keyword : ""
	    <!-- 페이징 추가 5-->
		, selectPage : 1
		, pageCount : 1
		, creatorCnt : 0
		, sessionAdminFlg : "${sessionAdminFlg}"
    	
    }   
    , methods: {
    	
    	fnRecogCreator : function (creatorStatus , item) {
    		 var self = this;
             var nparmap = {id : item.id , creatorStatus : creatorStatus };
          
             $.ajax({
                 url:"/admin/recogCreator.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                 	console.log(data);
                 	if(creatorStatus == 'Y'){
                		alert("크리에이터 승인되었습니다.");
                		self.fnGetList();
                	}else{
                		alert("크리에이터 승인 취소되었습니다.");
                		self.fnGetList();
                	}
                 }
             }); 
    	}
    
    	
    	, fnGetList : function () {
    		 var self = this;
    		 var startNum = ((self.selectPage-1) * 10);
 			 var lastNum = 10
             var nparmap = {keyword : self.keyword, startNum : startNum, lastNum : lastNum};
             $.ajax({
                 url:"/admin/main.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                 	console.log(data);
 	                self.list = data.list;
 	                self.cnt = data.cnt;
 	                self.recogCnt = data.recogCnt;
 	                self.adminCnt = data.adminCnt;
	                self.creatorCnt = data.creatorCnt;
	                self.pageCount = Math.ceil(self.creatorCnt / 10);
                 }
             }); 
    	}
    	 <!-- 페이징 추가 7-->
 		, fnSearch : function(pageNum){
 			var self = this;
 			self.selectPage = pageNum;
 			var startNum = ((pageNum-1) * 10);
 			var lastNum = 10
 			var nparmap = {startNum : startNum, lastNum : lastNum};
 			$.ajax({
 				url : "/admin/main.dox",
 				dataType : "json",
 				type : "POST",
 				data : nparmap,
 				success : function(data) {
 					self.list = data.list;
 					self.creatorCnt = data.creatorCnt;
 					self.pageCount = Math.ceil(self.creatorCnt / 10);
 				}
 			});
 		}

    	, fnAdd : function() {
    		location.href = "insert.do"
    	}
    	
    	, fnRemove : function(item) {	//매개변수를 줘야함
    		var self = this;
    		console.log(item);
            var nparmap = item;		// item 자체가 맵이라서 {} 이거 안씀
            if(!confirm("정말 삭제하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            
            $.ajax({
                url:"/bbs/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	alert("삭제되었습니다.")
                	self.fnGetList();	// 지우고 나서 리스트 바로 출력
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
    , created: function () {
		this.fnGetList();    
	}
});
</script>
