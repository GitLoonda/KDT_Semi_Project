<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	 <link rel="stylesheet" href="/css/user.css">
	<title>크리에이터 프로필 수정</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<style>
</style>
<body>
  <div id="app">    
    <div class="user_edit">
    <!--사용자 프로필 수정-->
     <div class="Cpage_btn">
    <span>크리에이터 프로필 수정</span>
    </div>
    <hr width="95%">
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
    <input class="servename" type="text" placeholder="크리에이터 00님">
    <br>
    <b>남김말</b>
    <br>
    <input class=twobox type="text" placeholder="남김말 입니다.">
    <br>
    <b>정보</b>
    <br>
    <input class=twobox type="text" placeholder="정보 입니다.">
    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
           <label class="file-label" for="chooseFile">이미지 업로드</label>
    <input class="file" id="chooseFile"
      type="file" 
      @change="handleFiles($event.target.files)"
      accept="image/png, image/jpeg, image/gif"
    >
<!--포트폴리오-->
    <div class="Portfolio">
        <h3 style="padding-left: 20px;">포트폴리오</h3>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
        <a href=""><img src="img/mypage/160628_7.png"></a>
    </div>
    <hr>
    <!--정보 수정-->
    <h2 style="padding-left: 20px;">정보 수정</h2>
    <div class="profile_uplist">
        <ul>
            <li>
              <label>아이디</label>
              <input name="id" type="text">
            </li>
            <li>
              <label>비밀번호</label>
              <input v-model="list.passwd" type="password">
            </li>  
            <li>
              <label>비밀번호 확인</label>
              <input v-model="list.passwd2" type="password">
            </li>  
            <li>
              <label>전화번호</label>
              <input v-model="list.phone" type="text">
            </li>
            <br>
            <li>
                <label>이메일</label>
                    <input type="text" v-model="list.email" size="10px"> @  
                    <select>
                        <option value="1">도메인</option>
                        <option value="naver">naver.com</option>
                        <option value="1">daum.net</option>
                        <option value="1">hanmail.com</option>
                        </select>
              </li> 
              <br><br>
              <li>
                <label for="add">
                    주소</label>
               <input v-model="addr" type="text" class="in3" placeholder=" 주소" disabled></input>
				<button id="btn" @click="fnSearchAddr">주소 찾기</button><br>
				<input v-model="addrDetail" type="text" class="in" placeholder=" 상세주소"
				style="margin-left : 200px; padding-right : 100px"></input></li>
            </div>          
          </ul>
<br>
    <button class="updatebtn1" @click="fnSignIn">수정 완료</button>
</div>
</div>
</body>
</html>

<script type="text/javascript">
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}
var app = new Vue({ 
    el: '#app',
    data: {
	  roadFullAddr : ""
	, addr : ""
	, addrDetail : ""
	, list : []
	, dropArea : ""
	, fileList : ""
    }   
    , methods: {
    	fnSearchAddr : function(){ // 주소 검색창 생성
    		var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
    	}
		, fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.roadFullAddr = roadFullAddr;
    		// 도로명 주소
    		self.addr = roadAddrPart1;
    		// 상세 주소
    		self.addrDetail = addrDetail;
    	}
		, fnSignIn : function() {
			var self = this;
			var pwJ = /^[A-Za-z0-9]{6,12}$/;
			var nmJ = /^[ㄱ-힣]{2,6}$/;
			var nkJ = /^[a-zA-zㄱ-힣0-9]{2,6}$/;
			
			if(self.list.passwd == null || self.list.passwd2 == null) {
				alert("비밀번호와 비밀번호 확인을 입력해주세요.");
				return;
			}
			if(!pwJ.test(self.list.passwd)) {
				alert( "비밀번호는 6~12자리의 영문대소문자/숫자로 구성되어야합니다.");
				return;
			}
			if(self.list.passwd != self.list.passwd2) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
			if(self.list.phone == null) {
				alert("전화번호를 입력해주세요.");
				return;
			}
			if(self.list.email == null) {
				alert("이메일을 입력해주세요.");
				return;
			}
			alert("수정완료");
			location.href ="/Cpage.do"
		
    }   
	
		
		
    }   
    , created: function () {
    
	}
});
    
    </script>
