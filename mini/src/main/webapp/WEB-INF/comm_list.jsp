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
	.container{
         width: 1080px;
         margin: auto;
    }
	table{
		width: 800px;
		text-align: center;
		border: 1px solid #fff;
		border-spacing: 1px;
		margin: auto;
	}
	table a:hover {
	 	text-decoration: underline;
	}
 	table td {
	    padding: 10px;
	    background-color: #eee;
	}
	table th {
		border-bottom: 1px solid #000;
	    padding: 10px;
	}
	.searchbox{
		padding: 15px 0;
  		background-color: #f9f7f9;
	}
	.btns{
		float: right;
	}
	
</style>
<body>
	<div id="app">
		<div class="container">
			<div>
				1-15 / <span>{{listcnt}}</span>
			</div>
			<div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>
	                    	<th scope="col">No.</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">조회수</th>
	                        <th scope="col">작성자</th>
	                        <th scope="col">작성일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr> 
	                    	<td>{{cbno + 1}}</td>
	                        <td><a href="#">{{item.ctitle}}</a></td>
	                        <td>{{item.hits}}</td>
	                        <td>{{item.id}}</td>     
	                        <td>{{item.cdate}}</td>     
	                    </tr>                                       
	                </tbody>                   
	            </table>
	        </div>
	        <div class= searchbox>
		        <select>
					<option value=""> 전체 </option>
				</select>
		        <label><input type="text" v-model="keyword"></label>
				<button class="btn" @click="">검색</button>
			</div>
			<div class= btns>
	        	<button class="btn" @click="">글쓰기</button>
	        	<button class="btn" @click="">삭제</button>
	        </div>
	     </div>

	</div>
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	
    }   
    , methods: {
   
    }   
    , created: function () {
    	var self = this;

	}
});
</script>