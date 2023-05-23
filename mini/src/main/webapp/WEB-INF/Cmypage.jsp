<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>크리에이터 프로필</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/user.css">
</head>
<style>
</style>
<body>  
  <div id="app">
  <div class="user_edit">
    <!--사용자 프로필-->
    <div class="Cpage_btn">
      <span>크리에이터프로필</span>
      <button class="btn1" @click="UpProfile()">프로필 수정</button>
    </div>
    <hr width="92%">
    <div class="profile_up">
        <div class="up_img">
            <div class="upload-box">
                <div id="drop-file" class="drag-file">
                  <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
                  <p class="message">이미지</p>
                  <img src="" alt="미리보기 이미지" class="preview">
                </div>
              </div>
        </div>
       <div class="serve">
    <input class="servename" type="text" :placeholder="mypg.crenick + '님'" readonly>
    <br>
    <b>남김말/공지</b>
    <br>
    <input type="text" :placeholder="mypg.cintro" readonly>
    <br><br>
    <!--별 찍기(평점)-->
    <div class="Cmy_star">
    <b>거래 평점</b>
    <div class="star-ratings">
      <div 
        class="star-ratings-fill space-x-2 text-lg"
      >
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
      </div>
      <div class="star-ratings-base space-x-2 text-lg">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>( x 점 )
    </div></div>
    <br>
    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
     <!-- 이력 -->
     <div class="Umy_text">정보</div>
     <textarea class="Umy_box" style= "resize : none;" readonly>주소 : {{mypg.addr}} </textarea>
     <!--포트폴리오(이미지)-->
     <div class="Umy_text">포트폴리오</div>
     <div class="Cmy_Portfolio">
    	<a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
     </div>
     <!--후기 개수-->
     <div class="Umy_text">의뢰 후기(x건)</div>
     <textarea class="Umy_box" style= "resize : none;" readonly >
    
	의뢰 후기  
     
      {{mypg.id}} : {{mypg.conte}}
      
      {{mypg.id}} : {{mypg.conte}}
      </textarea>>
  
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
    	// 프로필 내역 받아오기
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
	                self.mypg = data.mypg;
                }
            }); 
        }

    
    //프로필 수정 버튼 클릭시 페이지 이동
			,UpProfile(){
		location.href ="/creedit.do";
	}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
    
	}
});
</script>
