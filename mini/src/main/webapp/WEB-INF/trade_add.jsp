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
				거래 등록 페이지
				<div class="container">
					<div id="Taddbox1">
						<div class="cateF">상품글쓰기</div>
						<hr>
						<div class="Taddbox1_1">
							<select class="catebox1" name="" id="">
								<option value="">판매</option>
							</select>
							<input class="titlebox" type="text">
						</div>

						<div class="Taddbox1_1">
							<div> 판매가격</div>
							<div><input type="number" class="sellpirbox"> 원</div>
							<br>
							<div>상품 카테고리</div>
							<select class="scatebox">
								<option value="">cate1</option>
							</select>
							<select class="scatebox">
								<option value="">cate2</option>
							</select>
							<select class="scatebox">
								<option value="">cate3</option>
							</select>
							<button> 적용</button>
						</div>

						<div class="sumbox">
							<div class="sumbox1">
								<div>상품 상태</div>
								<div>
									<label for="a1"><input id="a1" type="radio" name="a">미개봉</label>
									<label for="a2"><input id="a2" type="radio" name="a">상</label>
									<label for="a3"><input id="a3" type="radio" name="a">중</label>
									<label for="a4"><input id="a4" type="radio" name="a">하</label>
								</div>
								<br>
								<div>상품 구분</div>
								<div>
									<label for="b1"><input id="b1" type="radio" name="b">정품</label>
									<label for="b2"><input id="b2" type="radio" name="b">가품</label>
									<label for="b3"><input id="b3" type="radio" name="b">개인제작</label>
								</div>
								<br>
								<div>거래 형식</div>
								<div>
									<label for="c1"><input id="c1" type="radio" name="c">직거래</label>
									<label for="c2"><input id="c2" type="radio" name="c">택배</label>
									<label for="c3"><input id="c3" type="radio" name="c">온라인</label>
								</div>
							</div>

							<div class="sumbox1">
								<div>박스 상태</div>
								<div>
									<label for="d1"><input id="d1" type="radio" name="d">있음</label>
									<label for="d2"><input id="d2" type="radio" name="d">없음</label>
								</div>
								<br>
								<div>구매 영수증</div>
								<div>
									<label for="e1"><input id="e1" type="radio" name="e">있음</label>
									<label for="e2"><input id="e2" type="radio" name="e">없음</label>
								</div>
								<br>

								<div>거래 지역</div>
								<select class="scatebox" >
									<option value="">local1</option>
								</select>
								<select  class="scatebox" >
									<option value="">local2</option>
								</select>
								<select class="scatebox">
									<option value="">local3</option>
								</select>
								<button> 적용</button>
							</div>
						</div>
						<br>
						<br>
						<div class="Taddbox1_1">
							<div>판매자정보</div>
							<div>
								<span>이메일</span>
								<span> | </span>
								<span>연락처</span>
							</div>
						</div>
						<textarea class="admintext" name="" id="" cols="30" rows="10" disabled>asdasd</textarea>
						<br>
						<div class="editbox">
						<div>첨부파일  <input type="file" id="file1" name="file1"> </div>
						<br>
						<div>
							<vue-editor v-model="content"></vue-editor> <!-- 2. 화면 에디터 추가 -->
						</div>

						<div class="btnbox">
							<button class="btn">등록</button>
							<button class="btn">목록</button>
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
			
			
			
		}   
		, components: {VueEditor}
		, methods: {
			fnAddBbs : function(){
            var self = this;
            var nparmap = {title : self.title, content : self.content};
            console.log( self.content );
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

			
		}
	});
</script>