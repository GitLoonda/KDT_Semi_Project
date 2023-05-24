<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>커뮤니티 게시판</title>
</head>
<style>
	.card{
		width: 1080px;
		margin: 1px auto;
	}
	.listcnt {
		padding-left: 10px;
		margin-top: 10px;
	}
	.category_path{
		line-height: 20px;
		padding-left: 10px;
		margin-top: 10px;
	}
	.category_path a {
		style: none; 
		font-size: 0.8em;
	}
	
	.category_path select{
		border: none;
		text-align: center;
 	   	appearance: none;
	}
	table {
		width: 1080px;
		text-align: center;
		border: 1px solid #fff;
		border-spacing: 1px;
		margin: auto;
		border-collapse: collapse;
		border-width: 1px 0;
	}
	table tbody tr:hover td{
		background-color: aliceblue;
	}

	table td {
		padding: 10px;
		background-color: #eee;
		border-bottom: 1px solid #000;
	}
	
	table td a {
		cursor: pointer;
	}

	table th {
		border-bottom: 1px solid #000;
		padding: 10px;
	}

	.searchbox {
		padding: 15px 0;
		text-align: center;
	}

	.btns {
		padding: 10px 0;
		text-align: right;
	}
	
	.pageline {
		text-align: center; 
	}
	
/* 페이징 추가 */
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
	<div id="app">
		<div class="container">
		<div class="card">
			<div class="category_path">
				<a href="main.do"> 홈 </a> 
				<span>  >  </span>

				<span>
					<template v-if="cate1 != '' && cate2 != ''">
						커뮤니티 > {{cate1n}} > {{cate2n}}
					</template>
					<template v-else="cate1 != null">  
						커뮤니티 > {{cate1n}}
					</template>					
				</span>
			</div>
			<div class="listcnt">
				1-15 / <span>{{listcnt}}</span>
			</div>
			<div class="table-list">
				<table class="board_list">
					<thead>
						<tr>
							<!-- <th scope="col" v-if="list.id == sessionId || sessionAdminflg == 'Y'"></th>  -->
							<th scope="col">No.</th>
							<th scope="col"></th>
							<th scope="col">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- 글 삭제 X -->
						<tr v-for="(item, index) in list" v-if="item.delYn != 'Y'">
							<!-- <td v-if="item.id == sessionId || sessionAdminflg == 'Y'" @click=""><input type="checkbox" v-bind:value="item" v-model="checkList"></td>  
							<td v-else></td> -->
							<td>{{item.cbno}}</td>							
							<td v-if="cate1 != '' && cate2 != ''"></td>
							<td v-else="cate1 != null">[{{item.cate2name}}]</td>
							<td v-if="item.commcnt == 0" @click="fnView(item.cbno)"> <a>{{item.ctitle}}</a></td>
							<td v-else @click="fnView(item.cbno)"><a>{{item.ctitle}} ({{item.commcnt}})</a></td>
							<td>{{item.hits}}</td>
							<td>{{item.nick}}</td>
							<td v-if="item.udate == null">{{item.cdate}}</td>
							<td v-else>{{item.udate}}</td>
						</tr>
						<!-- 글 삭제 O -->
						<tr v-else>
							<!-- <td v-if="item.id == sessionId || sessionAdminflg == 'Y'"><input type="checkbox" v-bind:value="item" v-model="checkList"></td> 
							<td v-else></td>  -->
							<td>{{item.cbno}}</td>
							<td></td>
							<!--<td v-if="cate1 != '' && cate2 != ''"></td>
							<td v-else="cate1 != null">[{{item.cate2name}}]</td> -->
							<td> 삭제된 게시글 입니다. </td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btns">
				<button class="btn" @click="fnAdd()">글쓰기</button>
				<!-- <button class="btn" v-if="list.id == sessionId || sessionAdminflg == 'Y'" @click="fnRemove(list.cbno)">삭제</button> -->
			</div>
			<div class="searchbox">
				<select>
					<option value=""> 전체 </option>
					<option value=""> 최신순 </option>
					<option value=""> 조회순 </option>
				</select>
				<label><input type="text" v-model="keyword" @keyup.enter="fnGetList" ></label>
				<button class="btn" @click="fnGetList" >검색</button>
			</div>
			<!-- 페이징 추가 3-->
				<div class="pageline">
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
			list: [],
			checkList : [],
			listcnt: "",
			keyword : "",
			info : {},

		    sessionId : "${sessionId}",
		    sessionNick : "${sessionNick}",
		    sessionAdminflg : "${sessionAdminflg}",
		    
		    cate1 : "${mainlist.cnum}",
		    cate1n : "${mainlist.cinfo}",
		    cate2 : "${mainlist.cnum2}",
		    cate2n : "${mainlist.cinfo2}",

			/* 페이징 추가 5 */
			selectPage: 1,
			pageCount: 1,
			cnt : 0
		}
		, methods: {
			// 리스트 불러오기,페이징6
			fnGetList: function (cate1, cate2) {
				var self = this;
				/* selectPage 시작점에서 ~까지 가져올지  */
				var startNum = ((self.selectPage - 1) * 15);
				var lastNum = 15;
				var nparmap = {startNum: startNum, lastNum: lastNum, cate1: cate1, cate2: cate2};
				console.log(nparmap);
				$.ajax({
					url: "/comm/list.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						console.log(data);
						self.list = data.list;
						self.listcnt = data.cnt;
						self.pageCount = Math.ceil(self.listcnt / 15);
					}
				});
			}
			/* 페이징 추가 7 */
			, fnSearch: function(pageNum) {
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum - 1) * 15);
				var lastNum = 15;
				var nparmap = {startNum: startNum, lastNum: lastNum,  cate1: self.cate1, cate2: self.cate2};
				$.ajax({
					url: "/comm/list.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function (data) {
						self.list = data.list;
						self.listcnt = data.cnt;
						self.pageCount = Math.ceil(self.listcnt / 15);
					}
				});
			}
			// 페이지 변경
			, pageChange: function (url, param) {
				var target = "_self";
				if (param == undefined) {
				//	this.linkCall(url);
					return;
				}
				var form = document.createElement("form");
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
				for (var name in param) {
					var item = name;
					var val = "";
					if (param[name] instanceof Object) {
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
			
			, fnAdd: function () {
				var self = this;
				console.log(self.sessionId);
				if(self.sessionId == ''){
					alert("로그인이 필요합니다.");
					location.href="login.do";
				} else {
				location.href = "/commadd.do";
				}
			}
			
	    	, fnView : function(cbno){
	    		var self = this;
	    		self.pageChange("/commread.do", {cbno : cbno});
	    	}
	    	
	    	, fnRemove : function(cbno){
	    		 var self = this;
	    		 if(!confirm("정말 삭제하시겠습니까?")){
	    			 return;
	    		 }
	             var nparmap = {cbno: self.cbno};
	             $.ajax({
	                 url:"/comm/remove.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) {
	                	alert("삭제되었습니다.");
	 	                self.fnGetList(self.cate1, self.cate2);
	                 }
	             }); 
	    	}
	    	
	    	


		}
		, created: function () {
			var self = this;
			self.fnGetList(self.cate1, self.cate2);
			console.log("${mainlist}");
			console.log("${sessionAdminflg}");
		}
	
	});
</script>