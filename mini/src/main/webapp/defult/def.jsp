<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="css/defcss.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="assets/ckeditor5/build/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
    <style>
    	
   	</style>
</head>
<div id="app0">
        <div id="container1">
            <div id="header">
                <div @click="fnMain" id="logoBox">
                	<a href="javascript:;"><img src="img/main/unity-logo-200x100-1.jpg" alt="logo"></a>
                </div>
                <div id="searchBox">
                    <div id="searchBar">
                        <select v-model="option">
                            <option value="">::항목::</option>
                            <option>구매</option>
                            <option>판매</option>
                            <option>의뢰</option>
                        </select>
                        <input v-model="keyword" type="text">
                        <a href="javascript:;"><button @click="fnSearch">검색</button></a>
                        
                    </div>
                    <div id="RcmdItem">
                        <span>추천 검색어 : </span>
                        <span v-for="item in cate3">{{item.cInfo}}, </span>
                    </div>
                </div>
                <template v-if="sessionId == ''">
	                <div id="register">
	                    <button @click="fnLogin">로그인</button>
	                    <button @click="fnJoin">회원가입</button>
	                </div>
                </template>
                <template v-else>
                	<div id="myInfo">
                		<p>{{sessionNick}}님, 환영합니다.</p>
                		<button @click="fnMyPage">마이페이지</button>
                		<button @click="fnLogout">로그아웃</button>
                	</div>
                </template>
                
            </div>
            <div id="navbar">
                <ul class="menu">
                    <li >
                        <a href="javascript:;"@click="fnTrade">중고거래</a>
                        <div class="category">
                            <ul class="dep1">
                                <li  v-for="item in cate1">
                                    <a href="javascript:;" @click="fnCateSelect(item.cNum,item.cInfo)">
                                    {{item.cInfo}}
                                    <span>></span>
                                    </a>
                                    <ul class="dep2">
		                                <li  v-for="item2 in cate2">
		                                    <a v-if="item2.pComm1 == item.cNum" href="javascript:;"@click="fnCateSelect(item.cNum,item.cInfo, item2.cNum,item2.cInfo)">
		                                    {{item2.cInfo}}
		                                    <span>></span>
		                                    </a>
		                                    <ul class="dep3">
				                                <li  v-for="item3 in cate3">
				                                    <a href="javascript:;"@click="fnCateSelect(item.cNum,item.cInfo, item2.cNum,item2.cInfo,item3.cNum,item3.cInfo)">
				                                    {{item3.cInfo}}
				                                    </a>
				                                </li>
				                            </ul>
		                                </li>
		                            </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li @click="fnRequest">
                        <a href="javascript:;">제작의뢰</a>
                        <div class="category">
                            <ul class="dep1">
                                <li v-for="item in bcms">
                                    <a href="javascript:;">{{item.cInfo}}</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li v-for="item in cate1">
                        <a href="javascript:;">{{item.cInfo}}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </body>
    </html>
    <script type="text/javascript">

    var app = new Vue({ 
        el: '#app0',
        data: {
        	map : [],
        	cate : {},
    		cate1 : [],
    		cate2 : [],
    		cate3 : [],
    		bcms : [],
    		option : "",
    		keyword : "",
    		sessionId : "${sessionId}",
    		sessionNick : "${sessionNick}",
    		sessionStatus : "${sessionStatus}",
            // 검색값 전달
            select:{
                setcate1:"",
                setcate2:"",
                setcate3:"",
                option:"",
                keyword:"",
            }
        }   
        , methods: {
        	fnGetList : function(){
                var self = this;
                var nparmap = {};
                $.ajax({
                    url:"/main/list.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
    	                self.map = data.category;
   	                	self.cate1 = self.map.filter(function(element){
       	                	return element.cId == "CATE1";
       	                });
   	                	self.cate2 = self.map.filter(function(element){
       	                	return element.cId == "CATE2";
       	                });
   	                	self.cate3 = self.map.filter(function(element){
       	                	return element.cId == "CATE3";
       	                });
   	                	self.bcms = self.map.filter(function(element){
   	                		return element.cId == "BCMS";
   	                	});
   	                	console.log(self.bcms);
                    }
                }); 
            }
        	, fnMain : function() {
        		location.href = "main.do";
        	}
        	, fnLogin : function() {
        		location.href = "login.do";
        	}
        	, fnJoin : function() {
        		location.href = "join.do";
        	}
        	, fnMyPage : function() {
        		location.href = "mypage.do";
        	}
        	, fnLogout : function() {
        		location.href = "logout.do";
        	}
        	, fnTrade : function() {
        		location.href = "trade.do";
        	}
        	, fnRequest : function() {
        		location.href = "request.do";
        	}
        	, fnCateSelect : function(item, item2, item3,item4,item5,item6) {
        		var self = this;
                tlist.fnGetTradeList(item, item2, item3,item4,item5,item6);
        		// if(item2 == null) {
        		// 	self.pageChange("/trade.do", {cate1 : item.cNum, cate2 : null, cate3 : null});
        		// 	return;
        		// }
        		// else if(item3 == null) {
        		// 	self.pageChange("/trade.do", {cate1 : item.cNum, cate2 : item2.cNum, cate3 : null});
        		// 	return;
        		// }else{
                //     self.pageChange("/trade.do", {cate1 : item.cNum, cate2 : item2.cNum, cate3 : item3.cNum});
                // }
        	}
        	, fnSearch : function(){
        		var self = this;
        		if(self.option == "구매" || self.option == "판매") {
        			self.pageChange("/trade.do", {option : self.option, keyword : self.keyword});
        		}
        		else if(self.option == "의뢰") {
        			self.pageChange("/request.do", {option : self.option, keyword : self.keyword});
        		}
        		else {
        			alert("게시판을 선택해주세요.");
        		}
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
        	var self = this;
        	self.$nextTick(self.fnGetList());
    	}
    });
    </script>