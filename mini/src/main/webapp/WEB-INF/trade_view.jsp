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
			<title>게시글 등록</title>
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
				height: 200px;
				resize: none;	
				margin-bottom: 30px;
			}
			.infocont{
				width: 100%;
				height: 100%;
				font-size: 15pt;
				resize: none;
			}
			.info2btn{
				text-align: right;
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
			.commbox2_2{
				margin-right: 20px;
			}
			.pimg{
				width: 50px;
				width: 50px;
				border-radius: 100%;
				border: 1px solid black;
			}
			.coma{
				margin: 0px 3px ;
			}

		</style>
		<body>
			<div id="app">
				<!-- 게시글 상세 -->
				<div class="container">
					<div id="Tviewbox1">
						<div class="optionT">게시글 제목</div>
						<hr>
						<div class="report"><button>신고</button></div>
						<div class="infobox1">
							<div class="infobox1_1">
								<img class="infoimg" src="img/board/160628_7.png" >
							</div>
							<div class="infobox1_2">
								<div class="infobox1_2_1">
									<div>게시글 제목</div>
									<div>거래 상태 : </div>
									<div>가격 : </div>
									<div>판매자 정보 : </div>
									<div>제품 상태 : </div>
									<div>거래 방법 : </div>
									<div>조회 수 : 찜: 판매자 평점 : </div>
									<div>거래 지연 : </div>
								</div>
								<div class="infobox1_2_2">
									<button>찜</button>
									<button>구매</button>
								</div>
							</div>
						</div>
						<div class="infobox2">
							<textarea class="infocont" name="" id="" cols="30" rows="10" disabled>게시글 목록</textarea>
							<div class="info2btn"><button>수정</button> <button>삭제</button> </div>
						</div>
						<div>연관 상품</div>
						<div>
							<div class="itembox">
								
							</div>
						</div>
						<div class="commbox">
							댓글(00개)
							<div class="commpath"> 첨부파일 이름 <button>첨부</button></div>
							<div class="commimg" > <img class="cimg" src=""> 이미지 미리보기</div>
							<div class="commin">
								<textarea class="infocont2" name="" id="" cols="30" rows="10"></textarea>
								<button class="commbtn">등록</button>
							</div>
						</div>
						<div class="commbox2">
							<div class="commbox2_1">
									<div><img class="pimg" src="img/board/160628_7.png"></div>
									<div>닉네임 : 으ㅏㅏㅏㅏㅏㅏㅏㅏ</div>
							</div>
							<div class="commbox2_2">
								<span class="coma">신고</span>
								<span>수정</span>
								<span>삭제</span>
								<span>작성시간</span>
							</div>
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
	var app = new Vue({ 
		el: '#app',
		data: {
			list : [],
			title : "",
			content : "",
			// 사용자 정보
			userinfo:{},
			// 세션
			sessionid:"test01",

			// 게시판 리스트,말머리태그 설정
			listbrdf:{},
			listkindf:{},
			// 카테고리 리스트
			listcate1:{},
			listcate2:{},
			listcate3:{},
			// 지역
			listlocal1:{},
			listlocal2:{},
			listlocal3:{},
			// INSERT 값
			inlist:{
				id:"test10",
				bprice:0,
				btitle:"",
				bcont:" ",
				brdflg:"0",
				kind:"0",
				cate1:"0",
				cate2:"0",
				cate3:"0",
				bprod:"",
				bpros:"",
				bstatus:"",
				bpur:"",
				bbox:"",
				brcpt:"",
				bcms:"",
				local1:"0",
				local2:"0",
				local3:"0"
			},
			tbno:0,
			imgpath:"",
			repck:false,
			
	
		},
			
		 components: {VueEditor}
		, methods: {
			// seletbox cate 등 값 불러오기
			optionlist : function(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"/trade/option.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data)
						self.listbrdf=data.listbrdf;
						self.listcate1=data.listcate1;
						self.listcate3=data.listcate3;
						self.listlocal1=data.listlocal1;

					}
				});
        } ,
		//게시판 선택, 말머리 리스트
		setkind : function(){
			var self = this;
				var nparmap = {pcomm1 : self.inlist.brdflg};
				$.ajax({
					url:"/trade/setkind.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.listkindf=data.listkindf;
						
					}
				});
		},
		// 말머리 선택에 따른 구매,판매,홍보,의뢰 설정
		bstatusSet : function(){
			var self = this;
			if(self.inlist.kind == 'KI1'){
				self.inlist.bstatus='BS1';
			}else if(self.inlist.kind == 'KI2'){
				self.inlist.bstatus='BS2';
			}else if(self.inlist.kind == 'KI3'){
				self.inlist.bstatus='BS3';
			}else if(self.inlist.kind == 'KI4'){
				self.inlist.bstatus='BS4';
			}
		},

		// 2카테고리 수정
			setCate2 : function(){
				var self = this;
				var nparmap = {pcomm1 : self.inlist.cate1};
				$.ajax({
					url:"/trade/optioncate2.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.listcate2=data.listcate2

					}
				});
				
			},
			// 지역2차
			setlocal2 : function(){
				var self = this;
				var nparmap = {local1name : self.inlist.local1};
				$.ajax({
					url:"/trade/optionlocal2.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.listlocal2=data.listlocal2
					}
				});
				
			},
			// 지역3차
			setlocal3 : function(){
				var self = this;
				var nparmap = {local1name : self.inlist.local1,local2name : self.inlist.local2};
				$.ajax({
					url:"/trade/optionlocal3.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.listlocal3=data.listlocal3
					}
				});
				
			},


			// 이메일 연락처 정보
			userinfolist : function(){
				var self = this;
				var nparmap = {userid : self.sessionid };
				$.ajax({
					url:"/trade/userinfo.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.userinfo=data.userinfo;

					}
				});
				
			},

			//글등록
			fnAddTrade : function(){
            var self = this;
            var nparmap = self.inlist;
            $.ajax({
                url:"/trade/insert.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
					console.log(nparmap);
					if(self.imgpath==''){
						self.imgpath="img/board/160628_7.png";
						self.AddTradeTbno();
					}else{
						self.AddTradeTbno();
					}
					
					// location.href="trade.do";
                }
            });	
        	},
			//글등록시 이미지가 있으면 
			//방금 등록한 게시글넘버 가져오기
			AddTradeTbno : function(){
				var self = this;	
				var nparmap = {};
				$.ajax({
					url:"/trade/insertTbno.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.tbno=data.tbno;
						self.AddTradeImg();
					}
				});
			},
			//이미지파일 등록
			AddTradeImg : function(){
				var self = this;	
				var nparmap = {tbno:self.tbno, repck:self.repck, imgpath:self.imgpath};
				console.log(nparmap);
				$.ajax({
					url:"/trade/insertImg.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert("저장되었습니다.");
					}
				});
			}
		
		


		, upload : function(){
			var form = new FormData();
	        form.append( "file1", $("#file1")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload.do"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}

		
		}
		, created: function () {
			var self = this;
			self.optionlist();
			self.userinfolist();
			
			
		}
	});

	
</script>