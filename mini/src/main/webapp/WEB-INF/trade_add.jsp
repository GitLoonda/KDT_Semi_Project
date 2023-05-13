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
			#Taddbox1{
				padding: 0px 30px;
			}
			#Taddbox1 hr{
				border: 2px solid black;
			}
			#Taddbox1 .optionT{
				font-size: 15pt;
				margin: 10px 2px;
				font-weight: bold;
			}
			#Taddbox1 .Taddbox1_1{
				margin: 0px;
				margin-bottom: 20px;
			}
			#Taddbox1 .titlebox{
				width: 80%;
				font-size: 12pt;
				height: 30px;
			}
			#Taddbox1 .sellpirbox{
				width: 200px;
				height: 30px;
				
			}
			#Taddbox1 .sellpirbox input::-webkit-outer-spin-button,input::-webkit-inner-spin-button{
				-webkit-appearance: none;
			}
			#Taddbox1 .catebox1{
				width: 150px;
				font-size: 12pt;
				height: 30px;
			}
			#Taddbox1 .scatebox{
				width: 80px;
				height: 30px;
				font-size: 12pt;
			}
			#Taddbox1 .sumbox{
				display: flex;
				margin: 0px 0px;
				width: 100%;
				
				}
			#Taddbox1 .sumbox1{
				
				width: 49%;
				padding-left: 5px;	
			}
			#Taddbox1 .admintext{
				width: 100%;
				background-color: aliceblue;
				border: 1px solid black;
				resize: none;

			}
			/*에디터 설정  */
			#Taddbox1 .quillWrapper{
				border: 1px solid black;
				background-color: white;
			}
			#Taddbox1 .editbox{
				margin: 20px auto;
			}
			#Taddbox1 .btnbox{
				margin: 20px auto;
				text-align: center;
			}
	  
	  
	  
		</style>
		<body>
			<div id="app">
				<!-- 거래 등록 페이지 -->
				<div class="container">
					<div id="Taddbox1">
						<div class="optionT">게시판 글쓰기</div>
						<hr>
						<div class="Taddbox1_1">
							<select class="catebox1" id="brdfig" v-model="inlist.brdflg"
								@click="setkind()">
								<option value="0" disabled>게시판선택</option>
								<option v-for="(brdf, index) in listbrdf" :value="brdf.cnum">{{brdf.cinfo}}</option>
							</select>

							<select class="catebox1" id="kindfig" v-model="inlist.kind"
								@click="bstatusSet()">
								<option value="0" disabled>말머리</option>
								<option v-for="(kindf, index) in listkindf" :value="kindf.cnum">{{kindf.cinfo}}</option>
							</select>
							<div class="optionT">제목</div>
							<input class="titlebox" type="text" v-model="inlist.btitle">
						</div>

						
						<!-- 게시판 값이 없거나 거래게시판  -->
						<template v-if="inlist.brdflg == '0' || inlist.brdflg == 'BF1'">
							<!-- 구매 -->
							<template v-if="inlist.kind == '0' || inlist.kind == 'KI1'">
							<div class="Taddbox1_1">
								<div class="optionT"> 구매가격</div>
								<div><input type="number" class="sellpirbox" v-model="inlist.bprice"> 원</div>
								<br>
	
								<div class="optionT">상품 카테고리</div>
								<select id="cate1" class="scatebox" v-model="inlist.cate1"
									@click="setCate2()">
									<option value="0" disabled>1차</option>
									<option v-for="(cate1, index) in listcate1" :value="cate1.cnum">{{cate1.cinfo}}</option>
								</select>
	
								<select id="cate2" class="scatebox" v-model="inlist.cate2">
									<option value="0" disabled>2차</option>
									<template v-for="(cate2, index) in listcate2">
										<option :value="cate2.cnum">{{cate2.cinfo}}</option>
									</template>
								</select>
	
								<select class="scatebox" v-model="inlist.cate3">
									<option value="0" disabled>3차</option>
									<option v-for="(cate3, index) in listcate3" :value="cate3.cnum">{{cate3.cinfo}}</option>
								</select>
							</div>
							<div id="optionbox1" class="sumbox">
								<div class="sumbox1">
									<div class="optionT">상품 상태</div>
									<div>
										<label for="a1"><input id="a1" type="radio" name="a"v-model="inlist.bprod" value="BP1">미개봉</label>
										<label for="a2"><input id="a2" type="radio" name="a"v-model="inlist.bprod" value="BP2">거의 새것</label>
										<label for="a3"><input id="a3" type="radio" name="a"v-model="inlist.bprod" value="BP3">상</label>
										<label for="a4"><input id="a4" type="radio" name="a"v-model="inlist.bprod" value="BP4">중</label>
										<label for="a5"><input id="a5" type="radio" name="a"v-model="inlist.bprod" value="BP5">하</label>
									</div>
									<br>
									<div class="optionT">상품 구분</div>
									<div>
										<label for="b1"><input id="b1" type="radio" name="b"v-model="inlist.bpros" value="PR1">정품</label>
										<label for="b2"><input id="b2" type="radio" name="b"v-model="inlist.bpros" value="PR2">가품</label>
										<label for="b3"><input id="b3" type="radio" name="b"v-model="inlist.bpros" value="PR3">개인제작</label>
									</div>
									<br>
									<div class="optionT">거래 형식</div>
									<div>
										<label for="c1"><input id="c1" type="radio" name="c"v-model="inlist.bpur" value="BU1">직거래</label>
										<label for="c2"><input id="c2" type="radio" name="c"v-model="inlist.bpur" value="BU2">택배</label>
										<label for="c3"><input id="c3" type="radio" name="c"v-model="inlist.bpur" value="BU3">온라인</label>
									</div>
								</div>

								<div class="sumbox1">
									<div class="optionT">박스 상태</div>
									<div>
										<label for="d1"><input id="d1" type="radio" name="d"v-model="inlist.bbox" value="BB1">있음</label>
										<label for="d2"><input id="d2" type="radio" name="d"v-model="inlist.bbox" value="BB2">없음</label>
									</div>
									<br>
									<div class="optionT">구매 영수증</div>
									<div>
										<label for="e1"><input id="e1" type="radio" name="e"v-model="inlist.brcpt" value="BC1">있음</label>
										<label for="e2"><input id="e2" type="radio" name="e"v-model="inlist.brcpt" value="BC2">없음</label>
									</div>
									<br>

									
									<div class="optionT">거래 지역</div>
									<select class="scatebox" v-model="inlist.local1" @click="setlocal2()">
										<option value="0" disabled>시/도</option>
										<option v-for="(local1, index) in listlocal1" :value="local1.si">{{local1.si}}</option>
									</select>
									<select class="scatebox" v-model="inlist.local2" @click="setlocal3()">
										<option value="0">시/구/군</option>
										<option v-for="(local2, index) in listlocal2" :value="local2.gu">{{local2.gu}}</option>
									</select>
									<select class="scatebox" v-model="inlist.local3">
										<option value="0">동/면/읍</option>
										<option v-for="(local3, index) in listlocal3" :value="local3.dong">{{local3.dong}}</option>
									</select>
								</div>
							</div>
							</template>

							<!-- 판매 -->
							<template v-if="inlist.kind == 'KI2'">
								<div class="Taddbox1_1">
									<div class="optionT"> 판매가격</div>
									<div><input type="number" class="sellpirbox" v-model="inlist.bprice"> 원</div>
									<br>
		
									<div class="optionT">상품 카테고리</div>
									<select id="cate1" class="scatebox" v-model="inlist.cate1"
										@click="setCate2()">
										<option value="0" disabled>1차</option>
										<option v-for="(cate1, index) in listcate1" :value="cate1.cnum">{{cate1.cinfo}}</option>
									</select>
		
									<select id="cate2" class="scatebox" v-model="inlist.cate2">
										<option value="0" disabled>2차</option>
										<template v-for="(cate2, index) in listcate2">
											<option :value="cate2.cnum">{{cate2.cinfo}}</option>
										</template>
									</select>
		
									<select class="scatebox" v-model="inlist.cate3">
										<option value="0" disabled>3차</option>
										<option v-for="(cate3, index) in listcate3" :value="cate3.cnum">{{cate3.cinfo}}</option>
									</select>
								</div>
								<div id="optionbox1" class="sumbox">
									<div class="sumbox1">
										<div class="optionT">상품 상태</div>
										<div>
											<label for="a1"><input id="a1" type="radio" name="a"v-model="inlist.bprod" value="BP1">미개봉</label>
											<label for="a2"><input id="a2" type="radio" name="a"v-model="inlist.bprod" value="BP2">거의 새것</label>
											<label for="a3"><input id="a3" type="radio" name="a"v-model="inlist.bprod" value="BP3">상</label>
											<label for="a4"><input id="a4" type="radio" name="a"v-model="inlist.bprod" value="BP4">중</label>
											<label for="a5"><input id="a5" type="radio" name="a"v-model="inlist.bprod" value="BP5">하</label>
										</div>
										<br>
										<div class="optionT">상품 구분</div>
										<div>
											<label for="b1"><input id="b1" type="radio" name="b"v-model="inlist.bpros" value="PR1">정품</label>
											<label for="b2"><input id="b2" type="radio" name="b"v-model="inlist.bpros" value="PR2">가품</label>
											<label for="b3"><input id="b3" type="radio" name="b"v-model="inlist.bpros" value="PR3">개인제작</label>
										</div>
										<br>
										<div class="optionT">거래 형식</div>
										<div>
											<label for="c1"><input id="c1" type="radio" name="c"v-model="inlist.bpur" value="BU1">직거래</label>
											<label for="c2"><input id="c2" type="radio" name="c"v-model="inlist.bpur" value="BU2">택배</label>
											<label for="c3"><input id="c3" type="radio" name="c"v-model="inlist.bpur" value="BU3">온라인</label>
										</div>
									</div>
	
									<div class="sumbox1">
										<div class="optionT">박스 상태</div>
										<div>
											<label for="d1"><input id="d1" type="radio" name="d"v-model="inlist.bbox" value="BB1">있음</label>
											<label for="d2"><input id="d2" type="radio" name="d"v-model="inlist.bbox" value="BB2">없음</label>
										</div>
										<br>
										<div class="optionT">구매 영수증</div>
										<div>
											<label for="e1"><input id="e1" type="radio" name="e"v-model="inlist.brcpt" value="BC1">있음</label>
											<label for="e2"><input id="e2" type="radio" name="e"v-model="inlist.brcpt" value="BC2">없음</label>
										</div>
										<br>
	
										
										<div class="optionT">거래 지역</div>
										<select class="scatebox" v-model="inlist.local1" @click="setlocal2()">
											<option value="0" disabled>시/도</option>
											<option v-for="(local1, index) in listlocal1" :value="local1.si">{{local1.si}}</option>
										</select>
										<select class="scatebox" v-model="inlist.local2" @click="setlocal3()">
											<option value="0">시/구/군</option>
											<option v-for="(local2, index) in listlocal2" :value="local2.gu">{{local2.gu}}</option>
										</select>
										<select class="scatebox" v-model="inlist.local3">
											<option value="0">동/면/읍</option>
											<option v-for="(local3, index) in listlocal3" :value="local3.dong">{{local3.dong}}</option>
										</select>
									</div>
								</div>
								</template>
						</template>
						<!-- 의뢰게시판  -->
						<template v-else-if="inlist.brdflg == 'BF2'">
							<div class="Taddbox1_1">
								<div class="optionT"> 의뢰 예상가격</div>
								<div><input type="number" class="sellpirbox" v-model="inlist.bprice"> 원</div>
								<br>
	
								<div class="optionT">상품 카테고리</div>
								<select id="cate1" class="scatebox" v-model="inlist.cate1"
									@click="setCate2()">
									<option value="0" disabled>1차</option>
									<option v-for="(cate1, index) in listcate1" :value="cate1.cnum">{{cate1.cinfo}}</option>
								</select>
	
								<select id="cate2" class="scatebox" v-model="inlist.cate2">
									<option value="0" disabled>2차</option>
									<template v-for="(cate2, index) in listcate2">
										<option :value="cate2.cnum">{{cate2.cinfo}}</option>
									</template>
								</select>
	
								<select class="scatebox" v-model="inlist.cate3">
									<option value="0" disabled>3차</option>
									<option v-for="(cate3, index) in listcate3" :value="cate3.cnum">{{cate3.cinfo}}</option>
								</select>
							</div>
							<div id="optionbox1" class="sumbox">
								<div class="sumbox1">
									<div class="optionT">의뢰 종류</div>
									<div>
										<label for="f1"><input id="f1" type="radio" name="a"v-model="inlist.bcms" value="BM1">조립</label>
										<label for="f2"><input id="f2" type="radio" name="a"v-model="inlist.bcms" value="BM2">도색</label>
										<label for="f3"><input id="f3" type="radio" name="a"v-model="inlist.bcms" value="BM3">수리</label>
										<label for="f4"><input id="f4" type="radio" name="a"v-model="inlist.bcms" value="BM4">커미션</label>

									</div>
									<br>
									<div class="optionT">거래 형식</div>
									<div>
										<label for="c1"><input id="c1" type="radio" name="c"v-model="inlist.bpur" value="BU1">직거래</label>
										<label for="c2"><input id="c2" type="radio" name="c"v-model="inlist.bpur" value="BU2">택배</label>
										<label for="c3"><input id="c3" type="radio" name="c"v-model="inlist.bpur" value="BU3">온라인</label>
									</div>
									<br>
								</div>
							
								<div class="sumbox1">
									<div class="optionT">거래 지역</div>
									<select class="scatebox" v-model="inlist.local1" @click="setlocal2()">
										<option value="0" disabled>시/도</option>
										<option v-for="(local1, index) in listlocal1" :value="local1.si">{{local1.si}}</option>
									</select>
									<select class="scatebox" v-model="inlist.local2" @click="setlocal3()">
										<option value="0">시/구/군</option>
										<option v-for="(local2, index) in listlocal2" :value="local2.gu">{{local2.gu}}</option>
									</select>
									<select class="scatebox" v-model="inlist.local3">
										<option value="0">동/면/읍</option>
										<option v-for="(local3, index) in listlocal3" :value="local3.dong">{{local3.dong}}</option>
									</select>
								</div>
							</div>
					</template>
					<!-- 홍보게시판 -->
					<template v-else-if="inlist.brdflg == 'BF3'">
						<div class="Taddbox1_1">
							<div class="optionT"> 판매가격</div>
							<div><input type="number" class="sellpirbox" v-model="inlist.bprice"> 원</div>
							<br>

							<div class="optionT">상품 카테고리</div>
							<select id="cate1" class="scatebox" v-model="inlist.cate1"
								@click="setCate2()">
								<option value="0" disabled>1차</option>
								<option v-for="(cate1, index) in listcate1" :value="cate1.cnum">{{cate1.cinfo}}</option>
							</select>

							<select id="cate2" class="scatebox" v-model="inlist.cate2">
								<option value="0" disabled>2차</option>
								<template v-for="(cate2, index) in listcate2">
									<option :value="cate2.cnum">{{cate2.cinfo}}</option>
								</template>
							</select>

							<select class="scatebox" v-model="inlist.cate3">
								<option value="0" disabled>3차</option>
								<option v-for="(cate3, index) in listcate3" :value="cate3.cnum">{{cate3.cinfo}}</option>
							</select>
						</div>
						<div id="optionbox1" class="sumbox">
							<div class="sumbox1">
								<div class="optionT">의뢰 종류</div>
								<div>
									<label for="f1"><input id="f1" type="radio" name="a"v-model="inlist.bcms" value="BM1">조립</label>
									<label for="f2"><input id="f2" type="radio" name="a"v-model="inlist.bcms" value="BM2">도색</label>
									<label for="f3"><input id="f3" type="radio" name="a"v-model="inlist.bcms" value="BM3">수리</label>
									<label for="f4"><input id="f4" type="radio" name="a"v-model="inlist.bcms" value="BM4">커미션</label>

								</div>
								<br>
								<div class="optionT">거래 형식</div>
								<div>
									<label for="c1"><input id="c1" type="radio" name="c"v-model="inlist.bpur" value="BU1">직거래</label>
									<label for="c2"><input id="c2" type="radio" name="c"v-model="inlist.bpur" value="BU2">택배</label>
									<label for="c3"><input id="c3" type="radio" name="c"v-model="inlist.bpur" value="BU3">온라인</label>
								</div>
								<br>
							</div>
						
							<div class="sumbox1">
								<div class="optionT">거래 지역</div>
								<select class="scatebox" v-model="inlist.local1" @click="setlocal2()">
									<option value="0" disabled>시/도</option>
									<option v-for="(local1, index) in listlocal1" :value="local1.si">{{local1.si}}</option>
								</select>
								<select class="scatebox" v-model="inlist.local2" @click="setlocal3()">
									<option value="0">시/구/군</option>
									<option v-for="(local2, index) in listlocal2" :value="local2.gu">{{local2.gu}}</option>
								</select>
								<select class="scatebox" v-model="inlist.local3">
									<option value="0">동/면/읍</option>
									<option v-for="(local3, index) in listlocal3" :value="local3.dong">{{local3.dong}}</option>
								</select>
							</div>
						</div>
				</template>

					<br>
					<br>
					<div class="Taddbox1_1">
						<div class="optionT">글쓴이 정보</div>
						<div v-for="(userinfo, index) in userinfo">
							<span>이메일 : {{userinfo.email}}</span>
							<span> | </span>
							<span>연락처 : {{userinfo.phone}}</span>
						</div>
					</div>

					<div class="editbox">
						<div class="optionT">첨부파일 <input type="file" id="file1" name="file1"> 
							<label for="repck"><input id="repck" type="checkbox" v-model="repck">썸네일</label>

						</div>
						<br>
						<div>
							<vue-editor v-model="inlist.bcont"></vue-editor> <!-- 2. 화면 에디터 추가 -->
						</div>

						<div class="btnbox">
							<button class="btn" @click="fnAddTrade()">등록</button>
							<button class="btn">목록</button>
						</div>
						<div>{{inlist}}</div>
						<div>{{tbno}},{{imgpath}},{{repck}}</div>
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