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
.serve textarea {
margin-left : 30px;
height : 120px;
width : 500px;}
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
    <input class="servename" type="text" :placeholder="mypg.crenick + '님'" readonly>
    <br>
    <b>남김말/공지</b>
    <br><br>
 <textarea type="text" v-model="mypg.cintro" :placeholder="mypg.cintro" style= "resize : none;"></textarea> <br>
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
              <input type="text" :placeholder="mypg.id" readonly>
            </li>
            <li>
              <label>비밀번호</label>
              <input v-model="mypg.passwd" type="password">
            </li>  
            <li>
              <label>비밀번호 확인</label>
              <input v-model="mypg.passwd2" type="password">
            </li>  
            <li>
              <label>전화번호</label>
              <input v-model="mypg.phone" type="text">
            </li>
            <br>
            <li>
                <label>이메일</label>
                    <input type="text" v-model="mypg.email" style="width : 150px"> @  
                      <select v-model="domain">
                        <option value="1">도메인</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.com">hanmail.com</option>
                        </select>
              </li> 
              <br><br>
              <li>
                <label for="add">
                    주소</label>
               <input v-model="mypg.addr" type="text" style="width: 150px" class="in3" placeholder=" 주소" disabled></input>
				<button id="btn" @click="fnSearchAddr">주소 찾기</button><br>
				<input v-model="mypg.addrDetail" type="text" class="in" placeholder=" 상세주소"
				style="margin-left : 340px; padding-right : 100px; width:270px"></input></li>
            </div>          
          </ul>
<br>
    <button class="updatebtn1" @click="fnUserUpdate">수정 완료</button>
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
	, mypg : {}
    , domain : ""
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
                	console.log(data.mypg);
	                self.mypg = data.mypg;
	                self.mypg.passwd = "";
	                self.mypg.phone = "";
	                self.mypg.email = "";
	                self.mypg.addr = "";
                }
            }); 
        }
	,  fnSearchAddr : function(){ // 주소 검색창 생성
		var self = this;
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open("addr.do", "test", option);
	}
	, fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		var self = this;
		self.roadFullAddr = roadFullAddr;
		// 도로명 주소
		self.mypg.addr = roadAddrPart1;
		// 상세 주소
		self.mypg.addrDetail = addrDetail;
	}

	,  
	//프로필 하단 정보수정란
	fnUserUpdate : function(){
	    	var self = this;
	    	var pwJ = /^[A-Za-z0-9]{6,12}$/;
			var nmJ = /^[ㄱ-힣]{2,6}$/;
			var nkJ = /^[a-zA-zㄱ-힣0-9]{2,6}$/;
	    	if(self.mypg.passwd != self.mypg.passwd2){
    			alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다.");
    			return;
    		} 
	    	if(!pwJ.test(self.mypg.passwd)) {
				alert( "비밀번호는 6~12자리의 영문대소문자/숫자로 구성되어야합니다.");
				return;
			}
			if(self.mypg.phone == null) {
				alert("전화번호를 입력해주세요.");
				return;
			}
			if(self.mypg.email == null) {
				alert("이메일을 입력해주세요.");
				
			} else {
				self.mypg.email =  self.mypg.email + "@" + self.domain;
			}
			if(self.mypg.addr == null) {
				alert("주소를 입력해주세요.");
				
			} else {
				self.mypg.addr =  self.mypg.addr + " " +self.mypg.addrDetail;
			}
		
    	var nparmap = self.mypg;
    	console.log(self.mypg);
           $.ajax({
                url:"/mypage/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("수정되었습니다.");
                	console.log(data);
                	
                }
        }); 
    }
} 
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});
    
    </script>
