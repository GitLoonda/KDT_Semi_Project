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
				margin: 0px 0px;
				width: 100%;
				
				}
			#Taddbox1 .sumbox1{
				display: inline-block;
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
						<div class="optionT">상품글쓰기</div>
						<hr>
						<div class="Taddbox1_1">
							<select class="catebox1" id="brdfig" v-model="inlist.brdflg">
									<option value="" disabled>게시판선택</option>
									<option v-for="(brdf, index) in listbrdf" :value="brdf.cnum">{{brdf.cinfo}}</option>
							</select>

							<select class="catebox1" id="kindfig" v-model="inlist.kind">
								<option value="" disabled>말머리</option>
								<option v-for="(kindf, index) in listkindf" :value="kindf.cnum">{{kindf.cinfo}}</option>
							</select>
							<div class="optionT">제목</div>
							<input class="titlebox" type="text" v-model="inlist.btitle">
						</div>

						<div class="Taddbox1_1">
							<div class="optionT"> 판매가격</div>
							<div><input type="number" class="sellpirbox" v-model="inlist.bprice"> 원</div>
							<br>

							<div class="optionT">상품 카테고리</div>
							<select id="cate1" class="scatebox" v-model="inlist.cate1" onchange="categoryChange(this)">
								<option value="" disabled>1차</option>
								<option v-for="(cate1, index) in listcate1" :value="cate1.cnum">{{cate1.cinfo}}</option>
							</select>

							<select id="cate2" class="scatebox" v-model="inlist.cate2">
								<option value="" disabled>2차</option>
								<template v-for="(cate2, index) in listcate2">
									<option :value="cate2.cnum">{{cate2.cinfo}}</option>
								</template>
							</select>

							<select class="scatebox" v-model="inlist.cate3">
								<option value="" disabled>3차</option>
								<option v-for="(cate3, index) in listcate3" :value="cate3.cnum">{{cate3.cinfo}}</option>
							</select>
							<button> 적용</button>
						</div>

						<div class="sumbox">
							<div class="sumbox1">
								<div class="optionT">상품 상태</div>
								<div>
									<label for="a1"><input id="a1" type="radio" name="a"
											v-model="inlist.bprod" value="BP1">미개봉</label>
									<label for="a2"><input id="a2" type="radio" name="a"
											v-model="inlist.bprod" value="BP2">거의 새것</label>
									<label for="a3"><input id="a3" type="radio" name="a"
											v-model="inlist.bprod" value="BP3">상</label>
									<label for="a4"><input id="a4" type="radio" name="a"
											v-model="inlist.bprod" value="BP4">중</label>
									<label for="a5"><input id="a5" type="radio" name="a"
											v-model="inlist.bprod" value="BP5">하</label>
								</div>
								<br>
								<div class="optionT">상품 구분</div>
								<div>
									<label for="b1"><input id="b1" type="radio" name="b"
											v-model="inlist.bpros" value="PR1">정품</label>
									<label for="b2"><input id="b2" type="radio" name="b"
											v-model="inlist.bpros" value="PR2">가품</label>
									<label for="b3"><input id="b3" type="radio" name="b"
											v-model="inlist.bpros" value="PR3">개인제작</label>
								</div>
								<br>
								<div class="optionT">거래 형식</div>
								<div>
									<label for="c1"><input id="c1" type="radio" name="c"
											v-model="inlist.bpur" value="BU1">직거래</label>
									<label for="c2"><input id="c2" type="radio" name="c"
											v-model="inlist.bpur" value="BU2">택배</label>
									<label for="c3"><input id="c3" type="radio" name="c"
											v-model="inlist.bpur" value="BU3">온라인</label>
								</div>
							</div>

							<div class="sumbox1">
								<div class="optionT">박스 상태</div>
								<div>
									<label for="d1"><input id="d1" type="radio" name="d"
											v-model="inlist.bbox" value="BB1">있음</label>
									<label for="d2"><input id="d2" type="radio" name="d"
											v-model="inlist.bbox" value="BB2">없음</label>
								</div>
								<br>
								<div class="optionT">구매 영수증</div>
								<div>
									<label for="e1"><input id="e1" type="radio" name="e"
											v-model="inlist.brcpt" value="BC1">있음</label>
									<label for="e2"><input id="e2" type="radio" name="e"
											v-model="inlist.brcpt" value="BC2">없음</label>
								</div>
								<br>

								<div class="optionT">거래 지역</div>
								<select class="scatebox" v-model="inlist.local1">
									<option value="">local1</option>
								</select>
								<select class="scatebox" v-model="inlist.local2">
									<option value="">local2</option>
								</select>
								<select class="scatebox" v-model="inlist.local3">
									<option value="">local3</option>
								</select>
								<button> 적용</button>
							</div>
						</div>
						<br>
						<br>
						<div class="Taddbox1_1">
							<div class="optionT">판매자정보</div>
							<div>
								<span>이메일</span>
								<span> | </span>
								<span>연락처</span>
							</div>
						</div>
						<textarea class="admintext" name="" id="" cols="30" rows="10" disabled>asdasd</textarea>
						<br>
						<div class="editbox">
							<div class="optionT">첨부파일 <input type="file" id="file1" name="file1">
							</div>
							<br>
							<div>
								<vue-editor v-model="inlist.bcont"></vue-editor> <!-- 2. 화면 에디터 추가 -->
							</div>

							<div class="btnbox">
								<button class="btn">등록</button>
								<button class="btn">목록</button>
							</div>
							<div>{{inlist}}</div>
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

			// 카테고리 리스트
			listbrdf:{},
			listkindf:{},
			
			listcate1:{},
			listcate2:{},
			listcate3:{},

			listlocal1:{},
			listlocal2:{},
			listlocal3:{},
			// INSERT 값
			inlist:{
				id:"",
				bprice:0,
				btitle:"",
				bcont:"",
				brdflg:"",
				kind:"",
				cate1:"",
				cate2:"",
				cate3:"",
				bprod:"",
				bpros:"",
				bstatus:"",
				bpur:"",
				bbox:"",
				brcpt:"",
				local1:"",
				local2:"",
				local3:""
			},
			
	
		}   
		, components: {VueEditor}
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
					self.listkindf=data.listkindf;
					self.listcate1=data.listcate1;
					self.listcate2=data.listcate2;
					self.listcate3=data.listcate3;
					console.log(self.listcate2);
					// console.log(this.listkindf);
					// console.log(this.listcate1);
					// console.log(this.listcate2);
					// console.log(this.listcate3);

                }
            });
        } ,
			


			fnAddBbs : function(){
            var self = this;
            var nparmap = {inlist};
            console.log( self.inlist.bcont );
            /* $.ajax({
                url:"/bbs/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="bbs.do";
                }
            });  */
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
			
		}
	});
</script>