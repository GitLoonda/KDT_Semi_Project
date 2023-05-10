<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>사용자프로필</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="user.css">
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
        <div id="creator_adbox">
        <h3><div>크리에이터 등록</div></h3>
        <hr width="95%">


        <div><input type="text" placeholder="크리에이터명"></div>
        <br>
        <output id="output"> 포트폴리오 첨부</output>
        <label class = "btn-upload">
             파일 업로드
            <input id="file_ad" type="file" multiple></label>
            <br><br>
        <select class="creadd_cate">
            <option value="1">신청 카테고리</option>
            <option value="1">1</option>
            <option value="1">2</option>
            <option value="1">3</option>
            </select>
        <div class="creator_intro">
            <div> 소개 </div>
            <textarea placeholder="포트폴리오 1부, SNS주소 필수 첨부."></textarea>
        </div>
        <div id="cre_add_end">
        <button @click="cre_add_ok">요청</button>
        <button @click="cre_add_no">취소</button>
        </div>

    </div>
    </div>
</body>
<script>
    const input = document.getElementById('file')
const output = document.getElementById('output')

document.getElementById('file_ad').addEventListener('input', (event) => {
  const files = event.target.files
  output.textContent = Array.from(files).map(file => file.name).join('\n')
})
</script>
</html>