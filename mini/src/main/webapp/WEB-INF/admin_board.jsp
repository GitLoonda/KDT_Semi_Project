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
	
	<!-- 페이징 추가 1-->
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<link rel="stylesheet" href="../css/style.css">
	<title>📑 관리자 게시판 관리</title>

</head>
<style>
<!-- 페이징 추가 2-->
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
		
		select {
        	border-radius: 5px;
        	width: 110px;
        	padding: 2.8px;
            box-sizing: border-box;
        	border-style: solid;
 		    text-align: center;
 		    color: gray;
        }	
</style>
<body>
	<div id="app" >
		<div class="container">
		
			<!-- 거래 게시판 -->
			
			<div>
			
			<h2>📑 게시글 관리</h2>
			<div style="float : right; margin-right : 20px">
				<div>{{sessionId}} 님 환영합니다 😀</div>
			</div>
			<pre>
			</pre>
			<div style="float : right; margin-right : 20px">
				<div><a href="../admin/login.do" v-if="sessionId != ''">로그아웃 📴</a></div>
			</div>
			<pre>
			</pre>
			
				
				<select v-model="selectItem">
					<option value="">:: 전체 분류 ::</option>
					<option value="BF1">거래게시판</option>
					<option value="BF2">의뢰게시판</option>
					<option value="BF3">홍보게시판</option>
				</select>
				
				<button class="btn" @click="fnGetList()">검색</button>
				<div style="float:right;"> 
					<h3 style="font-size:1.1rem;">전체검색 : 
					<input class=txtbox1 type="text" v-model="keyword" @keyup.enter="fnGetList">
					<button class=btn @click="fnGetList">검색</button>	
				</div>
				
			</div>
	        <div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">게시글 번호</th>
	                        <th scope="col">게시글 종류</th>
	                        <th scope="col">게시글 제목</th>
	                        <th scope="col">작성자 아이디</th>
	                        <th scope="col">작성일자</th>
	                        <th scope="col">게시글 상태</th>
	                        <th scope="col">처리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            <td @click=""><a href="javascript:;">{{item.tbNo}}</a></td>
                            <td v-if="item.brdFlg == 'BF1'">거래게시판</td>
                            <td v-else-if="item.brdFlg == 'BF2'">의뢰게시판</td>
                            <td v-else>홍보게시판</td>
                            <td>{{item.btitle}}</td>     
                            <td>{{item.id}}</td>     
                            <td>{{item.cdate}}</td>     
                            <td v-if="item.delYn == 'Y'">블라인드</td>     
                            <td v-else></td>     
                            <td>
                          	  <button class=btn5 @click="fnBlind('Y' , item)">블라인드</button>
                          	  <button class=btn5 @click="fnBlind('N' , item)">블라인드취소</button>
                          	  <button class=btn5 @click="fnRemove(item)">삭제</button>
                            </td>     
                        </tr>                                       
	                </tbody>                   
	            </table>
	            <!-- 페이징 추가 3-->
				<template>
				  <paginate
				    :page-count="pageCount"
				    :page-range="10"
				    :margin-pages="0"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
	        </div>
	        
	        
	        <!-- 커뮤니티 게시판 -->
	        
	        
	        <div>
			<h2>📃 커뮤니티 게시판 관리</h2>
				<div style="float: right;"> 
					<h3 style="font-size:1.1rem;">전체검색 : 
					<input class=txtbox1 type="text" v-model="commKeyword" @keyup.enter="fnGetList">
					<button class=btn @click="fnGetList">검색</button>	
				</div>
 				<select class=selbox v-model="selectCommItem">
					<option value="">:: 전체 분류 ::</option>
					<option value="SPO">스포츠</option>
					<option value="CEL">연예인</option>
					<option value="MOV">영화</option>
					<option value="ANI">애니메이션</option>
					<option value="GAM">게임</option>
				</select> 

				<button class="btn" @click="fnGetList()">검색</button>
			</div>
	        <div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">게시글 번호</th>
	                        <th scope="col">게시글 종류</th>
	                        <th scope="col">게시글 제목</th>
	                        <th scope="col">작성자 아이디</th>
	                        <th scope="col">작성일자</th>
	                        <th scope="col">게시글 상태</th>
	                        <th scope="col">처리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in commList" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            <td>{{item.cbNo}}</a></td>
                            <td v-if="item.cate1 == 'SPO'">스포츠</td>
                            <td v-else-if="item.cate1 == 'CEL'">연예인</td>
                            <td v-else-if="item.cate1 == 'MOV'">영화</td>
                            <td v-else-if="item.cate1 == 'ANI'">애니메이션</td>
                            <td v-else-if="item.cate1 == 'GAM'">게임</td>
                            <td v-else>NULL</td>
                            <td @click="fnView(item.cbNo)"><a href="javascript:;">{{item.ctitle}}</a></td>     
                            <td>{{item.id}}</td>     
                            <td>{{item.cdate}}</td>     
                            <td v-if="item.delYn == 'Y'">블라인드</td>     
                            <td v-else></td>     
                            <td>
                          	  <button class=btn5 @click="fnCommBlind('Y' , item)">블라인드</button>
                          	  <button class=btn5 @click="fnCommBlind('N' , item)">블라인드취소</button>
                          	  <button class=btn5 @click="fnCommRemove(item)">삭제</button>
                            </td>     
                        </tr>                                       
	                </tbody>                   
	            </table>
	            <!-- 페이징 추가 3-->
				<template>
				  <paginate
				    :page-count="commPageCount"
				    :page-range="10"
				    :margin-pages="0"
				    :click-handler="fnCommSearch"
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
Vue.component('paginate', VuejsPaginate);
var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
    	, commList : []
    	, keyword : ""
    	, commKeyword :""
    	, selectItem : ""
    	, selectCommItem : ""
    	, sessionId : "${sessionId}" 	// request 에있는걸 가져온다는 뜻
    	, sessionStatus : "${sessionStatus}"
    	, tbNo : "${map.tbNo}"
    	, cbNo : "${map.cbNo}"
    	<!-- 페이징 추가 5-->
		, selectPage: 1
		, pageCount: 1
		, cnt : 0
		<!-- 페이징 추가 5-->
		, selectCommPage : 1
		, commPageCount : 1
		, commCnt : 0
    }   
    , methods: {

	    	fnCommBlind : function (cstatus , item) {
	    		var self = this;
	            var nparmap = {id : item.id, cbNo : item.cbNo , cstatus : cstatus};
	            $.ajax({
	                url:"/admin/boardlist/commBlind.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {   
	                	console.log(data);
	                	if(item.delYn == "N"){
	                		alert("블라인드 처리되었습니다!");
	                	}else {
	                		alert("블라인드가 취소 되었습니다!");
	                	}
	                	self.fnGetList();
	                }
	            }); 
	    	}
	    	
    	 , fnBlind : function (bstatus , item) {
    		var self = this;
            var nparmap = {id : item.id, tbNo : item.tbNo , bstatus : bstatus};
            $.ajax({
                url:"/admin/boardlist/blind.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	if(item.delYn == "N"){
                		alert("블라인드 처리되었습니다!");
                	}else {
                		alert("블라인드가 취소 되었습니다!");
                	}
                	self.fnGetList();
                }
            }); 
    	}
    
        ,fnGetList : function(){
            var self = this;
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 9 ;
            var nparmap = {keyword : self.keyword , brdFlg : self.selectItem 
            		, cate1 : self.selectCommItem , commKeyword : self.commKeyword
            		, startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/admin/boardlist.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
	                self.list = data.list;
	                self.commList = data.commList;
	                self.cnt = data.cnt;
	                self.commCnt = data.commCnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
	                self.commPageCount = Math.ceil(self.commCnt / 10);
                }
            }); 
        }
        
        <!-- 페이징 추가 7-->
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 9) ;
			var lastNum = 9;
			var nparmap = {keyword : self.keyword , brdFlg : self.selectItem 
            		, cate1 : self.selectCommItem , commKeyword : self.commKeyword
            		, startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/admin/boardlist.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					/* self.commList = data.commList; */
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		}
		
        <!-- 페이징 추가 7-->
		, fnCommSearch : function(pageNumm){
			var self = this;
			self.selectCommPage = pageNumm;
			var startNum = ((pageNumm-1) * 9) ;
			var lastNum = 9;
			var nparmap = {keyword : self.keyword , brdFlg : self.selectItem 
            		, cate1 : self.selectCommItem , commKeyword : self.commKeyword
            		, startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/admin/boardlist.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					/* self.list = data.list; */
					self.commList = data.commList;
					self.commCnt = data.commCnt;
					self.commPageCount = Math.ceil(self.commCnt / 10);
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
                url:"/admin/boardlist/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	alert("게시글이 삭제되었습니다.")
                	self.fnGetList();	// 지우고 나서 리스트 바로 출력
                }
            });  
    	}
    	

    	, fnCommRemove : function(item) {	//매개변수를 줘야함
    		var self = this;
    		console.log(item);
            var nparmap = item;		// item 자체가 맵이라서 {} 이거 안씀
            if(!confirm("정말 삭제하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            
            $.ajax({
                url:"/admin/boardlist/comm/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	alert("게시글이 삭제되었습니다.")
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
    	
    	, fnView : function(cbNo){
    	
    		var self = this;
    		console.log(cbNo);
    		self.pageChange("/commread.do", {cbNo : cbNo});
    	}
    	
    }   
    , created: function () {
		this.fnGetList();    
	}
});
</script>
