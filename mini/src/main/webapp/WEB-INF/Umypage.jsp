<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	 <link rel="stylesheet" href="/css/user.css">
	<title>사용자프로필</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
</style>
<body>
	<div id="app">
	<div class="user_edit">
	<!--사용자 프로필-->
	<div class="Umypage_btn">
      <span>사용자프로필 </span>
	<button class="btn1" @click="UpProfile()">프로필 수정</button>
      <button class="btn2" @click="CreatAdd()">크리에이터 등록</button>
      </div>
    <hr width="92%">
    <div class="profile_up">
        <div class="up_img">
            <div class="upload-box">
                <div class="drag-file">
                  <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
                  <p class="message">이미지</p>
                  <img src="" alt="미리보기 이미지" class="preview">
                </div>
              </div>
        </div>
     <div class="serve">
    <input class="servename" type="text" :placeholder="user.name + '님'" readonly>
    <br>
    <b>소개/공지</b>
    <br>
    <input type="text" placeholder="소개/공지란 입니다.">
    <br><br>
    <b>거래 평점</b>
    <!--별 찍기(평점)-->
    <div class="star-ratings">
      <div 
        class="star-ratings-fill space-x-2 text-lg">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
      </div>
      <div class="star-ratings-base space-x-2 text-lg">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>( x 점 )
      </div>
    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
     <!-- 이력 -->
     <br> <br> <br>
     <div class="Umy_text">정보</div>
     <textarea class="Umy_box">{{user.addr}}</textarea>
     <div class="Umy_text">등록제품</div>
     <textarea class="Umy_box">{{user.addr}}</textarea>
     <div class="Umy_text">후기</div>
     <textarea class="Umy_box">{{user.addr}}</textarea>
     <!-- 사용자만 볼수 있음-->
     <div class="Umy_text">찜 목록</div>
     <textarea class="Umy_box">{{user.addr}}</textarea>
    
     <!--후기 개수-->
     <div class="Umy_text">커뮤니티 작성글</div>
     <textarea class="Umy_box">{{user.addr}}</textarea></div>
     </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		user : {}
    }   
    , methods: {
    	fnGetInfo : function(){
            var self = this;
            var nparmap = {id : app.sessionId};
            $.ajax({
                url:"/user/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
                	console.log(data.user);
	                self.user = data.user;
                }
            }); 
        }
    	
    	
		, CreatAdd(){
			location.href ="/creadd.do";
		}
		,UpProfile(){
			location.href ="/useredit.do";
			
		}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});
</script>