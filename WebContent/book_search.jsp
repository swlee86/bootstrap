<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <script>
   $(function(){
		var book = {
				title:[
			            "JAVA의 정석",
			            "안드로이드 스튜디오",
			            "JAVA언어로 배우는 디자인 패턴 입문",
			            "정보처리기사",
			            "죄와벌"
			             ]
					}
		var various = {
				it:[
			            "JAVA의 정석",
			            "안드로이드 스튜디오",
			            "JAVA언어로 배우는 디자인 패턴 입문",
			            "정보처리기사"
			             ],
			    fiction:[
						"죄와벌"
			             ],
			    essey:[
			           
			           
			           
			           ]
					}
	  $('#searchBtn').click(function(){		 
		  	var message = "";
		  	var searchKey = $('#tags').val();
		  	var j ="";
		  	var result ="";
		 	for(var i = 0; i < book.title.length; i++){
		 		if(searchKey == book.title[i]){
		 			j = book.title[i]
		 			
		 			
		 	for(var k=0; k<various.it.length; k++){
		 		if(searchKey == various.it[k]){
		 			result="IT";	
		 		}else{
		 			for(var l=0; l<various.fiction.length; l++){
		 				if(searchKey == various.fiction[k]){
		 					result="Fiction";
		 				}else{
		 					for(var m=0; m < various.essey.length; m++){
		 						if(searchKey == various.essey[m]){
				 					result="Essey";
				 				}
		 					}
		 				}
		 			}				 
		 		}
		 	}
		 			
		 			$('#lists').remove();
		 			$('#searchlist').append("<li id='lists'>"+j+" ▶ 해당 도서는 [ "+result+" ]탭에 있습니다<br></li>");
		 			$('#dialog_booksearch').dialog('open')
					break;
		 			}else if(searchKey == ""){
		 				//alert("false")
			 			$('#lists').remove();
			 			$('#searchlist').append("<li id='lists'>도서명을 입력하고 검색을 눌러주세요.<br></li>");
			 			$('#dialog_booksearch').dialog('open')
		 			}else{
		 				$('#lists').remove();
			 			$('#searchlist').append("<li id='lists'>입력하신 도서는 리스트에 없습니다.[입력하신 도서명 : "+searchKey+"]<br></li>");
			 			$('#dialog_booksearch').dialog('open')
		 			}
		  			
		 	}
	  });

		 $('#dialog_booksearch').dialog(		
					{
					 autoOpen:false,
				     width : "auto",
				     resizable:false,
				     modal:true
						
					}
				);

			 $("#tags").autocomplete(book, {
				 matchContains : true,
				 source : book.title
				 });
				
});	  	         
   </script>
   
   
   
<div class="container-fluid">
	<div class="jumbotron text-center">
		<h3 style="color:black;">도서 검색</h3>
		<div class="ui-widget">
		<br/>
		<input style="width: 180px" id="tags" size="25" placeholder="검색하실 단어를 입력하세요"><br><br>
		<button type="button" class="btn btn-danger" id="searchBtn" style="width: 140px;"> 검색</button>
		</div>
	</div>
</div>


 <!--  도서검색 Dialog	 -->
	<div id="dialog_booksearch" title="도서 검색 결과">
	<ul>
		<li id="searchlist">검색 결과<br></li>
	</ul>
	</div>  