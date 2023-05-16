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
                <a href="javascript:;"><img src="img/board/160628_7.png" alt="banner1"></a>
            </div>
        </div>
        <div id="container">
            <a href="javascript:;"><h2>상품거래 카테고리</h2></a>
            <div id="sellCategory">
                <div class="sellCateList">
                    <div>
                        <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    </div>
                    <p>스포츠</p>
                </div>
                <div class="sellCateList">
                    <div>
                        <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    </div>
                    <p>연예인</p>
                </div>
                <div class="sellCateList">
                    <div>
                       <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    </div>
                    <p>영화</p>
                </div>
                <div class="sellCateList">
                    <div>
                        <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    </div>
                    <p>애니메이션</p>
                </div>
                <div class="sellCateList">
                    <div>
                       <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    </div>
                    <p>게임</p>
                </div>
                
            </div>
            <a href="javascript:;"><h2>오늘의 팔아요</h2></a>
            <div id="sellRc">
                <div v-for="item in sellRcmd" class="itembox">
                	<a href="javascript:;">
	                	<img :src="item.path" alt="itemImg">
	                    <p>{{item.bTitle}}</p>
	                    <p>가격 : {{item.bPrice}}</p>
	                    <p>찜 : {{item.likes}}</p>
                	</a>
                </div>
            </div>
            <a href="javascript:;"><h2>오늘의 구해요</h2></a>
            <div id="buyRc">
                <div v-for="item in buyRcmd" class="itembox">
                    <a href="javascript:;">
	                	<img :src="item.path" alt="itemImg">
	                    <p>{{item.bTitle}}</p>
	                    <p>가격 : {{item.bPrice}}</p>
	                    <p>찜 : {{item.likes}}</p>
                	</a>
                </div>
            </div>
            <a href="javascript:;"><h2>의뢰 카테고리</h2></a>
            <div id="commCategory">
                <div class="commCateList">
                    <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    <p>조립</p>
                </div>
                <div class="commCateList">
                    <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    <p>도색</p>
                </div>
                <div class="commCateList">
                    <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    <p>수리</p>
                </div>
                <div class="commCateList">
                   <a href="javascript:;"><img src="img/board/160628_7.png" alt="cate1"></a>
                    <p>기타</p>
                </div>
            </div>
            <a href="javascript:;"><h2>오늘의 의뢰</h2></a>
            <div id="commRc">
                <div v-for="item in commRcmd" class="itembox">
                    <a href="javascript:;">
	                	<img :src="item.path" alt="itemImg">
	                    <p>{{item.bTitle}}</p>
	                    <p>가격 : {{item.bPrice}}</p>
	                    <p>찜 : {{item.likes}}</p>
                	</a>
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
	                	self.rcm = data.rec;
		           		self.sellRcmd = self.rcm.sell;
		           		self.buyRcmd = self.rcm.buy;
		           		self.commRcmd = self.rcm.comm;
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