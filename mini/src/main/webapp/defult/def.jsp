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
                        <span v-for="item in cate3"><a @click="fnRecomSearch(item.cinfo)" href="javascript:;">{{item.cInfo}}</a>, </span>
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
                		<p>{{sessionNick}}님, 환영합니다.
                			<a href="/admin/main.do" v-if="sessionAdminFlg == 'Y'" style="font-size: 1.3rem"> ⚙</a>
                		</p>
                		<button @click="fnMyPage">마이페이지</button>
                		<button @click="fnLogout">로그아웃</button>
                	</div>
                </template>
                
            </div>
            <div id="navbar">
                <ul class="menu">
                    <li >
                        <a href="javascript:;"@click="fnCateSelect(1)">중고거래</a>
                        <div class="category">
                            <ul class="dep1">
                                <li  v-for="item in cate1">
                                    <a href="javascript:;" @click="fnCateSelect(1, item.cNum,item.cInfo)">
                                    {{item.cInfo}}
                                    <span>></span>
                                    </a>
                                    <ul class="dep2">
		                                <li  v-for="item2 in cate2">
		                                    <a v-if="item2.pComm1 == item.cNum" href="javascript:;"@click="fnCateSelect(1, item.cNum,item.cInfo, item2.cNum,item2.cInfo)">
		                                    {{item2.cInfo}}
		                                    <span>></span>
		                                    </a>
		                                    <ul class="dep3">
				                                <li  v-for="item3 in cate3">
				                                    <a href="javascript:;"@click="fnCateSelect(1, item.cNum,item.cInfo, item2.cNum,item2.cInfo, item3.cNum,item3.cInfo)">
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
                    <li>
                        <a href="javascript:;" @click="fnCateSelect(2)">제작의뢰</a>
                        <div class="category">
                            <ul class="dep1">
                                <li v-for="item in bcms">
                                    <a href="javascript:;" @click="fnCateSelect(2, item.cNum, item.cInfo)">{{item.cInfo}}</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li v-for="item in cate1">
                        <a href="javascript:;" @click="fnComm(item.cNum, item.cInfo)">{{item.cInfo}}</a>
                         <div class="category">
                            <ul class="dep1">
                                <li v-for="item2 in cate2">
                                    <a href="javascript:;" v-if="item2.pComm1 == item.cNum" @click="fnComm(item.cNum, item.cInfo, item2.cNum, item2.cInfo)">{{item2.cInfo}}</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
			
			<div class="sidebar">
	           	<div><a @click="fnRecent" href="javascript:;">최근 본 상품</a></div>
	           	<div><a @click="fnJjim" href="javascript:;">찜한 상품</a></div>
	           	<div><a href="#header">맨 위로</a></div>
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
    		sessionAdminFlg : "${sessionAdminFlg}",
            // 검색값 전달
            select:{
                setcate1:"",
                setcate2:"",
                setcate3:"",
                option:"",
                keyword:""
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
   	                	});;
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
        	, fnRecent : function() {
        		location.href = "recent.do";
        	}
        	, fnJjim : function() {
        		location.href = "jjim.do";
        	}
        	, fnCateSelect : function(i, item, item2, item3, item4, item5, item6) {
        		var self = this;
        		if(typeof tlist !== 'undefined') {
        			tlist.fnGetTradeList(item, item2, item3, item4, item5, item6);
        			return;
        		}
       			if(item == null) {
       				self.pageChange("/trade.do", {brdflg : i, cnum1 : null, cinfo1 : null, cnum2 : null, cinfo2 : null, cnum3 : null, cinfo3 : null});
       				return;	
       			}
       			if(item3 == null) {
           			self.pageChange("/trade.do", {brdflg : i, cnum1 : item, cinfo1 : item2, cnum2 : null, cinfo2 : null, cnum3 : null, cinfo3 : null});
           		 	return;
           		}
           		if(item5 == null) {
           		 	self.pageChange("/trade.do", {brdflg : i, cnum1 : item, cinfo1 : item2, cnum2 : item3, cinfo2 : item4, cnum3 : null, cinfo3 : null});
           		 	return;
           		} 
                   self.pageChange("/trade.do", {brdflg : i, cnum1 : item, cinfo1 : item2, cnum2 : item3, cinfo2 : item4, cnum3 : item5, cinfo3 : item6});
        	}
        	, fnRecomSearch : function(keyword) {
        		var self = this;
        		if(self.option == null || self.option == "") {
        			alert("게시판을 선택해주세요.");
        			return;
        		}
       			if(self.option == "구매") {
       				self.pageChange("/trade.do", {brdflg : 1, kind : 1, keyword : keyword});
       				return;
       			}
       			if(self.option == "판매") {
       				self.pageChange("/trade.do", {brdflg : 1, kind : 2, keyword : keyword});
       				return;
       			}
       			if(self.option == "의뢰") {
       				self.pageChange("/trade.do", {brdflg : 2, kind : 3, keyword : keyword});
       				return;
       			}
        	}
        	, fnSearch : function(){
        		var self = this;
        		if(self.option == null || self.option == "") {
        			alert("게시판을 선택해주세요.");
        			return;
        		}
       			if(self.option == "구매") {
       				self.pageChange("/trade.do", {brdflg : 1, kind : 1, keyword : self.keyword});
       				return;
       			}
       			if(self.option == "판매") {
       				self.pageChange("/trade.do", {brdflg : 1, kind : 2, keyword : self.keyword});
       				return;
       			}
       			if(self.option == "의뢰") {
       				self.pageChange("/trade.do", {brdflg : 2, kind : 3, keyword : self.keyword});
       				return;
       			}
        	}
        	, fnComm : function(item, item2, item3, item4) {
        		var self = this;
        		if(item3 == null) {
        			self.pageChange("/comm.do", {cnum : item, cinfo : item2});
           		 	return;
           		}
        		self.pageChange("/comm.do", {cnum : item, cinfo : item2, cnum2 : item3, cinfo2 : item4});
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