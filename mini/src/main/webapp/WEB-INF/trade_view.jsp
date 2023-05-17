<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<jsp:include page="/defult/def.jsp"></jsp:include>
			<!-- 1. vue2editor 에디터 cdn -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
			<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
			<meta charset="UTF-8">
			<title>tradeview.do</title>
		</head>
		<style>
			/* *{
				border: 1px dashed red;
			} */

			.container {
				width: 1080px;
				margin: 1px auto;
				/* background-color: #58ffca; */
				border: 1px solid black;
				border-radius: 5px;
				box-shadow: 0 10px 10px rgba(0,0,0,0.3), 0 20px 40px rgba(0,0,0,0.3);
				display: block;
			}	
			#Tviewbox1{
				padding: 0px 30px;
			}
			#Tviewbox1 hr{
				border: 2px solid black;
			}
			#Tviewbox1 .optionT{
				font-size: 15pt;
				margin: 10px 2px;
				font-weight: bold;
			}
			.report{
				text-align: right;
				margin-bottom: 10px;
			}
			.recdate{
				margin-right: 5px;
			}
			.infobox1{
				display: flex;
				margin-bottom: 20px;
				justify-content: space-between;
			}
			.infobox1_1{
				display: block;
				width: 45%;
			}
			.infoimg{
				width: 100%;
				height: 450px;
				background-color: white;
				border: 1px solid black;
			}
			
			.infobox1_2{
				display: flex;
				width: 45%;
				flex-direction: column;
  				justify-content: space-between;
			}
			.infobox1_2_1{
				display: block;
				width: 100%;
			}
			.infobox1_2_2{
				display: block;
				width: 100%;
				text-align: center;
			}
			
			.infobox2{
				width: 100%;
				min-height: 200px;
				/* resize: none; */
				margin-bottom: 30px;
			}
			.infocont{
				width: 100%;
				height: 100%;
				font-size: 15pt;
				resize: none;
			}
			.infocont p{
				margin-left: 5px;
				margin-top: 0px;
				margin-bottom: 3px;
			}
			.info2btn{
				text-align: right;
			}

			#Tviewbox2{
				padding: 0px 30px;
			}
			#Tviewbox2 hr{
				border: 2px solid black;
			}
			.itembox{
				width: 150px;
				height: 250px;
				margin: 25px;
				border: 1px solid black;
				border-radius: 2px;
				box-shadow: 1px;
				background-color: aliceblue;
			}
			.commbox{
				background-color: azure;
				margin-bottom: 20px;
				border: 1px solid black;
			}
			.commpath{
				border-top: 1px solid black;
				border-bottom: 1px solid black;
			}
			.commimg{
				
			}
			.cimg{
				width: 250px;
				height: 200px;
				margin: 5px;
				background-color: bisque;

			}
			.commin{
				display: flex;
				border: 0px;
			}
			.infocont2{
				width: 100%;
				height: 100px;
				resize: none;
				border-right: 0px;
			}
			.commbtn{
				width: 10%;
			}
			.commbox2{
				display: flex;
				align-items: center;
   				justify-content: space-between;
				margin-bottom: 20px;
				
			}
			.commbox2_1{
				display: flex;
				text-align: center;
				flex-direction: row;
				align-items: center;
				margin-left: 20px;
			}
			.commbox2_1_1{
				display: flex;
				flex-direction: column;
				align-items: baseline;
			}
			.commbox2_2{
				margin-right: 20px;
			}
			.commid{
				font-size: 15pt;
				margin-bottom: 2px;
			}
			.pimg{
				width: 50px;
				width: 50px;
				border-radius: 100%;
				border: 1px solid black;
				margin-right: 10px;
			}
			.coma{
				margin: 0px 3px ;
			}
			.recommin1{
				display: none;
			}
			.recommin2{
				display: flex;
				justify-content: flex-end;
				
			}
			.recommcont{
				width: 80%;
				height: 50px;
				resize: none;
				
			}
			.recommbtn{
				width: 10%;
				
			}

		</style>
		<body>
			<div id="app">
				<!-- 게시글 상세 -->
				<div class="container">
					<div id="Tviewbox1" v-for="(list, index) in list">
						<div class="optionT">[{{list.kindname}}]{{list.btitle}}</div>
						<hr>
						<div class="report"><span class="recdate">{{list.cdate}}</span><button>신고</button></div>
						<div class="infobox1">
							<div class="infobox1_1">
								<img class="infoimg" :src="list.path" >
							</div>
							<div class="infobox1_2">
								<div class="infobox1_2_1">
									<div>
										<template v-if="(list.kindname=='구매')">
											<label for="a1"><input id="a1" type="radio" name="a"v-model="bstatus" value="BS1">구매</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="bstatus" value="BS4">예약/거래중</label>
											<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5">거래완료</label>
										</template>
										<template v-else-if="(list.kindname=='판매')">
											<label for="a2"><input id="a2" type="radio" name="a"v-model="bstatus" value="BS2">판매</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="bstatus" value="BS4">예약/거래중</label>
											<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5">거래완료</label>
										</template>
										<template v-else-if="(list.kindname=='의뢰')">
											<label for="a3"><input id="a3" type="radio" name="a"v-model="bstatus" value="BS3">의뢰요청</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="bstatus" value="BS4">예약/거래중</label>
											<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5">거래완료</label>
										</template>
										<template v-else>
										</template>
										<button @click="bstbtn()">적용</button>
									</div>
									<div>[{{list.bstatusname}}] / {{list.btitle}}</div>
									<div>가격 : {{list.bprice}}</div>
									<div>판매자 정보 :{{list.nick}} | {{list.email}} | {{list.phone}}</div>
									<div>제품 상태 : {{list.bprodname}}</div>
									<div>거래 방법 : {{list.bpurname}}</div>
									<div>조회 수 : {{list.hits}} 찜: {{jimsum}} 판매자 평점 : {{list.grade}}</div>
									<div>거래 지역 : {{list.local1name}} {{list.local2name}} {{list.local3name}}</div>
								</div>
								<div class="infobox1_2_2">
									<template v-if="(jimst==1)">
										<button @click="jmbtnout()">찜해제</button>
									</template>
									<template v-else>
										<button @click="jmbtnin()">찜</button>
									</template>
									<button>거래하기</button>
								</div>
							</div>
						</div>
						<div class="infobox2">
							<div class="infocont" v-html="cont"></div>
							<div class="info2btn">
								<button>수정</button>
								<button @click="fnTbrdDel()">삭제</button>
							</div>
						</div>
					</div>
					<!-- 염관상품,댓글 -->
					<div id="Tviewbox2">
						<div>연관 상품</div>
						<div>
							<div class="itembox">
								
							</div>
						</div>
						<div class="commbox">
							댓글({{commcnt}}개)
							<div class="commpath" v-model="file1"> 첨부파일 이름 <button>첨부</button></div>
							<div class="commimg" > <img class="cimg" src=""> 이미지 미리보기</div>
							<div class="commin">
								<textarea class="infocont2" name="" id="" cols="30" rows="10" v-model="commcont"></textarea>
								<button class="commbtn" @click="fncommIn()">등록</button>
							</div>
							{{tbno}},{{id}},{{commcont}}
						</div>
						<div  v-for="(commlist, index) in commlist">
							<div class="commbox2" v-if="commlist.delYn == 'N'">
								<div class="commbox2_1">
										<div><img class="pimg" src="img/board/160628_7.png"></div>
										<div class="commbox2_1_1">
											<div class="commid">{{commlist.id}}</div>
											<div>{{commlist.conte}}</div>
										</div>
								</div>
								<div class="commbox2_2">
									<span id="combtn" class="coma">
										<button @click="combtn(commlist.cno)">답글</button> 
									</span>
									<span class="coma">신고</span>
									<span class="coma">수정</span>
									<span class="coma">삭제</span>
									<span class="coma">{{commlist.cdate}}</span>
								</div>
							</div>
							<div v-else>
								삭제된 댓글
							</div>
							<!-- 답글클릭시 보임 -->
							<div :id="commlist.cno" :class="{recommin1:none,recommin2:flex}" :value="commlist.cno">
								<textarea class="recommcont" cols="30" rows="10" v-model="commcont"></textarea>
								<button class="recommbtn" @click="fnrecommin()">등록</button>
							</div>
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
			tbno : "${trlist.tbno}",
			id:"test10",
			file1:"",
			cont:"",
			none:true,
			flex:false,
			bstatus:"",


			list:[],
			commlist:[],
			commcont:"",
			commcnt:0,
			jimst:0,
			jimsum:0
		},
			methods: {
			//게시글 상세 리스트
			fnGetList : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno, id:self.id};
				$.ajax({
					url:"/tradeView/list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.list = data.list; 
						self.jimst=data.ujimcnt;
						self.cont=data.list[0].bcont;

					}
				}); 
			},
			// 댓글입력
			fncommIn : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno, id:self.id , conetent:self.commcont};
				$.ajax({
					url:"/tradeView/commin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("저장!");
						location.reload();
					}
				}); 
			},
			//댓글 리스트
			fncommlist : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno};
				$.ajax({
					url:"/tradeView/commlist.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.commcnt=data.cnt;
						self.commlist=data.commlist;
					}
				}); 
			},
			bstbtn(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno,bstatus : self.bstatus};
				$.ajax({
					url:"/tradeView/bstupdate.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("거래상태 변경 완료");
						location.reload();
					}
				}); 
			},
			jmbtnin(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno,id : self.id};
				$.ajax({
					url:"/tradeView/jjimin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("찜등록 완료");
						location.reload();
					}
				}); 
			},
			jmbtnout(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno,id : self.id};
				$.ajax({
					url:"/tradeView/jjimout.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("찜해제 완료");
						location.reload();
					}
				}); 
			},
			jimsumcnt(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno};
				$.ajax({
					url:"/tradeView/jjimcnt.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.jimsum=data.jimsum;
					}
				}); 
			},

			fnTbrdDel(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno};
				$.ajax({
					url:"/tradeView/BrdDel.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("삭제완료");
						location.reload();
					}
				}); 
			},

			combtn(cno){
				// 작업하던부위
				var self = this;
				// console.log(cno);
				// var val = document.getElementById($("#cno")).value();
				// console.log(val);
				// if(cno==document.getElementById("#cno").attr("value"))
				self.none = !self.none;
				self.flex = !self.flex;
			}
			
		},
		 created: function () {
			var self = this;
			self.fnGetList();
			self.fncommlist();
			self.jimsumcnt();
			
			
		}
	});

	
</script>