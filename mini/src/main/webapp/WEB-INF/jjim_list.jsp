<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>찜 목록</title>
</head>
<style>
 * {
 	text-decoration : none;
 	line-style : none;
 }
 .container {
 	width : 1080px;
 	margin : auto;
 	margin-top : 250px;
 	
 }
 .listbox {
 	width : 80%;
 	display : block;
 	margin : auto;
 	text-align : center;
 }
 .listbox h2 {
 	text-align : left;
 }
 .itembox {
 	width : 100%;
 	display : flex;
 	margin : 25px 0;
 	background : #eee;
 	padding : 10px 10px 0 10px;
 	border-radius : 5px;
 }
 .itembox button {
 	width : 2em;
 	height : 2em;
 	border : none;
 	border-radius : 5px;
 }
 .itembox button:hover {
 	background : #ccc;

 }
 .imgbox {
 	width : 150px;
 	height : 150px;
 	margin : 15px;
 	background-image : url("../img/share/no-image01.gif");
 	background-size : 100% 100%;
 	overflow : hidden;
 }
 .imgbox img {
 	width : 150px;
 	height : 150px;
 }
 .descbox {
 	width : 80%;
 	margin-left : 30px;
 }
 .descbox p {
 	text-align : left;
 	font-size : 0.8em;
 }
 .btnbox button {
 	width : 5em;
 	height : 2em;
 	float : right;
 	margin : 0 10px 10px 10px;
 	border-radius : 0;
 	border : none;
 }
 .btnbox button:hover {
 	background : #ccc;
 }
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="listbox">
				<h2>찜 목록</h2>
				<div v-for="(item, index) in list" class="itembox">
					<div class="imgbox">
						<a @click="fnView(item.tbno)" href="javascript:;">
							<img :src="item.path" alt="jjimImg">
						</a>
					</div>
					<div class="descbox">
						<template v-if="item.bstatus == 'BS1'">
							<p>[판매]</p>
						</template>
						<template v-if="item.bstatus == 'BS2'">
							<p>[구매]</p>
						</template>
						<template v-if="item.bstatus == 'BS3'">
							<p>[의뢰]</p>
						</template>
						<p>제목 : {{item.btitle}}</p>
						<p>게시자 : {{item.nick}}</p>
						<p>가격 : {{item.bprice}}원</p>
						<p>주소 : {{item.local1}} {{item.local2}} {{item.local3}}</p>
						<div class="btnbox">
							<button @click="fnView(item.tbno)">거래하기</button>
						</div>
					</div>
					<button @click="fnDel(item.jjno)" href="javascript:;">X</button>
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
    	list : [],
    	sessionId : "${sessionId}",
    	sessionNick : "${sessionNick}",
		sessionStatus : "${sessionStatus}"
    }   
    , methods: {
    	fnPermission : function() {
    		var self = this;
    		if(self.sessionId == "" || self.sessionId == null) {
    			location.href = "denied.do";
    			return;
    		}
    		self.fnGetJjimList();
    	}
    	, fnGetJjimList : function() {
    		var self = this;
    		var nparmap = {id : self.sessionId};
    		 $.ajax({
         		 url:"/main/jjimList.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
 	         		self.list = data.list;
 	         		for(var i = 0; i < self.list.length; i++) {
 	         			self.list[i].bprice = self.list[i].bprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 	         		}
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
    	, fnView(tbNo){
			var self = this;
			self.pageChange("./tradeview.do", {tbno : tbNo});
		}
    	, fnDel(jjno) {
    		var self = this;
    		if(!confirm("찜을 삭제하시겠습니까?")) {
    			return;
    		}
    		var nparmap = {jjno : jjno};
   		 	$.ajax({
        		url:"/main/jjimDel.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.result == "success") {
                		alert("찜이 삭제되었습니다.");
                		self.fnGetJjimList();
                		return;
                	}
                }
            }); 
    	}
    }   
    , created: function () {
    	var self = this;
    	self.$nextTick(self.fnPermission());
	}
});
</script>