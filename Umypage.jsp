<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	 <link rel="stylesheet" href="css/user.css">
	<title>사용자프로필</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
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
                <button onclick="goMypage()">마이페이지</button>
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
      <button onclick="UpProfile()">프로필 수정</button>
      <button onclick="CreatAdd()">크리에이터 등록</button>
     
      
      
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
     <div id="Umy_box">
     <div id="jjim1"> 찜1+정보</div>
     <div id="jjim2"> 찜2+정보</div>
    </div>
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
  function goMypage(){
  	location.href ="/mypage.do"
  }
  function UpProfile(){
  	location.href ="/mypage/useredit.do"
  }
  function CreatAdd(){
  	location.href ="/Cpage/creadd.do"
  }
 
</script>
</html>