<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="js/jquery.js"></script>
    <script src="assets/ckeditor5/src/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="../css/def.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        }
        .category ul {
            margin: 0;
            padding: 0 10px;
        }
        .menu > li:hover {
            background-color: #bbd8f2;
        }
        .menu > li:hover > .category {
            display: flex;
        }
   	</style>
</head>
<div id="app">
        <div id="container1">
            <div id="header">
                <div id="logoBox">
                    <img src="/unity-logo-200x100-1.jpg" alt="logo">
                </div>
                <div id="searchBox">
                    <div id=searchBar>
                        <select>
                            <option>::항목::</option>
                            <option>구매</option>
                            <option>판매</option>
                            <option>의뢰</option>
                        </select>
                        <input type="text">
                        <button>검색</button>
                    </div>
                    <div id="RcmdItem">
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
    </body>
    </html>
    <script type="text/javascript">
	   
    </script>