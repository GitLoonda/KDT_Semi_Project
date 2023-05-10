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
* {
  list-style: none;
  text-decoration: none;
}
body {
  width : 1980px;
  margin : auto;
}
#container1 {
  width : 1080px;
  margin : auto;
  background-color: white;
}
#container {
  width : 1080px;
  margin: auto;
}
#header {
  margin: auto;
  padding: 20px 0 0 0;
  display: flex;
  justify-content: center ;
  height: 100px;
}
#searchBox {
  margin : 0 80px;
  padding : 20px 0 0 0;
}
#searchBar {
  border: 3px solid #ADD4D9;
  box-shadow: 1px 1px 3px black;
  background-color: white;
  margin: 0px;
  padding : 0px;
  height: 30px;
}
#searchBar select {
  border : none;
  border-right: 3px solid #ADD4D9;
  margin: 0px;
  padding : 0px;
  height: 30px;
  width: 8em;
  border-radius: 0;
}
#searchBar select:focus {
  outline: none;
}
#searchBar input {
  margin: 0px;
  padding : 0px;
  height : 25px;
  width : 24em;
  border: none;
  border-right: 3px solid #ADD4D9;
  border-radius: 0;
}
#searchBar input:focus {
  outline: none;
}
#searchBar button {
  margin: 0px;
  padding : 0px;
  width: 40px;
  height: 30px;
  background-color: white;
  border-radius: 0;
  border: none;
  float: right;
}
#searchBar button:hover {
  background-color: #ccc;
}
#searchBox #rcmdItem {
  margin : 0 0 0 7em;
}
#searchBox span {
  font-size: 0.9em;
  line-height: 30px;
}
#register {
  padding: 20px 0 0 0;
}
#register button {
  margin : 0 10px;
  border: none;
  border-radius: 0;
  background-color: white;
  height: 30px;
}
#register button:hover {
  background-color: #ccc;
}
#navbar {
  height: 40px;
  background-color: #ADD4D9;
}
a {
  color: black;
  font-weight: bold;
}
.menu > li {
  width: 14%;
  float: left;
  line-height: 40px;
  text-align: center;
  font-weight: bold;
}
.category {
  display : none;
  width : fit-content;
  background-color: #d0ecf2;
  z-index: 2;
}
.category ul {
  margin: 0;
  padding: 0 10px;
  border: 2px solid #ADD4D9;
  border-collapse: collapse;
}
.menu > li:hover {
  background-color: #bbd8f2;
}
.menu > li:hover > .category {
  display: flex;
}
.banner {
  margin-top: 10px;
  z-index: 1;
  text-align: center;
}
.banner img {
  height : 300px;
  width : 1000px;
}
#sellCategory {
  display: flex;
  justify-content: center;
}
.sellCateList {
  text-align: center;
  font-weight: bold;
  margin: 0 20px;
}
.sellCateList img {
  width: 80px;
  height: 80px;
  border-radius: 25%;
}
.user_edit{
    background-color: #ffffff;
    width: 1080px;
    height: 1800px;
    margin: 0px auto;
    padding: 20px;
}
#profile_up{
font-size: 15px;
padding: 40px;
}
#profile_up .up_img{
    float: left;
}
#profile_up .serve{
 float: left;
 padding: 20px;
}
#profile_up input{
    height: 30px;
    width: 300px;
    margin: 10px;
}
.file-label {
    margin-top: 30px;
    margin-left: 90px;
    background-color: #ccc;
    color: #fff;
    text-align: center;
    padding: 10px 0;
    width: 65%;
    border-radius: 6px;
    cursor: pointer;
  }
  .file {
    display: none;
  }
  .upload-box {
    width: 180px;
    height: 140px;
    flex-direction: column;
    margin-left: 10px;
    margin-bottom: 100px;
  }
  .upload-box .drag-file {
    position: relative;
    width: 100%;
    height: 220px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 3px dashed #dbdbdb;
  }
  .upload-box .drag-file.highlight {
    border: 3px dashed red;
  }
  .upload-box .drag-file .image {
    width: 40px;
  }
  .upload-box .drag-file .message {
    margin-bottom: 0;
  }
  .upload-box .drag-file .preview {
    display: none;
    position: absolute;
    left: 0;
    height: 0;
    width: 100%;
    height: 100%;
  }
#chooseFile{
    visibility: hidden;
}
#Likeslist{
    padding: 40px;

}
#Likeslist a img{
    padding: 20px;
    width: 50px;
    height: 100px;
}
#Portfolio{
  padding: 40px;
}
#Cmy_Portfolio a img{
  padding: 30px;
  width: 50px;
  height: 100px;
}
#Portfolio a img{
  padding: 20px;
  width: 50px;
  height: 100px;
}
#profile_uplist{
    padding-left: 120px;
    padding: 50px;
    margin-bottom: 20px;
}
#profile_uplist input{
    border: 2px solid #646363;
    border-radius: 3px;
    padding: 8px;
    width: 200px;    
    margin: 10px;
    margin-left: 40px;
  }
  #profile_uplist #member_post{
    margin-left: 200px;
    width: 500px;    
  }
  #profile_uplist label {
    float: left;
    font-size: 15px;
    width : 100px;
    padding-right:20px;
    margin-left: 40px;
  }
  #profile_uplist ul li {
    line-height: 25px;
    list-style: none;
    padding: 5px 10px;
    margin-bottom: 2px;
  }
  #updatebtn1{
    width: 200px;
    height: 40px;
    margin-left: 500px;
  }
 #lmember_post{
    width: 1000px;
 }
 #creator_adbox{
  width: 800px;
  height: 600px;
  border: 2px solid black;
  padding-left:60px;
 }
 #creator_adbox hr{
  margin-right: 200px;
 }
 #creator_adbox .creator_intro{
  padding-left: 10px;
  margin-top: 30px;
  width: 720px;
  height: 300px;
  border: 1px solid black;
 }
 #creator_adbox .creator_intro textarea{
 width: 700px;
 height: 260px;
 border: none;
 white-space: pre-line;
 }
 #creator_adbox .bt1_fileup{
  font-size: 15px;
  border: 2px;
 }
 .btn-upload {
  width: 120px;
  height: 20px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  margin-left: 250px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transform: translate(150,0);
}
#file_ad {
  display: none;
}
.star-ratings {
  padding-left: 20px;
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  padding-left: 20px;
  color: #fff58c;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
.Umy_text{
  font-size: 18px;
  font-weight: bolder;
  padding: 10px;
  padding-left: 15px;
}
#Umy_box{
  margin-left: 10px;
  height: 150px;
  width: 1000px;
  border: 1px solid black;
}
#Umypage_btn span{
  padding-left: 50px;
  font-size: 20px;
  font-weight: bolder;
}
#Umypage_btn button{
  float: right;
  margin: 10px;
  margin-right: 30px;
  height: 30px;
  width: 150px;
}
#cre_add_end{
  padding: 30px;
  float: right;
}
#cre_add_end button{
  width: 100px;
  height: 30px;
}
.creator_intro textarea {
  height: 260px;
  width: 700px;
}
.user_edit #output{
  display: block;
  white-space: pre-wrap;
  width: 220px;
  height: 20px;
  border: 1px solid black;
  float:left;
}
.btn-upload{
  float: left;
  margin-left: 20px;

}
.creadd_cate{
  width: 150px;
  height: 30px;
}
</style>
<body>
  <div id="app">
    <div id="container1">
        <div id="header">
            <div id="logoBox">
                <a href="javascript:;">
                <img src="/semi_project/unity-logo-200x100-1.jpg" alt="logo">
                </a>
            </div>
            <div id="searchBox">
                <div id=searchBar>
                    <select>
                        <option>::항목::</option>
                        <option>판매</option>
                        <option>구매</option>
                        <option>의뢰</option>
                    </select>
                    <input type="text">
                    <button>검색</button>
                </div>
                <div id="rcmdItem">
                    <span>추천 검색어 : </span>
                    <span>{{search.cinfo}}</span>
                </div>
            </div>
            <div id="register">
                <button onclick="location.href='http://localhost:8080/mypage.do'">마이페이지</button>
            </div>
        </div>
        <div id="navbar">
            <ul class="menu">
                <li>
                    <a href="javascript:;">중고거래</a>
                    <div class="category">
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate1.cinfo}}</a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate2.cinfo}}</a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate3.cinfo}}</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a>제작의뢰</a>
                    <div class="category">
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate1.cinfo}}</a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate2.cinfo}}</a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate3.cinfo}}</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a>{{menu.cinfo}}</a>
                    <div class="category">
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate1.cinfo}}</a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate2.cinfo}}</a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <a href="javascript:;">{{cate3.cinfo}}</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>     
        </div>
    </div>
    <br><br>
    <div class="user_edit">
    <!--사용자 프로필-->
    <div id="Umypage_btn">
      <span>사용자프로필</span>
      <button onclick="location.href='http://localhost:8080/mypage/useredit.do'">프로필 수정</button>
      <button onclick="location.href='http://localhost:8080/Cpage/creadd.do'">크리에이터 등록</button>
     
      
      
    </div>
    <hr width="95%">
    <div id="profile_up">
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
    <input type="text" placeholder="00님" size="20px">
    <br>
    <b>소개/공지</b>
    <br>
    <input type="text" placeholder="ㅎㅇ" size="50px">
    <br>
    <b>거래 평점</b>
    <!--별 찍기(평점)-->
    <div class="star-ratings">
      <div 
        class="star-ratings-fill space-x-2 text-lg"
        :style="{ width: ratingToPercent + '%' }"
      >
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
      </div>
      <div class="star-ratings-base space-x-2 text-lg">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>( x 점 )
      </div>
    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
     <!-- 이력 -->
     <div class="Umy_text">정보</div>
     <div id="Umy_box"></div>
     <div class="Umy_text">등록제품</div>
     <div id="Umy_box"></div>
     <div class="Umy_text">후기</div>
     <div id="Umy_box"></div>
     <!-- 사용자만 볼수 있음-->
     <div class="Umy_text">찜 목록</div>
     <div id="Umy_box"></div>
     <!--후기 개수-->
     <div class="Umy_text">커뮤니티 작성글</div>
     <div id="Umy_box"></div>
  
</div>
</body>
<script>
  // 별점 찍기
  function ratingToPercent() {
      const score = +this.restaurant.averageScore * 20;
      return score + 1.5;
 }
</script>
</html>