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
		width: 50%;
		margin: auto;
	}
	table {
		width: 1000px;
		text-align: center;
		border: 1px solid #fff;
		border-spacing: 1px;
		margin: auto;
		border-collapse: collapse;
		border-width: 1px 0;
	}
	table tbody tr:hover td{
		background-color:lightcyan;
	}

	table td {
		padding: 10px;
		background-color: #eee;
		border-bottom: 1px solid #000;
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
	<div id="app">
		<div class="container">
		<div class="card">
			<div>
				<a href="main.do" style="none;">홈</a> 
				<span> > </span>
				<span>
					<select style="border: 0;">
						<option> 전체 </option>
					</select>
				</span>
			</div>
			<div>
				1-15 / <span>{{listcnt}}</span>
			</div>
			<div class="table-list">
				<table class="board_list">
					<thead>
						<tr>
							<th scope="col" v-if="info.id == sessionId || sessionAdminflg == 'Y'"></th>
							<th scope="col">No.</th>
							<th scope="col">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item, index) in list" @click="fnView(item.cbno)" v-if="item.delYn == 'N'">
							<td v-if="info.id == sessionId || sessionAdminflg == 'Y'"><input type="checkbox" v-bind:value="item" v-model="checkList"></td>
							<td>{{item.cbno}}</td>
							<td style="width: 40%" >{{item.ctitle}}</td>
							<td>{{item.hits}}</td>
							<td>{{item.id}}</td>
							<td>{{item.cdate}}</td>
						</tr>
						<tr v-else>
							<td>{{item.cbno}}</td>
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
				<button class="btn" v-if="info.id == sessionId || sessionAdminflg == 'Y'" @click="">삭제</button>
			</div>
			<div class="searchbox">
				<select>
					<option value=""> 전체 </option>
					<option value=""> 최신순 </option>
					<option value=""> 조회순 </option>
				</select>
				<label><input type="text" v-model="keyword" ></label>
				<button class="btn" @click="fnGetList" >검색</button>
			</div>
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
			listcnt: "",
			keyword : "",
			info : {},
			listcate1:{},
			listcate2:{},
		    sessionId : "test01",
		    sessionAdminflg : "N",
		    
		    
			/* 페이징 추가 5 */
			selectPage: 1,
			pageCount: 1,
			cnt : 0
		}
		, methods: {
			// 리스트 불러오기,페이징6
			fnGetList: function () {
				var self = this;
				/* selectPage 시작점에서 ~까지 가져올지  */
				var startNum = ((self.selectPage - 1) * 15);
				var lastNum = 15;
				var nparmap = {keyword : self.keyword, kind : self.selectItem, startNum: startNum, lastNum: lastNum };
				console.log(startNum);
				console.log(lastNum);
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
			, fnSearch: function (pageNum) {
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum - 1) * 15);
				var lastNum = 15;
				var nparmap = { startNum: startNum, lastNum: lastNum };
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
				location.href = "/commadd.do";
			}
			
	    	, fnView : function(cbno){
	    		var self = this;
	    		self.pageChange("/commread.do", {cbno : cbno});
	    	}
	    	
	    	, listcate1 : function(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"/comm/cate1.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data)
						self.listcate1 = data.listcate1;
					}
				});
	    	}
        	
	    	, listcate2 : function(){
				var self = this;
				var nparmap = {pcomm1 : self.inlist.cate1};
				$.ajax({
					url:"/comm/cate2.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data)
						self.listcate2 = data.listcate2
					}
				});
				
			}


		}
		, created: function () {
			var self = this;
			self.fnGetList();
		}
	
	});
</script>