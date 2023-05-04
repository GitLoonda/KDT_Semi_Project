<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/defult/def.jsp"></jsp:include>
<title>주소 검색</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="login.css">
</head> 
<body>
    <form id="signup_add">
        <div id="app" class="div1">
    <div class="logoImg"><h2>주소 검색</h2></div>
    <input type="text" name="addr1" id="member_addr" placeholder="도로명 주소를 입력해 주세요." readonly/>
    <button type="button" onclick="openZipSearch()">검색</button><br>
    <br>
    <input type="text" name="addr2" id="member_post" placeholder="상세 주소를 입력해 주세요." required>
  <br>
  <br>
  <button id="btn" @click="">적용하기</button>
  </div>
</form>
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
    
    </script>
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>