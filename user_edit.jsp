<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>사용자프로필</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="/src/main/css/User.css">
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
                <button>로그인</button>
                <button>회원가입</button>
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
    <!--사용자 프로필 수정-->
    <h2 style="padding-left: 20px;">사용자프로필 수정</h2>
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
    <b>남김말</b>
    <br>
    <input type="text" placeholder="ㅎㅇ" size="50px">
    <br>
    <b>정보</b>
    <br>
    <input type="text" placeholder="ㅎㅇ" size="50px">
    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br>
        <label class="file-label" for="chooseFile">이미지 업로드</label>
        <input class="file" id="chooseFile"
          type="file" 
          onchange="dropFile.handleFiles(this.files)"
          accept="image/png, image/jpeg, image/gif"
        >
    
    <!--찜 목록-->
    <div id="Likeslist">
        <h3 style="padding-left: 20px;">찜 목록</h3>
        <a href=""><img src="../images/insta.jpg"></a>
        <a href=""><img src="../images/insta.jpg"></a>
        <a href=""><img src="../images/insta.jpg"></a>
        <a href=""><img src="../images/insta.jpg"></a>
        <a href=""><img src="../images/insta.jpg"></a>
    </div>
    <hr>
    <!--정보 수정-->
    <h2 style="padding-left: 20px;">정보 수정</h2>
    <div id="profile_uplist">
        <ul>
            <li>
              <label>아이디</label>
              <input name="id" type="text">
            </li>
            <li>
              <label>비밀번호</label>
              <input name="ps" type="password">
            </li>  
            <li>
              <label>비밀번호 확인</label>
              <input name="psa" type="password">
            </li>  
            <li>
              <label>전화번호</label>
              <input name="psa" type="text">
            </li>
            <br>
            <li>
                <label>이메일</label>
                    <input type="text" size="10px"> @  
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
                <input type="text" name="addr1" id="member_addr" placeholder="주소 찾기를 통해 주소 검색" readonly/>
                <button type="button" onclick="openZipSearch()">주소 찾기</button><br>
                <input type="text" name="addr2" id="member_post" placeholder="[상세 주소 입력] " required>
            </li>
            </div>          
          </ul>
<br>
    <button id="updatebtn1" @click="">수정 완료</button>
</div>
</div>
</body>
<script>
    function openZipSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                $('[name=addr1]').val(data.address);
                $('[name=addr2]').val(data.buildingName);
            }
        }).open();
    }
    function DropFile(dropAreaId, fileListId) {
  let dropArea = document.getElementById(dropAreaId);
  let fileList = document.getElementById(fileListId);
 
  // 이벤트 중복 막기
  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }
  // 드래그 시 표시하기 위한 이벤트
  // (파일이 상자 안으로 들어가면 highlight / 밖으로 벗어나면 unhighlight 함수 스타일 변경)
  function highlight(e) {
    preventDefaults(e);
    dropArea.classList.add("highlight");
  }

  function unhighlight(e) {
    preventDefaults(e);
    dropArea.classList.remove("highlight");
  }

  function handleDrop(e) {
    unhighlight(e);
    let dt = e.dataTransfer;
    let files = dt.files;

    handleFiles(files);

    const fileList = document.getElementById(fileListId);
    if (fileList) {
      fileList.scrollTo({ top: fileList.scrollHeight });
    }
  }
 // 파일 업로드(drop)
  function handleFiles(files) {
    files = [...files];
    // files.forEach(uploadFile);
    files.forEach(previewFile);
  }

  function previewFile(file) {
    console.log(file);
    renderFile(file);
  }
 // 이미지 만들어주는 함수(renderFile 사용) 업로드칸 -> 이미지 변경해줌.
  function renderFile(file) {
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onloadend = function () {
      let img = dropArea.getElementsByClassName("preview")[0];
      img.src = reader.result;
      img.style.display = "block";
    };
  }

  dropArea.addEventListener("dragenter", highlight, false);
  dropArea.addEventListener("dragover", highlight, false);
  dropArea.addEventListener("dragleave", unhighlight, false);
  dropArea.addEventListener("drop", handleDrop, false);

  return {
    handleFiles
  };
}

const dropFile = new DropFile("drop-file", "files");
    

    
    </script>
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
