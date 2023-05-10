<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
	<title>커뮤니티 글쓰기</title>
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
    .btns{
		float: right;
		margin: 5px;
		
	}
</style>
<body>
	<div id="app">
		<div class="container">
			<h3>커뮤니티 글쓰기</h3>
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
					<td style="text-align : center;" >제목</td>
					<td><input type="text" id="title" name="title" v-model="ctitle"></td>
				</tr>
				<tr>
					<td style="text-align : center;" >첨부파일</td>
					<td>
						<div>
						    <input type="file" id="file1" name="file1" > 
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					  <vue-editor v-model="ccont"></vue-editor> 
					</td>
				</tr>
			</table>
			<div class="btns">
				<button @click="fnMoveList()" class="btn" style="float: right;">목록으로</button>
				<button @click="fnAddCbrd()" class="btn" style="float: right;">저장</button>
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
		checkList : [],
		title : "",
		content : "",
    }
    
    , components: {VueEditor}
    
    , methods: {
    	
    	// 파일 업로드
	    upload : function(){
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
    	
    	// 목록으로 이동
    	,fnMoveList : function(){
    		var result = confirm("작성을 취소하고 목록으로 돌아가시겠습니까?");
    		
    		if(result) {
    			location.href="comm.do";
    		}
    	}
    	
    	// 글 저장
    	,fnAddCbrd : function(){
            var self = this;
            var nparmap = {ctitle : self.ctitle, ccont : self.ccont};
            console.log( self.ccont );
            /* $.ajax({
                url:"/comm/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="comm.do";
                }
            });  */
        } 
    	
    	
    }   
    , created: function () {
    	var self = this;
	}
});
</script>