<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<!--  페이징 추가 1 -->
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<link rel="stylesheet" href="../css/style.css">
	<title>관리자 게시판 관리</title>

</head>
<style>
<!-- 페이징 추가 2 -->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
        text-align: center;
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
</style>
<body>
	<div id="app" >
		<div class="container">
			<div>
			<h2>댓글 관리</h2>
			
			<div> 
				<input type="text" v-model="commentKeyword" @keyup.enter="fnGetList">
				<button @click="fnGetList">검색</button>	
			</div>
			
			<div> 게시글 분류 →
				<select v-model="selectBrdFlg">
					<option value="">:: 전체 ::</option>
					<option value="BF1">거래게시판</option>
					<option value="BF2">의뢰게시판</option>
					<option value="BF3">홍보게시판</option>
				</select>
				
				<button class="btn" @click="fnGetList()">검색</button>
				
			</div>

			
			<!-- 거래게시판 리스트  -->
			
	        <div class="table-list">
	            <table class="board_list" >                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">게시글 분류</th>
	                        <th scope="col">게시글 번호</th>
	                        <th scope="col">댓글 번호</th>
	                        <th scope="col">댓글 내용</th>
	                        <th scope="col">작성자 아이디</th>
	                        <th scope="col">작성일</th>
	                        <th scope="col">처리상태</th>
	                        <th scope="col">처리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in commentList" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            
                            
                            <!-- 게시판 분류 -->
                            
                            <td v-if="item.brdFlg == 'BF1'">거래게시판</td>
                            <td v-else-if="item.brdFlg == 'BF2'">의뢰게시판</td>
                            <td v-else-if="item.brdFlg == 'BF3'">홍보게시판</td>
                            
                            <td>{{item.tbNo}}</td>
                            <td>{{item.cno}}</td>
                            <td @click=""><a href="javascript:;">{{item.conte}}</a></td>
                            <td>{{item.id}}</td>     
                            <td>{{item.cdate}}</td>     
                            <td v-if="item.delYn == 'Y'">삭제처리완료</td>     
                            <td v-else></td>     
                            <td>
                          	  <button @click="fnRemove('Y' , item)">삭제</button>
                          	  <button @click="fnRemove('N' , item)">복구</button>
                            </td>     
                        </tr>                                       
	                </tbody>                   
	            </table>
	            <!-- 페이징 추가 3 -->
	            <template>
				  <paginate
				    :page-count="pageCount"	 	
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"	
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
	        </div>
	        
	        <!-- 커뮤니티 게시판 리스트  -->
	        
	        			<div> 커뮤니티 분류 →
				<select v-model="selectCate1">
					<option value="">:: 전체 1차 분류 ::</option>
					<option value="SPO">스포츠</option>
					<option value="CEL">연예인</option>
					<option value="MOV">영화</option>
					<option value="ANI">애니메이션</option>
					<option value="GAM">게임</option>
				</select>
				
				<select v-model="selectCate2">
					<option value="">:: 전체 2차 분류 ::</option>
					<option value="SPO1">구기종목</option>
					<option value="SPO2">라켓종목</option>
					<option value="SPO3">헬스/요가/필라테스</option>
					<option value="SPO4">골프</option>
					<option value="SPO5">치어리더</option>
					<option value="CEL1">보이그룹</option>
					<option value="CEL2">걸그룹</option>
					<option value="CEL3">솔로가수(남)</option>
					<option value="CEL4">솔로가수(여)</option>
					<option value="CEL5">배우(남)</option>
					<option value="CEL6">배우(여)</option>
					<option value="CEL7">방송/예능</option>
					<option value="MOV1">국내영화</option>
					<option value="MOV2">해외영화</option>
					<option value="MOV3">디즈니</option>
					<option value="ANI1">일본</option>
					<option value="ANI2">국내</option>
					<option value="ANI3">해외</option>
					<option value="GAM1">국내온라인게임</option>
					<option value="GAM2">국내콘솔게임</option>
					<option value="GAM3">해외온라인게임</option>
					<option value="GAM4">해외콘솔게임</option>
				</select>
				
			
				<button class="btn" @click="fnGetList()">검색</button>
			</div>
	        
	        <div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">커뮤니티 1차 분류</th>
	                        <th scope="col">커뮤니티 2차 분류</th>
	                        <th scope="col">게시글 번호</th>
	                        <th scope="col">댓글 번호</th>
	                        <th scope="col">댓글 내용</th>
	                        <th scope="col">작성자 아이디</th>
	                        <th scope="col">작성일</th>
	                        <th scope="col">처리상태</th>
	                        <th scope="col">처리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in commentList2" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            
                            
                            <!-- 커뮤니티 1차 분류 -->
                            
                            <td v-if="item.cate1 == 'SPO'">스포츠</td>
                            <td v-else-if="item.cate1 == 'CEL'">연예인</td>
                            <td v-else-if="item.cate1 == 'MOV'">영화</td>
                            <td v-else-if="item.cate1 == 'ANI'">애니메이션</td>
                            <td v-else-if="item.cate1 == 'GAM'">게임</td>
                            
                            <!-- 커뮤니티 2차 분류 -->
                            
                            <td v-if="item.cate2 == 'SPO1'">구기종목</td>
                            <td v-else-if="item.cate2 == 'SPO2'">라켓종목</td>
                            <td v-else-if="item.cate2 == 'SPO3'">헬스/요가/필라</td>
                            <td v-else-if="item.cate2 == 'SPO4'">골프</td>
                            <td v-else-if="item.cate2 == 'SPO5'">치어리더</td>
                            <td v-else-if="item.cate2 == 'CEL1'">보이그룹</td>
                            <td v-else-if="item.cate2 == 'CEL2'">걸그룹</td>
                            <td v-else-if="item.cate2 == 'CEL3'">솔로가수(남)</td>
                            <td v-else-if="item.cate2 == 'CEL4'">솔로가수(여)</td>
                            <td v-else-if="item.cate2 == 'CEL5'">배우(남)</td>
                            <td v-else-if="item.cate2 == 'CEL6'">배우(여)</td>
                            <td v-else-if="item.cate2 == 'CEL7'">방송/예능</td>
                            <td v-else-if="item.cate2 == 'MOV1'">국내영화</td>
                            <td v-else-if="item.cate2 == 'MOV2'">해외영화</td>
                            <td v-else-if="item.cate2 == 'MOV3'">디즈니</td>
                            <td v-else-if="item.cate2 == 'ANI1'">일본</td>
                            <td v-else-if="item.cate2 == 'ANI2'">국내</td>
                            <td v-else-if="item.cate2 == 'ANI3'">해외</td>
                            <td v-else-if="item.cate2 == 'GAM1'">국내온라인게임</td>
                            <td v-else-if="item.cate2 == 'GAM2'">국내콘솔게임</td>
                            <td v-else-if="item.cate2 == 'GAM3'">해외온라인게임</td>
                            <td v-else-if="item.cate2 == 'GAM4'">해외콘솔게임</td>
                            
                            <td>{{item.cbNo}}</td>
                            <td>{{item.cno}}</td>
                            <td @click=""><a href="javascript:;">{{item.conte}}</a></td>
                            <td>{{item.id}}</td>     
                            <td>{{item.cdate}}</td>     
                            <td v-if="item.delYn == 'Y'">삭제처리완료</td>     
                            <td v-else></td>     
                            <td>
                          	  <button @click="fnRemove('Y' , item)">삭제</button>
                          	  <button @click="fnRemove('N' , item)">복구</button>
                            </td>     
                        </tr>                                       
	                </tbody>                   
	            </table>
	            <!-- 페이징 추가 3 -->
	            <template>
				  <paginate
				    :page-count="commPageCount"	 	
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch2"	
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
	        </div>

	        <div>
	        	<!-- <button class="btn">삭제</button> -->
	        	<!-- <button class="btn" @click="fnAdd()">등록</button> -->
	        </div>
        </div>
	</div>
	</div>
</body>
</html>

<script type="text/javascript">

<!-- 페이징 추가 4 -->
Vue.component('paginate' , VuejsPaginate);
var app = new Vue({ 
    el: '#app',
    data: {
    	commentList : []
    	, commentList2 : []
    	, commentKeyword : ""
    	, selectBrdFlg : ""
    	, selectCate1 : ""
    	, selectCate2 : ""
   		<!-- 페이징 추가 5-->
    	, selectPage : 1
    	, pageCount : 1
    	, cnt : 0
   		<!-- 페이징 추가 5-->
    	, selectCommPage : 1
    	, commPageCount : 1
    	, commCnt : 0
    }   
    , methods: {
    	
        fnGetList : function(){
            var self = this;
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {commentKeyword : self.commentKeyword, cate1 : self.selectCate1
            			, cate2 : self.selectCate2 , brdFlg : self.selectBrdFlg
            			, startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/admin/comment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
	                self.commentList = data.commentList;
	                self.commentList2 = data.commentList2;
	                self.cnt = data.cnt;
	                self.commCnt = data.commCnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
	                self.commPageCount = Math.ceil(self.cnt / 10);
                }
            }); 
        }
	    <!-- 페이징 추가 7-->
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/admin/comment.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.commentList = data.commentList;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		}
		
	    <!-- 페이징 추가 7-->
		, fnSearch2 : function(pageNum){
			var self = this;
			self.selectCommPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/admin/comment.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.commentList2 = data.commentList2;
					self.commCnt = data.commCnt;
					self.pageCount = Math.ceil(self.commCnt / 10);
				}
			});
		}
    	, fnAdd : function() {
    		location.href = "insert.do"
    	}
    	
    	, fnRemove : function(commentStatus , item ) {	//매개변수를 줘야함
    		var self = this;
    		console.log(item);
            var nparmap = {cno : item.cno , commentStatus : commentStatus};
            if(!confirm("정말 삭제하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            
            $.ajax({
                url:"/admin/comment/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	if(item.delYn == 'N'){
                    	alert("삭제되었습니다.")
                	}else{
                    	alert("복구되었습니다.")
                	}
                	self.fnGetList();	// 지우고 나서 리스트 바로 출력
                }
            });  
    	}

    	, pageChange : function(url, param) {
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
    	}
    	
    	, fnView : function(boardNo){
    		var self = this;
    		self.pageChange("./read.do", {boardKey : boardNo});
    	}
    	
    }   
    , created: function () {
		this.fnGetList();    
	}
});
</script>