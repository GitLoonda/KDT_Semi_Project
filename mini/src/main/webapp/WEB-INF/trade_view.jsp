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
				border-bottom: 1px solid black;
				background-image: url("../img/share/no-image01.gif") ;
				background-size: 100% 450px;
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
				min-height: 150px;
				font-size: 15pt;
				resize: none;
				border: 1px solid #ccc;
			}
			.infocont p{
				margin-left: 5px;
				margin-top: 0px;
				margin-bottom: 3px;
			}
			.info2btn{
				text-align: right;
				margin-top: 10px;
			}

			#Tviewbox2{
				padding: 0px 30px;
				margin-bottom: 50px;
			}
			#Tviewbox2 hr{
				border: 2px solid black;
			}
			.shbox{
				border: 1px solid #ccc;
				margin-bottom: 10px ;
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
				display: flex;
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
			.commedit{
				display: flex;
				border: 0px;
				margin-bottom: 10px;
				justify-content: center;
			}
			.infocont3{
				width: 80%;
				height: 100px;
				resize: none;
				border-right: 0px;
			}
			#Tviewbox3{
				padding: 0px 30px;
				margin-bottom: 50px;
			}
			/*에디터 설정  */
			#Tviewbox3 .quillWrapper{
				border: 1px solid black;
				background-color: white;
			}
			#Tviewbox3 .editbox{
				margin: 20px auto;
			}
			#Tviewbox3 .btnbox{
				margin: 20px auto;
				text-align: center;
			}
			#Tviewbox3 .rebtndox{
				margin: 10px;
				text-align: center;
			}
			#Tviewbox3 .reviewbox{
				text-align: center;
			}
			#Tviewbox3 .infocont4{
				width: 100%;
				height: 80px;
				resize: none;
				border-right: 0px;
			}


		</style>
		<body>
			<div id="apptv">
				<!-- 게시판번호 넘겨줄때 -->
			<input type='hidden' id='tbno' name='tbno' :value='tbno' />
			<input type='hidden' id='brdflg' name='brdflg' :value='brdflg' />
			<input type='hidden' id='listid' name='listid' :value='listid' />
			<input type='hidden' id='scno' name='scno' :value='scno' />
			
				<!-- 게시글 상세 -->
				<div class="container">
					<div id="Tviewbox1" v-for="(list, index) in list">
						<div class="optionT">[{{list.kindname}}]{{list.btitle}}</div>
						<hr>
						<div class="report"><span class="recdate">{{list.tbno}} {{list.cdate}}</span><button @click="fnReportBoard(tbno)">신고</button></div>
						<div class="infobox1">
							<div class="infobox1_1">
								<img class="infoimg" :src="list.path" >
							</div>
							<div class="infobox1_2">
								<div class="infobox1_2_1">
									<template v-if="(sessionId == list.id)">
									<div>
										<template v-if="(list.kindname=='구매')">
											<label for="a1"><input id="a1" type="radio" name="a"v-model="bstatus" value="BS1">구매</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="bstatus" value="BS4" disabled>예약/거래중</label>
												<template v-if="list.bstatusname=='예약/거래'">
													<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5">거래완료</label>
												</template>
												<template v-if="list.bstatusname!='예약/거래'">
													<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5" disabled>거래완료</label>
												</template>
										</template>
										<template v-else-if="(list.kindname=='판매')">
											<label for="a2"><input id="a2" type="radio" name="a"v-model="bstatus" value="BS2">판매</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="bstatus" value="BS4"disabled>예약/거래중</label>
											<template v-if="list.bstatusname=='예약/거래'">
												<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5">거래완료</label>
											</template>
											<template v-if="list.bstatusname!='예약/거래'">
												<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5" disabled>거래완료</label>
											</template>
										</template>
										<template v-else-if="(list.kindname=='의뢰')">
											<label for="a3"><input id="a3" type="radio" name="a"v-model="bstatus" value="BS3">의뢰요청</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="bstatus" value="BS4"disabled>예약/거래중</label>
											<template v-if="list.bstatusname=='예약/거래'">
												<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5">거래완료</label>
											</template>
											<template v-if="list.bstatusname!='예약/거래'">
												<label for="a5"><input id="a5" type="radio" name="a"v-model="bstatus" value="BS5" disabled>거래완료</label>
											</template>
										</template>
										<template v-else>
										</template>
										<button @click="bstbtn()">적용</button>
									</div>
									</template>
									<template>
										<div></div>
									</template>

									<div>[{{list.bstatusname}}]{{list.btitle}}</div>
									<div>가격 : {{list.bprice}}</div>
									<div>판매자 정보 :{{list.nick}} | {{list.email}} | {{list.phone}}</div>
									<div>제품 상태 : {{list.bprodname}}</div>
									<div>거래 방법 : {{list.bpurname}}</div>
									<div>조회 수 : {{list.hits}} 찜: {{jimsum}} 판매자 평점 : {{usersum}}</div>
									<div>거래 지역 : {{list.local1name}} {{list.local2name}} {{list.local3name}}</div>
								</div>
								<div class="infobox1_2_2">
									<template v-if="(jimst>=1)">
										<button @click="jmbtnout()">찜해제</button>
									</template>
									<template v-else>
										<button @click="jmbtnin()">찜</button>
									</template>

									<template v-if="(list.bstatusname=='구매' || list.bstatusname=='판매' || list.bstatusname=='의뢰요청') && listid==sessionId">
										<button @click="tradeset(list.tbno)">거래하기</button>
									</template>
									<!-- <template v-else-if="(list.bstatusname=='구매' || list.bstatusname=='판매') && listid!=sessionId">
										<button @click="tradeset(list.tbno)">거래요청</button>
									</template> -->
									<template v-else-if="list.bstatusname=='예약/거래'">
										<template v-if="listid==sessionId">
											<button @click="tradeset(list.tbno)">예약/거래중</button>
											<div>{{nickname}}({{list.trade}})님과 거래중 입니다.</div>
										</template>
										<template v-else>
											<button @click="tradeset(list.tbno)" disabled>예약/거래중</button>
										</template>
									</template>
									<template v-else-if="list.bstatusname=='완료'">
										<div>{{nickname}}({{list.trade}})님과 거래 완료</div>
									</template>
								</div>
							</div>
						</div>
						<div class="infobox2">
							<div class="infocont" v-html="cont"></div>
							<template v-if="(sessionId == list.id)">
								<div class="info2btn" >
									<button @click="fntoEdit(tbno)">수정</button>
									<button @click="fnTbrdDel()">삭제</button>
								</div>
							</template>
							<template>
								<template v-if="(sessionId == list.id)">
									<div class="info2btn" >
									</div>
								</template>
							</template>
						</div>
					</div>
					<!-- 염관상품,댓글 -->
					<div id="Tviewbox2" v-if="bstatus!='BS5'" >
						<div>연관 상품</div>
						<div class="shbox">
							<div class="itembox">
								
							</div>
						</div>
						<div class="commbox">
							댓글({{commcnt}}개) <label for="comms"> <input id="comms" type="checkbox" v-model="comms">비밀 댓글</label>
							<div class="commin">
								<textarea class="infocont2" name="" id="" cols="30" rows="10" v-model="commcont"></textarea>
								<button class="commbtn" @click="fncommIn()">등록</button>
							</div>
						</div>
						<div  v-for="(commlist, index) in commlist">
							<!-- 댓글입력창 전환 설정 같지 않을때 기본표시 -->
							<template v-if="comminfo.cno!=commlist.cno">
								<div class="commbox2">
									<div class="commbox2_1">
										<div><img class="pimg" src="img/board/160628_7.png"></div>
										<div class="commbox2_1_1">
											<div class="commid">{{commlist.nick}}</div>
											
											<template v-if="(commlist.delYn=='Y')">
												<div>삭제된 글입니다.</div>
											</template>
											<template v-else-if="(commlist.showYn=='Y' || commlist.id==sessionId || listid==sessionId)">
												<div><input :id="('c'+index)" :value="commlist.cno" hidden> {{commlist.conte}}</div>
											</template>
											<template v-else>
												<div>비밀 댓글입니다.</div>
											</template>
										</div>
								</div>
								<div class="commbox2_2">
									<div>
										<template v-if="commlist.delYn=='N'">
											<span id="combtn" class="coma">
												<button @click="combtn(commlist.cno)">답글</button> 
											</span>
											<button class="coma" @click="cbanbtn(('c'+commlist.cno))">신고</button>
											<template v-if="(commlist.id==sessionId || listid==sessionId)">
												<button class="coma" @click="fncedit(commlist)">수정</button>
												<button class="coma" @click="fncDel(commlist.cno)">삭제</button>
											</template>
										</template>
									</div>
									<div>
										<div class="coma">{{commlist.cdate}}</div>
										<template v-if="commlist.udate!=''">
											<div class="coma">{{commlist.udate}}</div>
										</template>
									</div>
								</div>
							</template>
							<template v-if="comminfo.cno==commlist.cno">
								<div class="commedit">
									<textarea class="infocont4" name="" id="" cols="30" rows="10" v-model="editcommcont"></textarea>
									<button class="commbtn" @click="fncommedit()">수정</button>
								</div>
							</template>
							</div>
						</div>	
						<!-- 완료시 표시 페이지 -->
						<div id="Tviewbox3" v-else-if="bstatus=='BS5'">
							<!-- 리뷰갯수가 1이상일때 -->
							<template v-if="list[0].trade!=sessionId || recnt>=1">
								<div class="reviewbox">
								<div>거래후기</div>
								<div class="infocont2" v-html="vwreconte"></div>
								</div>
							</template>

							<tamplate v-else-if="list[0].trade==sessionId">
								<div>
									<vue-editor v-model="reconte">

									</vue-editor> <!-- 2. 화면 에디터 추가 -->
									<div class="rebtndox"><button @click="fnreP(tbno)">리뷰등록</button> </div>
									
								</div>
							</tamplate>

						</div>
					</div>
				</div>
			</div>
		</body>
</html>
<script type="text/javascript">
	console.log(Vue);
	Vue.use(Vue2Editor);
	const VueEditor = Vue2Editor.VueEditor;

	var apptv = new Vue({ 
		el: '#apptv',
		data: {
			tbno : "${trlist.tbno}",
			brdflg:"",
			scno:"",
			// 세션
			sessionId:"${sessionId}",
			sessionName:"${sessionName}",
			sessionNick:"${sessionNick}",
			sessionUstatus:"${sessionUstatus}",

			file1:"",
			cont:"",
			bstatus:"",


			list:[],
			listid:"",

			commlist:[],
			commcont:"",
			commcnt:0,
			comms:true,
			editcommNo:"",
			comminfo:{},
			editcommcont:"",
			nickname:"",
			
			jimst:0,
			jimsum:0,
			usersum:0,
			// 에디터
			reconte:"",
			vwreconte:"",
			recnt:0,
			relist:{}
		},
			components: {VueEditor},

			methods: {
			//게시글 상세 리스트
			fnGetList : function(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno, id:self.sessionId};
				$.ajax({
					url:"/tradeView/list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list; 
						self.jimst=data.ujimcnt;
						self.cont=data.list[0].bcont;
						self.bstatus=data.list[0].bstatus;
						self.listid=data.list[0].id;
						self.brdflg=data.list[0].brdflg;
						self.recnt=data.reCnt;
						if(data.list[0].trade==undefined){
						}else{
							self.getnickname();
						}
						if(self.recnt>=1){
							self.reviewlist();
						}
						// console.log(self.recnt);
						// console.log(self.bstatus);
						self.getgrdinfo();
					}
				}); 
			},
			getgrdinfo(){
				var self = this;
				var nparmap = {id:self.listid};
				$.ajax({
					url:"/tradeView/grdinfo.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.usersum=data.grdnum[0].grdnum;	
						self.usersum=self.usersum+self.list[0].grade;
					}
					
				}); 
			},

			getnickname(){
				var self = this;
				var nparmap = {id:self.list[0].trade};
				$.ajax({
					url:"/tradeView/ncik.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.nickname=data.nicks[0].nick;
					}
				}); 
			},
			
			
			// 거래상태변경
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
						self.fnGetList();
						// location.reload();
					}
				}); 
			},
			// 찜등록
			jmbtnin(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno,id : self.sessionId};
				if(self.sessionId==''){
					alert("로그인 정보가 없어 로그인창으로 이동합니다.");
					location.href="login.do";
					return;
				}
				$.ajax({
					url:"/tradeView/jjimin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("찜등록 완료");
						self.fnGetList();
						self.jimsumcnt();
					}
				}); 
			},
			// 찜삭제
			jmbtnout(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno,id : self.sessionId};
				$.ajax({
					url:"/tradeView/jjimout.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("찜해제 완료");
						self.fnGetList();
						self.jimsumcnt();
					}
				}); 
			},
			// 찜수
			jimsumcnt(){
				var self = this;
         	  	var nparmap = {tbno : self.tbno};
				$.ajax({
					url:"/tradeView/jjimcnt.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
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
						location.href="trade.do";
					}
				}); 
			},
			//게시글 신고 팝업
			fnReportBoard : function(tbno) {
    		let popUrl = "/reportboard.do";
    		let popOption = "width = 650px, height=550px, top=200px, left=300px, scrollbars=yes";
    		window.open(popUrl,"게시글 신고",popOption);	
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
			// 글 수정
			fntoEdit(tbno){
				var self=this;
				self.pageChange("/tradeeidt.do",{tbno:tbno});
			},
			// 댓글입력
			fncommIn : function(){
				var self = this;
				if(self.sessionId==''){
					alert("로그인 정보가 없어 로그인창으로 이동합니다.");
					location.href="login.do";
					return;
				}
				if(self.commcont==''){
					alert("글내용이 없습니다.");
					return;
				}
         	  	var nparmap = {tbno : self.tbno, id:self.sessionId , conetent:self.commcont, comms:self.comms};
				$.ajax({
					url:"/tradeView/commin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("저장!");
						self.fncommlist();
						self.commcont="";
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
						console.log(self.commlist);
					}
				}); 
			},
			// 댓글 수정
			fncedit(commlist){
				var self = this;
				self.editcommNo = commlist.cno;
				self.comminfo = commlist;
				console.log(self.editcommNo);
				console.log(self.comminfo);
			}
			// 댓글 수정
			,fncommedit(){
				var self= this;
				if(self.editcommcont==''){
					alert("글내용이 없습니다.");
					return;
				}
         	  	var nparmap = {cno : self.editcommNo, id:self.sessionId , conetent:self.editcommcont };
				$.ajax({
					url:"/tradeView/commedit.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("저장!");
						self.comminfo={};
						self.editcommNo="";
						self.editcommcont="";
						self.fncommlist();
					}
				}); 
				// 댓글 삭제
			},fncDel(cno){
				var self= this;
         	  	var nparmap = {cno : cno};
				$.ajax({
					url:"/tradeView/commDel.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("삭제!");
						self.fncommlist();
					}
				}); 
			},
			cbanbtn(cno){
				var self=this;
				self.scno = cno;

				let popUrl = "/contban.do";
    			let popOption = "width = 650px, height=550px, top=200px, left=300px, scrollbars=yes";
				window.open(popUrl,"거래 설정",popOption);
			},

			// 거래대상 선정
			tradeset(tbno){
				let popUrl = "/tradeset.do";
    			let popOption = "width = 650px, height=550px, top=200px, left=300px, scrollbars=yes";
				window.open(popUrl,"거래 설정",popOption);
			},
			fnreP(tbno){
				let popUrl = "/usergrade.do";
				let popOption = "width = 650px, height=550px, top=200px, left=300px, scrollbars=yes";
				window.open(popUrl,"거래 설정",popOption);
			},
			// 리뷰 글쓰기
			fnrebtn(tbno){
				var self = this;
				if(self.reconte==''){
					alert("글내용이 없습니다.");
					return;
				}
         	  	var nparmap = {tbno : self.tbno, id:self.sessionId , reconte:self.reconte};
				$.ajax({
					url:"/tradeView/reviewin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.fnGetList();
						alert("저장!");
						
					}
				}); 
			},
			reviewlist(){
				var self = this;
				var nparmap = {tbno : self.tbno};
				$.ajax({
					url:"/tradeView/reviewlist.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						// console.log(data);
						self.relist=data.reviewlist;
						// console.log(self.relist);
						self.vwreconte=self.relist[0].reconte;
					}
				}); 
			},
			
			
		},
		 created: function () {
			var self = this;
			self.fnGetList();
			self.fncommlist();
			self.jimsumcnt();
			

		}
	});

	
</script>