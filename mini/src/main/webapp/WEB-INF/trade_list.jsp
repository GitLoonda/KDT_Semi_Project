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
						<template v-if="(sbrdflg=='BF1')">
							<div class="cateF">
								<template v-if="(item1n!=null && item2n!=null && item3n!=null)">
									거래 게시판 > {{item1n}} > {{item2n}} > {{item3n}}  
								</template>
								<template v-else-if="(item1n!=null && item2n!=null && item3n==null)">
									거래 게시판 > {{item1n}} > {{item2n}}  
								</template>
								<template v-else-if="(item1n!=null && item2n==null && item3n==null)">
									거래 게시판 > {{item1n}} 
								</template>
								<template v-else>  
									거래 게시판 
								</template>
							</div>
						</template>
						<template v-else="(sbrdflg=='BF2')">
							<div class="cateF">
								<template v-if="(item1n!=null && item2n!=null && item3n!=null)">
									의뢰 게시판 > {{item1n}} > {{item2n}} > {{item3n}}  
								</template>
								<template v-else-if="(item1n!=null && item2n!=null && item3n==null)">
									의뢰 게시판 > {{item1n}} > {{item2n}}  
								</template>
								<template v-else-if="(item1n!=null && item2n==null && item3n==null)">
									의뢰 게시판 > {{item1n}} 
								</template>
								<template v-else>  
									의뢰 게시판 
								</template>
							</div>
						</template>

						<div class="indexbox1">
							<select class="indexL">
								<option value="DESC">최신순</option>
								<option value="">조회순</option>
								<option value="">판매자 평점</option>
							</select>
						</div>
						<div>
							1-15 / <span>{{listcnt}}</span><span><button @click="fnAddTradebtn()">글쓰기</button></span>
							
						</div>
						<div class="listbox">
							<!-- 거래글 리스트 불러오기/리스트 -->
							<div class="itembox" v-for="(item, index) in list" @click="fnView(item.tbno)">
								<!-- 이미지 src 참고 -->
								<img id="tmp" class="imgbox" :src="item.path">
								<div class="itemtxt">[{{item.kindname}}] <span>({{item.bstatusname}})</span></div>
								<div class="itemtxt">{{item.btitle}}</div>
								<div class="itemtxt">{{item.bprice}} 원</div>
								<div class="itemtxt">
									<span>조회수</span>
									<span>{{item.hits}}</span>
									<span>댓글</span>
									<span>{{item.commcnt}}</span>
									<span>찜</span>
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
		
		var tlist = new Vue({ 
		el: '#app',
		data: {
			// 리스트처리 값
			list : [],
			listcnt:0,
			jimsumcnt:[],

			//세션
			sbrdflg:"${mainlist.brdflg}",
			// 세션
			sessionId:"${sessionId}",
			sessionName:"${sessionName}",
			sessionNick:"${sessionNick}",
			sessionUstatus:"${sessionUstatus}",
			
			// 페이징 관련
			item1:"",
			item2:"",
			item3:"",
			item1n:"",
			item2n:"",
			item3n:"",

			/* 페이징 추가 5 */
			selectPage: 1,
			pageCount: 1,
			
		}   
		, methods: {
			// 리스트 불러오기,페이징6
			fnGetTradeList : function(item1, item1n, item2, item2n, item3, item3n){
				var self = this;
				self.item1=item1;
				self.item2=item2;
				self.item3=item3;
				self.item1n=item1n;
				self.item2n=item2n;
				self.item3n=item3n;
				/* selectPage 시작점에서 ~까지 가져올지  */
				var startNum = ((self.selectPage-1) * 15);
    			var lastNum = 15;
         	  	var nparmap = {startNum : startNum, lastNum : lastNum, cate1:item1, cate2:item2, cate3:item3, sbrdflg:self.sbrdflg};
					console.log(nparmap);
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
						for(var i = 0; i < self.list.length; i++) {
	 	         			self.list[i].bprice = self.list[i].bprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	 	         		}
					}
				}); 
			},
			 /* 페이징 추가 7 */
			fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 15);
			var lastNum = 15;
			var nparmap = {startNum : startNum, lastNum : lastNum, cate1:self.item1, cate2:self.item2, cate3:self.item3, sbrdflg:self.sbrdflg};
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
					for(var i = 0; i < self.list.length; i++) {
 	         			self.list[i].bprice = self.list[i].bprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 	         		}
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
			self.pageChange("/tradeview.do",{tbno:tbno});
		}
		,fnAddTradebtn(){
			var self=this;
			console.log(self.sessionId);
			console.log(self.sbrdflg);
			if(self.sessionId==''){
				alert("로그인이 필요합니다.")
				location.href="login.do";
			}else{
				self.pageChange("/tradeadd.do",{abrdfig:self.sbrdflg});
			}
				
			
			
		}
		}
		, created: function () {
			var self = this;
			self.fnGetTradeList();	
			console.log("${mainlist}");	
			console.log(self.sessionId);
			console.log(self.sessionName);
			console.log(self.sessionNick);
			console.log(self.sessionUstatus);
		}
	});
</script>