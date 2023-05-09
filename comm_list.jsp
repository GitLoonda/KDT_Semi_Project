<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>커뮤니티 게시판</title>
</head>
<style>

</style>
<body>
	<div id="app">
		<div class="container">
			<div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>
	                        <th scope="col">제목</th>
	                        <th scope="col">조회수</th>
	                        <th scope="col">작성자</th>
	                        <th scope="col">작성일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr> 
	                        <td><a href="#">글 제목</a></td>
	                        <td>조회수</td>
	                        <td>닉네임</td>     
	                        <td>작성시간 + 날짜</td>     
	                        <td></td>  
	                    </tr>                                       
	                </tbody>                   
	            </table>
	        </div>
	        
	        <select>
				<option value=""> 항목 </option>
			</select>
	        <label><input type="text" v-model="keyword"></label>
			<button class="btn" @click="">검색</button>
			
			<div>
	        	<button class="btn" @click="">글쓰기</button>
	        	<button class="btn" @click="">삭제</button>
	        </div>
	     </div>

	</div>
</body>
</html>

<script>

</script>