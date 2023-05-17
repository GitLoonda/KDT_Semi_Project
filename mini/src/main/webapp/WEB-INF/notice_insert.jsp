<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="../css/style.css">
	<!-- 1. vue2editor 에디터 cdn -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
	<title>공지사항 등록</title>

</head>
<style>
</style>
<body>
	
	<div id="app">
		<div class="container">
			<h2>공지사항 등록</h2>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="text-align : center;" >제목</td>
					<td><input type="text" id="title" name="title" v-model="title"></td>
				</tr>
				<!-- <tr>
					<td colspan="2">
						<textarea id="contents" name="contents" v-model="content"></textarea>
					</td>
				</tr> -->
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
					  <vue-editor v-model="content"></vue-editor> <!-- 2. 화면 에디터 추가 -->
					</td>
				</tr>
			</table>
			<button @click="fnList()" class="btn" style="float: right;">목록으로</button>
			<button @click="fnAddBbs()" class="btn" style="float: right;">저장</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">

	//3. 뷰에 vue2editor 추가
	console.log(Vue);
	Vue.use(Vue2Editor);
	const VueEditor = Vue2Editor.VueEditor;

var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
    	, checkList : []
    	, title : ""
    	, content : ""
    	// 4. 컴포넌트 추가
    	
    } 
	, components: {VueEditor}
    , methods: {
        fnAddBbs : function(){
            var self = this;
            var nparmap = {title : self.title , content : self.content};
            console.log( self.content );
            $.ajax({
                url:"/notice/insert.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	alert("저장되었습니다.")
                    location.href = "../notice.do"
                }
            }); 
        }
    	, fnList : function () {
    		location.href = "../notice.do"
    	}
    	
    	// 파일 업로드
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
    	
	}
});
</script>