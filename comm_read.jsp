<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>커뮤니티 게시판</title>
</head>
<style>
	.container{
         width: 1080px;
         margin: auto;
    }
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="card">
				<h3 class=>
					게시글 제목
				</h3>
				<div class="card-body">
				   	<div style="margin: 10px 10px 10px 10px;">
				   		<pre>게시글 내용</pre>
				   	</div>
			   	</div>
			</div>
			<div>
				<button @click="" style="float: right;">수정</button>
				<button @click="" style="float: right;">삭제</button>
				<button @click="" style="float: right;">신고</button>
				<button @click="" class="btn" style="float: right;">목록으로</button>
			</div>
			
			<h4 style="margin-top : 50px;">댓글</h4>
			<div style="clear : both; border-top : 1px solid #000"></div>
			
			<div style="margin-top : 10px;">
				<span>첨부파일</span>
				<input type="file" id="file1" name="file1" >
				<textarea v-model="comment" rows="3" cols="100" style="width : 80%;"></textarea>
				<button @click="" class="btn">등록</button> 
				<div><input type="checkbox" >비밀댓글 설정</div>
			</div>
			
			<div v-for="(item, index) in commentList" style="font-size : 1.5em; margin : 10px;">
				<div>
					<span>
						닉네임 : <pre>댓글 내용</pre>  작성일
						<button v-if="item.id == sessionId" @click="" style="float: right;">수정</button>
						<button v-if="item.id == sessionId" @click="" style="float: right;">삭제</button>
						<button v-else @click="" style="float: right;">신고</button>
					</span>
				</div>
				<!--  <div v-if="cInfo.commentNo == item.commentNo" style="margin-top : 10px;">
					<textarea v-model="" rows="3" cols="100" style="width : 90%;"></textarea>
					<button @click="" class="btn" style="margin-bottom : 30px;">수정</button>
				</div>	-->
			</div>
		</div>
</body>
</html>

<script>

</script>