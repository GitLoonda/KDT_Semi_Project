<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/defult/def.jsp"></jsp:include>
	<script src="https://ssense.github.io/vue-carousel/js/vue-carousel.min.js"></script>
	<title>메인</title>
</head>
<style>
	 #container {
         width : 1080px;
         margin: auto;
         position: static;
         z-index: 1;
     }
     .VueCarousel-wrapper {
     	width : 1080px;
     	height : 300px;
     	margin : auto;
     	z-index: 1;
     }
     .VueCarousel-slide {
		 position: relative;
		 background: #fff;
		 color: #fff;
		 font-family: Arial;
	  	 font-size: 24px;
	  	 text-align: center;
	  	 min-height : 300px;
	  	 width : 100%;
	  	 z-index: 1;
	 }
	 .label {
	 	 position: absolute;
		 top: 50%;
		 left: 50%;
		 transform: translate(-50%, -50%);
		 width : 100%;
		 height : 100%;
		 z-index: 1;
	 }
	 .label img {
	 	 width : 100%;
		 height : 100%;
		 z-index: 1;
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
         border-radius : 5px;
     }
     .itembox:hover {
     	
     }
     .itembox img {
         width: 140px;
         height: 140px;
     }
     .itembox p {
     	 font-size : 14px;
         margin-top: 0;
         margin-bottom: 5px;
         padding : 0 5px;
     }
</style>
<body>
	<div id="app">
		<carousel :per-page = "1">
            <slide>
                <a class="label" href="javascript:;"><img src="assets/banner/11729.jpg" alt="banner1"></a>
            </slide>
            <slide>
                <a class="label" href="javascript:;"><img src="assets/banner/11730.jpg" alt="banner2"></a>
           	</slide>
            <slide>
                <a class="label" href="javascript:;"><img src="assets/banner/11732.jpg" alt="banner3"></a>
            </slide>
        </carousel>
        <div id="container">
            <a @click="fnTrade" href="javascript:;"><h2>상품거래 카테고리</h2></a>
            <div id="sellCategory">
                <div class="sellCateList">
                    <a @click="fnCateSelect('SPO')" href="javascript:;">
	                    <div>
	                    	<img src="img/main/sport.jpg" alt="cate1">
	                    </div>
	                    <p>스포츠</p>
                    </a>
                </div>
                <div class="sellCateList">
                    <a @click="fnCateSelect('CEL')" href="javascript:;">
	                    <div>
	                    	<img src="img/main/talent.jpg" alt="cate1">
	                    </div>
	                    <p>연예인</p>
                    </a>
                </div>
                <div class="sellCateList">
                    <a @click="fnCateSelect('MOV')" href="javascript:;">
	                    <div>
	                    	<img src="img/main/movie.jpg" alt="cate1">
	                    </div>
	                    <p>영화</p>
                    </a>
                </div>
                <div class="sellCateList">
                    <a @click="fnCateSelect('ANI')" href="javascript:;">
	                    <div>
	                    	<img src="img/main/anime.jpg" alt="cate1">
	                    </div>
	                    <p>애니메이션</p>
                    </a>
                </div>
                <div class="sellCateList">
                    <a @click="fnCateSelect('GAM')" href="javascript:;">
	                    <div>
	                    	<img src="img/main/game.jpg" alt="cate1">
	                    </div>
	                    <p>게임</p>
                    </a>
                </div>
                
            </div>
            <a href="javascript:;"><h2>오늘의 팔아요</h2></a>
            <div id="sellRc">
                <div v-for="item in sellRcmd" @click="fnView(item.tbNo)" class="itembox">
                	<a href="javascript:;">
	                	<img :src="item.path" alt="itemImg">
	                    <p>{{item.bTitle}}</p>
	                    <p>가격 : {{item.bPrice}}원</p>
	                    <p>찜 : {{item.likes}}</p>
                	</a>
                </div>
            </div>
            <a href="javascript:;"><h2>오늘의 구해요</h2></a>
            <div id="buyRc">
                <div v-for="item in buyRcmd" @click="fnView(item.tbNo)" class="itembox">
                    <a href="javascript:;">
	                	<img :src="item.path" alt="itemImg">
	                    <p>{{item.bTitle}}</p>
	                    <p>가격 : {{item.bPrice}}원</p>
	                    <p>찜 : {{item.likes}}</p>
                	</a>
                </div>
            </div>
            <a @click="fnTrade" href="javascript:;"><h2>의뢰 카테고리</h2></a>
            <div id="commCategory">
                <div class="commCateList">
                    <a @click="fnCateSelect('BM1')" href="javascript:;">
	                    <img src="img/main/plamodel.jpg" alt="cate1">
	                    <p>조립</p>
                    </a>
                </div>
                <div class="commCateList">
                    <a @click="fnCateSelect('BM2')" href="javascript:;">
	                    <img src="img/main/paint.jpg" alt="cate1">
	                    <p>도색</p>
                    </a>
                </div>
                <div class="commCateList">
                    <a @click="fnCateSelect('BM3')" href="javascript:;">
	                    <img src="img/main/rapair.jpg" alt="cate1">
	                    <p>수리</p>
                    </a>
                </div>
                <div class="commCateList">
                   <a @click="fnCateSelect('BM4')" href="javascript:;">
	                   <img src="img/board/160628_7.png" alt="cate1">
	                   <p>기타</p>
                   </a>
                </div>
            </div>
            <a href="javascript:;"><h2>오늘의 의뢰</h2></a>
            <div id="commRc">
                <div v-for="item in commRcmd" @click="fnView(item.tbNo)" class="itembox">
                    <a href="javascript:;">
	                	<img :src="item.path" alt="itemImg">
	                    <p>{{item.bTitle}}</p>
	                    <p>가격 : {{item.bPrice}}원</p>
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
	    	commRcmd : [],
	    	index : 0
	    }   
		, components : {
			'carousel' : VueCarousel.Carousel,
			'slide' : VueCarousel.Slide
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
		    , fnPage : function(i) {
	    		var self = this;
	    		var slide = document.getElementById('slide');
	    		slide.style.transform = 'translate3d(-' + (-1080 * i) + 'px, 0, 0)';
	    		console.log(slide.style.transform);
	    	} 
	    	, fnPrev : function() {
	    		var self = this;
	    		var slide = document.getElementById('slide');
	    		if (self.index == 0) {
	    			self.index = 4;
	    		}
	    		else {
	    			self.index -= 1;
	    		}
	    		slide.style.transform = 'translate3d(-' + (-1080 * self.index) + 'px, 0, 0)';
	    		console.log(slide.style.transform);
	    	} 
	    	, fnNext : function() {
	    		var self = this;
	    		var slide = document.getElementById('slide');
	    		if (self.index == 4) {
	    			self.index = 0;
	    		}
	    		else {
	    			self.index += 1;
	    		}
	    		slide.style.transform = 'translate3d(-' + (-1080 * self.index) + 'px, 0, 0)';
	    		console.log(slide.style.transform);
	    	}
	    	, pageChange : function(url, param) {
	    		var target = "_self";
	    		if(param == undefined){
	    		//	this.linkCall(url);
	    			return;
	    		}
	    		var form = document.createElement("form"); 
	    		form.name = "dataform";
	    		form.action = url;
	    		form.method = "post";
	    		form.target = target;
	    		for(var name in param){
					var item = name;
					var val = "";
					if(param[name] instanceof Object){
						val = JSON.stringify(param[name]);
					} else {
						val = param[name];
					}
					var input = document.createElement("input");
		    		input.type = "hidden";
		    		input.name = item;
		    		input.value = val;
		    		form.insertBefore(input, null);
				}
	    		document.body.appendChild(form);
	    		form.submit();
	    		document.body.removeChild(form);
	    	}
	    	, fnTrade : function() {
        		location.href = "/trade.do";       		 
        	}
	    	, fnCateSelect : function(item) {
        		var self = this;
        		self.pageChange("/trade.do", {cate1 : item});       		 
        	}
	    	, fnView(tbNo){
				var self = this;
				self.pageChange("./tradeview.do",{tbno : tbNo});
			}
	    }   
	    , created: function () {
	    	var self = this;
	    	self.$nextTick(self.fnGetList());
	    }
	});
</script>