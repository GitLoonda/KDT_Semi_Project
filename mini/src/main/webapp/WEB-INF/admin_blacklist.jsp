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
	<title>🕵🏻‍♀️ 신고접수</title>

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
			<h2>🕵🏻‍♀️ 신고접수</h2>
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
	        <div class="table-list">
	        	<h3 style="font-size : 1.2rem">
	        		 ▪  블랙리스트 목록  ▪ 
	        		<div style="float:right;">
						<input class=txtbox1 type="text" v-model="keyword" @keyup.enter="fnGetList">
						<button class=btn @click="fnGetList">검색</button>
					</div>
				</h3>
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">No.</th>
	                        <th scope="col">신고사유</th>
	                        <th scope="col">ID</th>
	                        <th scope="col">등록일</th>
	                        <th scope="col">게시글 신고 횟수</th>
	                        <th scope="col">댓글 신고 횟수</th>
	                        <th scope="col">상태</th>
	                        <th scope="col">처리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            <td>{{item.baNo}}</td>
                            <td>{{item.content}}</a></td>
                            <td>{{item.id}}</td>     
                            <td>{{item.adate}}</td>     
                            <td>{{item.bancnt1}}</td>     
                            <td>{{item.bancnt2}}</td>     
                            <td v-if="item.ustatus == 1">정상</td>     
                            <td v-else-if="item.ustatus == 2">사용불가</td>     
                            <td v-else-if="item.ustatus == 3">사용정지</td>     
                            <td>
                            	<button class=btn5 @click="fnBan('3', item)">승인</button>
                            	<button class=btn5 @click="fnBan('1', item)">해제</button>
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
    	, blackUser : []
    	, keyword : ""
    	, sessionId : "${sessionId}"
	    <!-- 페이징 추가 5-->
		, selectPage : 1
		, pageCount : 1
		, blackCnt : 0
    }   
    , methods: {
    	
        fnGetList : function(){
            var self = this;
   		 	var startNum = ((self.selectPage-1) * 10);
			var lastNum = 10
            var nparmap = {keyword : self.keyword, startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/admin/blacklist.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
	                self.list = data.list;
	                self.blackCnt = data.blackCnt;
	                self.pageCount = Math.ceil(self.blackCnt / 10);
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
				url : "/admin/blacklist.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.blackCnt = data.blackCnt;
					self.pageCount = Math.ceil(self.blackCnt / 10);
				}
			});
		}
    
    	, fnBan : function (status, item){
    		var self = this;
            var nparmap = {id : item.id, status : status};
            if(!confirm("블랙리스트를 승인하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            $.ajax({
                url:"/admin/blacklist/ban.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	if(status == '1'){
                		alert("블랙리스트에 해제되었습니다.");
                	}else{
                		alert("블랙리스트에 추가되었습니다.");
                	}
                	
                	self.fnGetList();
                }
            }); 
    	
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
