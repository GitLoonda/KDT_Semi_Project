<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<jsp:include page="/defult/def.jsp"></jsp:include>
			<title>test</title>
		</head>
		<style>
</style>
		<body>
			<div id="app">
				안녕하세요.
			
			<div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>                       
	                        <th scope="col">No.</th>
	                        <th scope="col">학번</th>
	                        <th scope="col">이름</th>
	                        <th scope="col">학과</th>
	                        <th scope="col">학년</th>
	                        <th scope="col">키</th>
	                        <th scope="col">몸무게</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <td>{{index+1}}</td>
							<td>{{item.id}}</td> 
                            <td>{{item.name}}</td>
                            <td>{{item.nick}}</td>
                            <td>{{item.gender}}</td>     
                            <td>{{item.email}}</td>     
                            <td>{{item.addr}}</td>     
                        </tr>                                       
	                </tbody>                   
	            </table>
	            </div>
	           </div>
		</body>
		<body data-editor="ClassicEditor" data-collaboration="false" data-revision-history="false">
		<header>
			<div class="centered">
				<h1><a href="https://ckeditor.com/ckeditor-5/" target="_blank" rel="noopener noreferrer"><img src="https://c.cksource.com/a/1/logos/ckeditor5.svg" alt="CKEditor 5 logo">CKEditor 5</a></h1>
				<nav>
					<ul>
						<li><a href="https://ckeditor.com/docs/ckeditor5/" target="_blank" rel="noopener noreferrer">Documentation</a></li>
						<li><a href="https://ckeditor.com/" target="_blank" rel="noopener noreferrer">Website</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<main>
			<div class="message">
				<div class="centered">
					<h2>CKEditor 5 online builder demo - ClassicEditor build</h2>
				</div>
			</div>
			<div class="centered">
				<div class="row row-editor">
					<div class="editor-container">
						<div class="editor">
							<h2>Bilingual Personality Disorder</h2>
							<figure class="image image-style-side"><img src="https://c.cksource.com/a/1/img/docs/sample-image-bilingual-personality-disorder.jpg">
								<figcaption>One language, one person.</figcaption>
							</figure>
							<p>
								This may be the first time you hear about this made-up disorder but
								it actually isn’t so far from the truth. Even the studies that were conducted almost half a century show that
								<strong>the language you speak has more effects on you than you realise</strong>.
							</p>
							<p>
								One of the very first experiments conducted on this topic dates back to 1964.
								<a href="https://www.researchgate.net/publication/9440038_Language_and_TAT_content_in_bilinguals">In the experiment</a>
								designed by linguist Ervin-Tripp who is an authority expert in psycholinguistic and sociolinguistic studies,
								adults who are bilingual in English in French were showed series of pictures and were asked to create 3-minute stories.
								In the end participants emphasized drastically different dynamics for stories in English and French.
							</p>
							<p>
								Another ground-breaking experiment which included bilingual Japanese women married to American men in San Francisco were
								asked to complete sentences. The goal of the experiment was to investigate whether or not human feelings and thoughts
								are expressed differently in <strong>different language mindsets</strong>.
								Here is a sample from the the experiment:
							</p>
							<table>
								<thead>
									<tr>
										<th></th>
										<th>English</th>
										<th>Japanese</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Real friends should</td>
										<td>Be very frank</td>
										<td>Help each other</td>
									</tr>
									<tr>
										<td>I will probably become</td>
										<td>A teacher</td>
										<td>A housewife</td>
									</tr>
									<tr>
										<td>When there is a conflict with family</td>
										<td>I do what I want</td>
										<td>It's a time of great unhappiness</td>
									</tr>
								</tbody>
							</table>
							<p>
								More recent <a href="https://books.google.pl/books?id=1LMhWGHGkRUC">studies</a> show, the language a person speaks affects
								their cognition, behaviour, emotions and hence <strong>their personality</strong>.
								This shouldn’t come as a surprise
								<a href="https://en.wikipedia.org/wiki/Lateralization_of_brain_function">since we already know</a> that different regions
								of the brain become more active depending on the person’s activity at hand. Since structure, information and especially
								<strong>the culture</strong> of languages varies substantially and the language a person speaks is an essential element of daily life.
							</p>
						</div>
					</div>
				</div></div>
			</div>
		</main>
		<footer>
			<p><a href="https://ckeditor.com/ckeditor-5/" target="_blank" rel="noopener">CKEditor 5</a>
				– Rich text editor of tomorrow, available today
			</p>
			<p>Copyright © 2003-2023,
				<a href="https://cksource.com/" target="_blank" rel="noopener">CKSource</a>
				Holding sp. z o.o. All rights reserved.
			</p>
		</footer>
		<script>ClassicEditor
				.create( document.querySelector( '.editor' ), {
					
					licenseKey: '',
					
					
					
					
				} )
				.then( editor => {
					window.editor = editor;
			
					
					
					
				} )
				.catch( error => {
					console.error( 'Oops, something went wrong!' );
					console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
					console.warn( 'Build id: poh14nld66ba-25nh7lcfw9by' );
					console.error( error );
				} );
		</script>
	</body>
	</html>
	
	<script type="text/javascript">

	var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
    }   
    , methods: {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/test/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
					// console.log(data);                                      
	                self.list = data.list;
					console.log(self.list);
                }
            }); 
        } 
	
	}
    , created: function () {
    	var self = this;
		self.fnGetList();
		
	}
});
</script>