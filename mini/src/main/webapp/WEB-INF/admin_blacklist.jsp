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
	<title>관리자 블랙리스트</title>

</head>
<style>
</style>
<body>
	<div id="app" >
		<div class="container">
			<h2>블랙리스트 관리</h2>
			<div style="float : right; margin-right : 20px">
				<div>{{sessionId}} 님 환영합니다 😀</div>
			</div>
			<div> 
				<input type="text" v-model="keyword" @keyup.enter="fnGetList">
				<button @click="fnGetList">검색</button>
			</div>
			<div style="float : right; margin-right : 20px">
				<div><a href="../admin/login.do" v-if="sessionId != ''">로그아웃 📴</a></div>
			</div>
	        <div class="table-list">
	        	<h2>블랙리스트 목록</h2>
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">No.</th>
	                        <th scope="col">신고사유</th>
	                        <th scope="col">ID</th>
	                        <th scope="col">신청일</th>
	                        <th scope="col">게시글 신고 횟수</th>
	                        <th scope="col">댓글 신고 횟수</th>
	                        <th scope="col">상태</th>
	                        <th scope="col">처리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            <td>{{item.baNo}}</td>
                            <td>{{item.content}}</a></td>
                            <td>{{item.id}}</td>     
                            <td>{{item.adate}}</td>     
                            <td>{{item.bancnt1}}</td>     
                            <td>{{item.bancnt2}}</td>     
                            <td v-if="item.ustatus == 1">정상</td>     
                            <td v-else-if="item.ustatus == 2">사용불가</td>     
                            <td v-else-if="item.ustatus == 3">사용정지</td>     
                            <td>
                            	<button @click="fnBan('3', item)">승인</button>
                            	<button @click="fnBan('1', item)">해제</button>
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
    	, blackUser : []
    	, keyword : ""
    	, sessionId : "${sessionId}"
    }   
    , methods: {
    	
        fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.keyword};
            $.ajax({
                url:"/admin/blacklist.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
	                self.list = data.list;
                }
            }); 
        }
    
    	, fnBan : function (status, item){
    		var self = this;
            var nparmap = {id : item.id, status : status};
            if(!confirm("블랙리스트를 승인하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            $.ajax({
                url:"/admin/blacklist/ban.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	if(status == '1'){
                		alert("블랙리스트에 해제되었습니다.");
                	}else{
                		alert("블랙리스트에 추가되었습니다.");
                	}
                	
                	self.fnGetList();
                }
            }); 
    	
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