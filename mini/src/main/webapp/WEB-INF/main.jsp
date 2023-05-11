<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<title>메인</title>
</head>
<style>
	 #container {
            width : 1080px;
            margin: auto;
            position: static;
            z-index: 1;
     }
     .banner {
            margin-top: 10px;
            text-align: center;
        }
        .banner img {
            height : 300px;
            width : 1000px;
        }
        #container h2 {
            margin-left: 4em;
            margin-top: 40px;
        }
        #sellCategory, #commCategory {
            display: flex;
            justify-content: center;
            margin: 40px 0;
        }
        .sellCateList, .commCateList {
            text-align: center;
            font-weight: bold;
            margin: 0 30px;
        }
        .sellCateList img {
            width: 120px;
            height: 120px;
            border-radius: 25%;
        }
        .commCateList img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
        }
        #sellRc, #buyRc, #commRc{
            display: flex;
            justify-content: center;
            margin: 40px 0;
        }
        .itembox {
            margin: 0 20px;
            background-color: #ccc;
        }
        .itembox img {
            width: 140px;
            height: 140px;
        }
        .itembox p {
            margin-top: 0;
            margin-bottom: 5px;
        }
</style>
<body>
	<div id="app">
		<div class="banner">
            <div class="view">
                <img src="img/board/160628_7.jpg" alt="banner1">
            </div>
            <div class="wait">
                <img src="img/board/160628_7.jpg" alt="banner2">
            </div>
        </div>
        <div id="container">
            <h2>상품거래 카테고리</h2>
            <div id="sellCategory">
                <div class="sellCateList">
                    <div>
                        <img src="img/board/160628_7.jpg" alt="cate1">
                    </div>
                    <p>스포츠</p>
                </div>
                <div class="sellCateList">
                    <div>
                        <img src="img/board/160628_7.jpg" alt="cate1">
                    </div>
                    <p>연예인</p>
                </div>
                <div class="sellCateList">
                    <div>
                        <img src="img/board/160628_7.jpg" alt="cate1">
                    </div>
                    <p>영화</p>
                </div>
                <div class="sellCateList">
                    <div>
                        <img src="img/board/160628_7.jpg" alt="cate1">
                    </div>
                    <p>애니메이션</p>
                </div>
                <div class="sellCateList">
                    <div>
                        <img src="img/board/160628_7.jpg" alt="cate1">
                    </div>
                    <p>게임</p>
                </div>
                
            </div>
            <h2>오늘의 상품 추천</h2>
            <div id="sellRc">
                <div v-for="item in sellRcmd" class="itembox">
                    <img :src="item.path" alt="itemImg">
                    <p>{{item.bTitle}}</p>
                    <p>가격 : {{item.bPrice}}</p>
                    <p>찜 : {{item.likes}}</p>
                </div>
            </div>
            <h2>오늘의 구해요</h2>
            <div id="buyRc">
                <div v-for="item in buyRcmd" class="itembox">
                    <img :src="item.path" alt="itemImg">
                    <p>{{item.bTitle}}</p>
                    <p>가격 : {{item.bPrice}}</p>
                    <p>찜 : {{item.likes}}</p>
                </div>
            </div>
            <h2>의뢰 카테고리</h2>
            <div id="commCategory">
                <div class="commCateList">
                    <img src="img/board/160628_7.jpg" alt="cate1">
                    <p>조립</p>
                </div>
                <div class="commCateList">
                    <img src="img/board/160628_7.jpg" alt="cate2">
                    <p>도색</p>
                </div>
                <div class="commCateList">
                    <img src="img/board/160628_7.jpg" alt="cate3">
                    <p>수리</p>
                </div>
                <div class="commCateList">
                    <img src="img/board/160628_7.jpg" alt="cate3">
                    <p>기타</p>
                </div>
            </div>
            <h2>오늘의 의뢰추천</h2>
            <div id="commRc">
                <div v-for="item in commRcmd" class="itembox">
                    <img :src="item.path" alt="itemImg">
                    <p>{{item.bTitle}}</p>
                    <p>가격 : {{item.bPrice}}</p>
                    <p>찜 : {{item.likes}}</p>
                </div>
            </div>
        </div>
	</div>
</body>
</html>
<script>
	var app = new Vue({ 
	    el: '#app',
	    data: {
	    	rcm : [],
	    	sellRcmd : [],
	    	buyRcmd : [],
	    	commRcmd : []
	    }   
	    , methods: {
	    	fnGetList : function(){
	            var self = this;
	            var nparmap = {};
	            $.ajax({
	                url:"/main/rcmd.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	console.log(data);
	                	self.rcm = data.rec;
	                	console.log(self.rcmd);
		           		self.sellRcmd = self.rcm.sell;
		           		self.buyRcmd = self.rcm.buy;
		           		self.commRcmd = self.rcm.comm;
		           		console.log(self.sellRcm);
	                }
	            }); 
	        }
	    }   
	    , created: function () {
	    	var self = this;
	    	self.$nextTick(self.fnGetList());
		}
	});
</script>