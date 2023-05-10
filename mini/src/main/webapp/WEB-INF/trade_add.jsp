<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
		<head>
			<jsp:include page="/defult/def.jsp"></jsp:include>
			<meta charset="UTF-8">
			<title>게시글 등록</title>
		</head>
		<style>
			*{
				border: 1px dashed red;
			}
	.container{
         width: 1080px;
         margin: 1px auto;
         background-color: #09e19c;
		 display: block;
      }
	  #Taddbox1{
		padding: 0px 30px;
	  }
	  #Taddbox1 hr{
		border: 2px solid black;
	  }
	  .Taddbox1_1{
		margin: 0px;
		margin-bottom: 20px;
	  }
	  .titlebox{
		width: 80%;
		font-size: 12pt;
		height: 30px;
	  }
	  .catebox1{
		width: 150px;
		font-size: 12pt;
		height: 30px;
	  }
	  .sumbox{
		margin: 0px 0px;
		width: 100%;
		
		}
	  .sumbox1{
		display: inline-block;
		width: 49%;
		padding-left: 5px;
		    
	  }
	  .admintext{
		width: 100%;
		background-color: aliceblue;
		border: 1px solid black;

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
							<div><input type="number"> 원</div>
							<br>
							<div>상품 카테고리</div>
							<select>
								<option value="">cate1</option>
							</select>
							<select>
								<option value="">cate2</option>
							</select>
							<select>
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
									<label for="c1"><input id="a1" type="radio" name="c">직거래</label>
									<label for="c2"><input id="a2" type="radio" name="c">택배</label>
									<label for="c3"><input id="a3" type="radio" name="c">온라인</label>
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
								<select>
									<option value="">local1</option>
								</select>
								<select>
									<option value="">local2</option>
								</select>
								<select>
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
					</div>
				</div>
			</div>
		</body>
	</html>
	<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			list : [],
			
			
		}   
		, methods: {



		
		}
		, created: function () {
			var self = this;
			self.fnGetList();
			
		}
	});
</script>