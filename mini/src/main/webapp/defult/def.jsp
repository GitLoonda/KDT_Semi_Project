<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="js/jquery.js"></script>
    <script src="assets/ckeditor5/build/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
    <style>
    	* {
            list-style: none;
            text-decoration: none;
        }
        body {
            width : 1980px;
            margin : auto;
        }
        #container1 {
            width : 1080px;
            margin : auto;
            background-color: white;
        }
        #header {
            margin: auto;
            padding: 20px 0 0 0;
            display: flex;
            justify-content: center ;
            height: 100px;
        }
        #logobox {
        	width : 200px;
        	height : 100px;
        }
        #searchBox {
            margin : 0 80px;
            padding : 20px 0 0 0;
        }
        #searchBar {
            border: 3px solid #ADD4D9;
            background-color: white;
            margin: 0px;
            padding : 0px;
            height: 30px;
        }
        #searchBar select {
            border : none;
            border-right: 3px solid #ADD4D9;
            margin: 0px;
            padding : 0px;
            height: 30px;
            width: 8em;
            border-radius: 0;
        }
        #searchBar select:focus {
            outline: none;
        }
        #searchBar input {
            margin: 0px;
            padding : 0px;
            height : 25px;
            width : 24em;
            border: none;
            border-right: 3px solid #ADD4D9;
            border-radius: 0;
        }
        #searchBar input:focus {
            outline: none;
        }
        #searchBar button {
            margin: 0px;
            padding : 0px;
            width: 50px;
            height: 30px;
            background-color: white;
            border-radius: 0;
            border: none;
            float: right;
        }
        #searchBar button:hover {
            background-color: #ccc;
        }
        #searchBox #rcmdItem {
            margin : 0 0 0 7em;
        }
        #searchBox span {
            font-size: 0.9em;
            line-height: 30px;
        }
        #register {
            padding: 20px 0 0 0;
        }
        #register button {
            margin : 0 10px;
            border: none;
            border-radius: 0;
            background-color: white;
            height: 30px;
        }
        #register button:hover {
            background-color: #ccc;
        }
        #navbar {
            height: 40px;
            background-color: #ADD4D9;
        }
        a {
            color: black;
            font-weight: bold;
        }
        .menu > li {
            width: 14%;
            float: left;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
        }
        .category {
            width : fit-content;
            position : static;
	 		z-index : 1;
        }
        .dep1, .dep2, .dep3 {
        	display : none;
            margin: 0;
            padding: 0;
            background-color: #ADD4D9;
            border : 2px solid #bbd8f2;
            width : 160px;
        }
        .dep1 li {
        	position : relative;
        }
        .dep2 {
        	position : absolute;
        	top : 0%;
        	left : 100%;
        }
        .dep2 li {
        	position : relative;
        }
        .dep3 {
        	position : absolute;
        	top : 0%;
        	left : 100%;
        }
        .category ul li {
        	text-align : left;
        }
        .dep3 li {
        	text-align : right;
        }
        .category ul li span {
        	float : right;
        }
        .menu > li:hover {
            background-color: #bbd8f2;
        }
        .menu > li:hover > .category .dep1 {
            display: block;
        }
        .dep1 > li:hover {
        	background-color: #bbd8f2;
        }
        .dep1 > li:hover > .dep2 {
            display: block;
        }
        .dep2 > li:hover {
        	background-color: #bbd8f2;
        }
        .dep2 > li:hover > .dep3 {
            display: block;
        }
        .dep3 > li:hover {
        	background-color: #bbd8f2;
        }
   	</style>
</head>
<div id="app0">
        <div id="container1">
            <div id="header">
                <div @click="fnMain" id="logoBox">
                    <img src="img/main/unity-logo-200x100-1.jpg" alt="logo">
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
                        <button @click="fnSearch">검색</button>
                    </div>
                    <div id="RcmdItem">
                        <span>추천 검색어 : </span>
                        <span v-for="item in cate3">{{item.cInfo}}, </span>
                    </div>
                </div>
                <div id="register">
                    <button @click="fnLogin">로그인</button>
                    <button @click="fnJoin">회원가입</button>
                </div>
            </div>
            <div id="navbar">
                <ul class="menu">
                    <li>
                        <a href="javascript:;">중고거래</a>
                        <div class="category">
                            <ul class="dep1">
                                <li v-for="item in cate1">
                                    <a href="javascript:;">
                                    {{item.cInfo}}
                                    <span>></span>
                                    </a>
                                    <ul class="dep2">
		                                <li v-for="item2 in cate2">
		                                    <a v-if="item2.pComm1 == item.cNum" href="javascript:;">
		                                    {{item2.cInfo}}
		                                    <span>></span>
		                                    </a>
		                                    <ul class="dep3">
				                                <li v-for="item3 in cate3">
				                                    <a href="javascript:;">
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
                        <a href="javascript:;">제작의뢰</a>
                        <div class="category">
                            <ul class="dep1">
                                <li v-for="item in cate1">
                                    <a href="javascript:;">
                                    {{item.cInfo}}
                                    <span>></span>
                                    </a>
                                    <ul class="dep2">
		                                <li v-for="item2 in cate2">
		                                    <a v-if="item2.pComm1 == item.cNum" href="javascript:;">
		                                    {{item2.cInfo}}
		                                    <span>></span>
		                                    </a>
		                                    <ul class="dep3">
				                                <li v-for="item3 in cate3">
				                                    <a href="javascript:;">
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
    		cate1 : [],
    		cate2 : [],
    		cate3 : [],
    		option : "",
    		keyword : "",
    		navParam : []
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
       	                })
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
        }   
        , created: function () {
        	var self = this;
        	self.$nextTick(self.fnGetList());
    	}
    });
    </script>