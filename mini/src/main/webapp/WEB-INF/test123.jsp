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
			</div>
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
				
		</body>
	</html>
	<script>
				ClassicEditor
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