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
    #cate{
        margin: 5px;
        width: 20%;
    }
</style>
<body>
	<div id="app">
		<div class="container">
			<h3>커뮤니티 글 수정</h3>
			<hr>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr> 
					<select id="cate">
						<option value=""> {{CATE1}} </option>
					</select>
					<select id="cate">
						<option value=""> {{CATE2}} </option>
					</select>
				</tr>
				<tr>
					<td><input type="text" id="title" name="title" v-model="title" placeholder="제목"></td>
				</tr>
				<tr>
					<td><input type="text" id="title" name="title" v-model="title" placeholder="첨부파일"></td>
					<td><button @click="" class="btn">첨부</button></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" v-model="content" placeholder="내용을 입력하세요."></textarea>
					</td>
				</tr>
			</table>
			<button @click="" class="btn" style="float: right;">목록으로</button>
			<button @click="" class="btn" style="float: right;">저장</button>
		</div>
	</div>
</body>
</html>

<script>

</script>