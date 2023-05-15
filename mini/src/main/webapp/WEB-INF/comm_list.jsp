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
	table {
		width: 950px;
		text-align: center;
		border: 1px solid #fff;
		border-spacing: 1px;
		margin: auto;
		border-collapse: collapse;
		border-width: 1px 0;
	}
	table a:hover {
		text-decoration: underline;
	}
	
	table tbody tr:hover {
		background-color:lightcyan;
	}

	table td {
		padding: 10px;
		background-color: #eee;
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
		padding: 15px 0;
		text-align: right;
		margin-right: 10px;
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
			<div>
				1-15 / <span>{{cnt}}</span>
			</div>
			<div class="table-list">
				<table class="board_list">
					<thead>
						<tr>
							<!-- <th scope="col"></th> -->
							<th scope="col">No.</th>
							<th scope="col">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item, index) in list" @click="fnView(item.cbno)">
							<!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
							<td>{{item.cbno}}</td>
							<td >{{item.ctitle}}</td>
							<td>{{item.hits}}</td>
							<td>{{item.id}}</td>
							<td>{{item.cdate}}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btns">
				<button class="btn" @click="fnAdd()">글쓰기</button>
				<button class="btn" @click="">삭제</button>
			</div>
			<div class="searchbox">
				<select>
					<option value=""> 전체 </option>
					<option value=""> 최신순 </option>
					<option value=""> 조회순 </option>
				</select>
				<label><input type="text" ></label>
				<button class="btn" @click="fnGetList">검색</button>
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
				var lastNum = (self.selectPage * 15) + 1
				var nparmap = { startNum: startNum, lastNum: lastNum };
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
				var lastNum = (pageNum * 15) + 1;
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


		}
		, created: function () {
			var self = this;
			self.fnGetList();
		}
	
	});
</script>