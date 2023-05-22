<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>크리에이터 추가</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="/css/user.css">
</head>
<style>
</style>
<body>
    <div id="app">
        <br><br><br><br> 
    <div class="user_edit">
        <div class="creator_adbox">
        <h3><div class="creaddti">크리에이터 등록</div></h3>
        <hr width="95%">
        <div><input type="text" v-model="mypg.crenick" :placeholder="mypg.crenick"></div>
        <br>
				<td><div style="font-size:22px">★ 포트폴리오 첨부하기 ★</div></td>
				<td>
						<div>
						    <input type="file" id="file1" name="file1" > 
						</div>
					</td>
            <br>
        <select class="creadd_cate">
            <option value="car">신청 카테고리</option>
            <option value="plz">의뢰</option>
            <option value="make">제작</option>
            <option value="non">기타</option>
            </select>
        <div class="creator_intro">
            <div class="creaddintr"> 소개 </div>
            <br>
            <textarea v-model = "mypg.crecont" placeholder="포트폴리오 1부, SNS주소 필수 첨부" style= "resize : none;"></textarea>
        </div>
        <div class="cre_add_end">

         <!--요청 시 등록 데이터 DB 크리에이터승인(admin/cuser) 보내기--> 
        <button class="bt1" @click="OkCre()">요청</button>

        <!--취소 시 사용자 프로필로-->
        <button class="bt1" @click="Nocre()">취소</button>
        </div>

    </div>
    </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
	mypg : {}
    }   
    , methods: {
       /* upload: function() {
            var form = new FormData();
            form.append("file1", $("#file1")[0].files[0]);

            $.ajax({
                url: "/upload.do",
                type: "POST",
                processData: false,
                contentType: false,
                data: form,
                success: function(response) {
                    // 성공 시 동작
                }
            });
        },*/
        fnGetInfo : function(){
            var self = this;
            var nparmap = {id : app.sessionId};
            $.ajax({
                url:"/user/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
                	console.log(data.mypg);
                }
            }); 
        }
        
			    ,OkCre : function(){
			        var self = this;
			        var nparmap = self.mypg;
			        console.log(self.mypg);
			        $.ajax({
			            url:"/user/creadd.dox",
			            dataType:"json",	
			            type : "POST", 
			            data : nparmap,
			            success : function(data) {  
			            	alert("등록신청이 완료되었습니다");
			            	console.log(data);

			            }
			        }); 
			    }
       , Nocre() {
        	alert("취소했습니다.");
            location.href = "/mypage.do";
        }
    }
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
}
});
  </script>
