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
	<title>관리자 메인페이지</title>

</head>
<style>

</style>
<body>
	<div id="app" >
		<div class="container">
			<h2>관리자 메인 페이지</h2>
			<div style="float : right; margin-right : 20px">
				<div>{{sessionId}} 님 환영합니다 😀</div>
			</div>
			<ul>
				<li><h4>처리현황</h4></li>
				<li>관리자 {{adminCnt}}명 </li>
				<li><a href="/notice.do">공지사항 업로드</a></li>
				<li>크리에이터 승인 대기 <a href="/admin/main.do">{{recogCnt}}</a>개 </li>
				<li>신고 처리 대기 <a href="/admin/blacklist.do">{{cnt}}</a>개</li>
			</ul>
			
			<div style="float : right; margin-right : 20px">
				<div><a href="../admin/login.do" v-if="sessionId != ''">로그아웃 📴</a></div>
			</div>
	        <div class="table-list">
	        	<h2>크리에이터 승인 목록</h2>
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">No.</th>
	                        <th scope="col">ID</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">내용</th>
	                        <th scope="col">신청일</th>
	                        <th scope="col"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            
                            <td>{{index + 1}}</td>
                            <td>{{item.id}}</a></td>
                            <td>{{item.cretitle}}</a></td>
                            <td>{{item.crecont}}</a></td>
                            <td>{{item.cdate}}</td>     
                            <td>
                            	<button @click="fnRecogCreator('Y' , item)">승인</button>  
                           		<button @click="fnRecogCreator('N' , item)">거부</button>
                           	</td>      
                        </tr>                                       
	                </tbody>                   
	            </table>
	           
	        </div>
	        <div>
	        	<!-- <button class="btn">삭제</button> -->
	        	<!-- <button class="btn" @click="fnAdd()">등록</button> -->
	        </div>
        </div>
	</div>
</body>
</html>
<script type="text/javascript">

var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
    	, blackcnt : ""
    	, cnt : 0
    	, recogCnt : 0
    	, adminCnt : 0
   		, sessionId : "${sessionId}"
   		, sessionUstatus : "${sessionUstatus}"
    	
    }   
    , methods: {
    	
    	fnRecogCreator : function (creatorStatus , item) {
    		 var self = this;
             var nparmap = {id : item.id , creatorStatus : creatorStatus };
          
             $.ajax({
                 url:"/admin/recogCreator.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                 	console.log(data);
                 	if(creatorStatus == 'Y'){
                		alert("크리에이터 승인되었습니다.");
                		self.fnGetList();
                	}else{
                		alert("크리에이터 승인 취소되었습니다.");
                		self.fnGetList();
                	}
                 }
             }); 
    	}
    
    	
    	, fnGetList : function () {
    		 var self = this;
             var nparmap = {};
             $.ajax({
                 url:"/admin/main.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                 	console.log(data);
 	                self.list = data.list;
 	                self.cnt = data.cnt;
 	                self.recogCnt = data.recogCnt;
 	                self.adminCnt = data.adminCnt;
                 }
             }); 
    	}

    	, fnAdd : function() {
    		location.href = "insert.do"
    	}
    	
    	, fnRemove : function(item) {	//매개변수를 줘야함
    		var self = this;
    		console.log(item);
            var nparmap = item;		// item 자체가 맵이라서 {} 이거 안씀
            if(!confirm("정말 삭제하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            
            $.ajax({
                url:"/bbs/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	alert("삭제되었습니다.")
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
    	
    }   
    , created: function () {
		this.fnGetList();    
	}
});
</script>