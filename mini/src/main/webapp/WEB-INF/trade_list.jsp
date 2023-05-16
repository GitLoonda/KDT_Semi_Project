<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
		<head>
			<jsp:include page="/defult/def.jsp"></jsp:include>
			<link rel="stylesheet" href="css/borad.css">
			<meta charset="UTF-8">
			<title>trade.do</title>
		</head>
		<style>
			/* *{
				border: 1px dashed red;
			} */
	
		</style>
		<body>
			<div id="app">
				<div class="container">
					<div id="sellbox1">
						<div class="cateF">
							카테고리 필터
						</div>
						<div class="indexbox1">
							<select class="indexL">
								<option value="DESC">최신순</option>
								<option value="">조회순</option>
								<option value="">판매자 평점</option>
							</select>
						</div>
						<div>
							1-15 / <span>{{listcnt}}</span>
						</div>
						<div class="listbox">
							<!-- 거래글 리스트 불러오기/필터없음./리스트 -->
							<div class="itembox" v-for="(item, index) in list" @click="fnView(item.tbno)">
								<!-- 이미지 src 참고 -->
								<img id="tmp" class="imgbox" :src="item.path">
								<div class="itemtxt">[{{item.kindname}}] <span>({{item.bstatusname}})</span></div>
								<div class="itemtxt">{{item.btitle}}</div>
								<div class="itemtxt">{{item.bprice}} 원</div>
								<div class="itemtxt">
									<span>댓글</span>
									<span>0</span>
									<span> 찜</span>
									<span>{{item.likes}}</span>
								</div>
							</div>
						</div>
						<!-- 페이징 추가 3 -->
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
			list : [],
			listcnt:0,
			/* 페이징 추가 5 */
			selectPage: 1,
			pageCount: 1,
			
		}   
		, methods: {
			// 리스트 불러오기,페이징6
			fnGetList : function(){
				var self = this;
				/* selectPage 시작점에서 ~까지 가져올지  */
				var startNum = ((self.selectPage-1) * 15);
    			var lastNum = 15;
         	  	var nparmap = {startNum : startNum, lastNum : lastNum};
				   	console.log(startNum);
					console.log(lastNum);
				$.ajax({
					url:"/trade/list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);                                      
						self.list = data.list;
						self.listcnt = data.cnt;
						self.pageCount = Math.ceil(self.listcnt / 15);
					}
				}); 
			},
			 /* 페이징 추가 7 */
			fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 15);
			var lastNum = 15;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			console.log(startNum);
			console.log(lastNum);
			$.ajax({
				url : "/trade/list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.listcnt = data.cnt;
					self.pageCount = Math.ceil(self.listcnt / 15);
				}
			});
		},
		// 페이지 변경
		pageChange : function(url, param) {
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
    	},
		fnView(tbno){
			var self = this;
			self.pageChange("./tradeview.do",{tbno:tbno});
			console.log(tbno);
		}



		
		}
		, created: function () {
			var self = this;
			self.fnGetList();
			
		}
	});
</script>