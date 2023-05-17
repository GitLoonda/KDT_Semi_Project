<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>

	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<link rel="stylesheet" href="../css/style.css">
	<title>관리자 계정 관리</title>

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
</style>
<body>
	<div id="app" >
		<div class="container">
			<h2>관리자 계정 관리</h2>
			<div> 
				<input type="text" v-model="keyword" @keyup.enter="fnGetList">
				<button @click="fnGetList">검색</button>	
			</div>
			
	        <div class="table-list">
	        	<h2>관리자 목록</h2>
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">No.</th>
	                        <th scope="col">ID</th>
	                        <th scope="col">가입날짜</th>
	                        <th scope="col">관리자여부</th>
	                        <th scope="col">승인여부</th>
	                        <th scope="col"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list"> 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            
                            <td>{{index + 1}}</td>
                            <td>{{item.id}}</td>
                            <td>{{item.cdate}}</td>   
                            <td v-if="item.adminflg == 'Y'">관리자</td>  
                            <td v-else>회원</td>  
                            <td>
                            	<button @click="fnRecogAdmin('Y' , item)">승인</button>
                            	<button @click="fnRecogAdmin('N' , item)">거부</button>
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
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
    	, keyword : ""
    	, AA : "관리자"
    	, UU : "일반회원"
    		<!-- 페이징 추가 5-->
		, selectPage: 1
		, pageCount: 1
		, cnt : 0
    }   
    , methods: {
    	
        fnGetList : function(){
            var self = this;
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {keyword : self.keyword, startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/admin/manage.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
	                self.list = data.list;
	                self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
                }
            }); 
        }
    	
	    <!-- 페이징 추가 7-->
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/admin/manage.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		}
    	, fnRecogAdmin : function(adminflg , item) {
    		var self = this;
            var nparmap = {id : item.id , adminflg : adminflg};
            $.ajax({
                url:"/admin/recogAdmin.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	if(adminflg == 'Y'){
                		alert("관리자로 승격하었습니다.");
                	}else{
                		alert("관리자 거부 당했습니다 . 슈퍼관리자한테 문의하세요");
                	}
                	self.fnGetList();
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