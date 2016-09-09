<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<%
	String memberid = (String)session.getAttribute("sessionId");
	boolean loginstate = (memberid ==null) ? false : true;
%>


<script type="text/javascript">
$(function(){
	$('#login_dialog').dialog(
			{
				 autoOpen:false,
			     width : "330px",
			     resizable:false,
			     modal:true
			}		
		);

		$('#open_button').click(function(){
			$('#login_dialog').dialog('open')
		});
		
		
		$('#register_dialog').dialog(
				{
					 autoOpen:false,
				     width : "800px",
				     resizable:false,
				     modal:true
				}		
			);
		
			$('#sign_button').click(function(){
				$('#register_dialog').dialog('open')
			});
			
			$('#DDD').click(function(){
				$('#login_dialog').dialog('close')
				$('#register_dialog').dialog('open')
			});
			
<%			
	if(loginstate == true){
%>		
			$("#contents").click(function(){ 
				$("#content").load("Canvas_SvgStudy.html"); 
				}); 

				
				$("#member").click(function(){ 
				$("#content").load("Member_final.html"); 
				}); 
				
				$("#freeboard").click(function(){ 
				$("#content").load("Freeboard.html"); 
				}); 
				
				
				$("#guestbook").click(function(){ 
				$("#content").load('GuestBook.html'); 
				});
				
				$("#databoard").click(function(){ 
				$("#content").load('DataBoard.html'); 
				}); 
				
				$("#mainbutton").click(function(){ 
				$("#content").load('Member_final.html'); 
				}); 
				
				$("#source").click(function(){ 
				$("#content").load('Source.html'); 
				}); 
				
				$("#bookinfo").click(function(){ 
				$("#content").load('bookmain.html'); 
				}); 
<%
	}else{
%>
	$("#contents").click(function(){ 
			alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
	
	$("#member").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
	
	$("#freeboard").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
	
	
	$("#guestbook").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	});
	
	$("#databoard").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
	
	$("#mainbutton").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
	
	$("#source").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
	
	$("#bookinfo").click(function(){ 
		alert("죄송합니다. 로그인 후 이용해 주세요")
	}); 
<%
	}
%>




	//로그인시 고객 정보 확인(제약)
    var numcheck = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/
    //alert(inputNumber);
$('#register_gogo').click(function(){
	if($('#inputEmail').val()==""){
		alert("ID는 필수 값입니다");
		$('#inputEmail').focus();
		return false;
		}else{
			if($('#pswd').val()==""){
				alert("비밀번호는 필수 입력 값입니다")
				$('#pswd').focus();
				return false;
		}else{
			if($('#inputPasswordCheck').val()==""){
				alert("비밀번호를 확인차 한 번 더 입력해 주세요")
				$('#inputPasswordCheck').focus();
				return false;
			}else{
				if($('#pswd').val()!=$('#inputPasswordCheck').val()){
					alert("입력하신 비밀번호가 서로 일치하지 않습니다. 확인해 주세요")
					$('#pswd').focus();
					return false;
				}else{
					if($('#inputName').val()==""){
						alert("이름을 반드시 입력해 주세요");
						$('#inputName').focus();
						return false;
					}else{
						if($('#inputNumber').val()==""){
							alert("휴대전화 번호는 필수 입력 값입니다");
							$('#inputNumber').focus();
							return false;
						}else{
						    if(!numcheck.test($('#inputNumber').val())) {
						        alert("휴대폰 번호에는 숫자만 넣으셔야 합니다.");
						        inputNumber="";
						        $('#inputNumber').focus();
						        return false;
						 	}else{
									if($("input[name='agree']:checkbox:checked").size() == 0){				
										alert("이용약관에 동의하셔야 이용이 가능합니다.");
										return false;
										}else
											$('#regijspgo').submit();
										}
									}
								}
							}
						}
					}
				}		
		});
		
		
    $('#logingo').click(function(){	
    if($('#user_id').val()==""){
    		alert("ID를 입력해 주세요");
    		$('#user_id').focus();
    		return false;
    		}else{
    			if($('#passwordch').val()==""){
    				alert("패스워드를 입력해 주세요");
    				$('#passwordch').focus();
    				return false;
    			}else{
    				$('#logjspgo').submit();
    			}
    		}
    });
		
		
}); 




</script>



<style type="text/css">
.navbar {
background:#FFFFFF;

}

.navbar .navbar-center {
  display: inline-block;
  float: none;
  vertical-align: top;
  text-align: center;
}

#page_footer {
height: 60px;
background: #f5f5f5;
}
.footer_text{
margin: 20px 0;
color: #777;
}

.jumbotron {
	padding-left: 50px; 
	width: 80%;	
}

#container {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
}
#header {
	height: 50px;
	width: 100%;
	background-color:#ff00ff;
}

#content {
	width: 90%;
	height: 90%;
	padding: 20px;
	margin-right: 160px;
	margin-left: 160px;
}

#leftnav {
	float: left;
	width: 10%;
	height: 90%;
	background-color: white;
	padding: 5px;
		
}

#leftnav ul{
	margin-left: 0;
	padding-left: 0;
	list-style-type: none;
	font-family: '돋움', Helvetica, sans-serif;
	font-size: 12px;
}

#leftnav a{
	display: block;
	width: 130px;
	padding-top: 3px;
	padding-right: 3px;
	padding-bottom: 3px;
	padding-left: 3px;
	border-bottom-width: 1px;
}

#leftnav a:link, .navlist a:visited{
color: #ffffff;
text-decoration: underline;
font-weight: bold;
}

#leftnav a:visited{
   color: #ffffff;
   text-decoration: underline;
   font-weight: bold;
}

#leftnav a:hover{
	text-decoration: none;
	color: #0000ff;
}

#footer {
	background-color: black;
	padding: 10px;
	clear: both;
	font-family: '돋움', Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: white;
	text-align: center;
	height: 10%;
}

</style>
</head>
<body>

<div id="container">
	<!-- Top 영역 -->
	<div id="header">
	<jsp:include page="/CommonModule/Top.jsp"></jsp:include>
	</div>
	
	<!-- Content 영역-->
	<div id="content">
		<jsp:include page="/CommonModule/Content.jsp"></jsp:include>
	</div>

	<!-- footer 영역(footer도 jsp파일로 작업하여 연결 필요 --> 
	<div align="center" id="footer">
		copyright@3조
	</div>
</div>




   <!-- info Login_pop_up -->
<%
	session = request.getSession(true);
	if( session.getAttribute("sessionId") != null){
	
%>
	<script type="text/javascript">
		window.onload=function(){
			$("#leftnav").load("afterlogin.jsp");	
		};
	</script>
  <%
 }else{
  %>
   <div id="login_dialog" title="Login">
   	 <div class="container">
      <div class="row">
        <div class="page-header">
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        <form method="post" action="loginConfirm.jsp" id="logjspgo">
            <div class="form-group">
                <label for="username-email">이메일</label>
                <input name="user_id" value='' id="user_id" placeholder="E-mail" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="password" id="passwordch" value='' placeholder="Password" type="password" class="form-control" />
            	<input type="checkbox" name="uselogin" id="uselogin">보안 로그인(cookie를 생성하지 않습니다.)
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="login" id="logingo">      
            </div>
            <hr />
            	<a href="#" class="btn btn-default btn-block m-t-md" id="pwsearch">비밀번호 찾기</a>
           	<hr />
            <div class="form-group">
                <a href="#" class="btn btn-default btn-block m-t-md" id="DDD">회원가입</a>
            </div>
        </form>
          </div>
        </div>
      </div>
    </div>
   </div>
<%
 	}
%>
   
  <!-- info Register_pop_up -->   	
   <div id="register_dialog" title="Register">
   	  <div class="contentwrap">
  <article class="container">
    <div class="page-header">
	  <h1>회원가입 <small>일반회원가입</small></h1>
    </div>
   </article>
    <form class="form-horizontal" action="register.jsp" method="post" id="regijspgo">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-6">
    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="이메일">
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="pswd" name="pswd" placeholder="비밀번호">
    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인">
      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="inputName" name="name" placeholder="이름">
    </div>
    </div>
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label" id=hpnum>휴대폰번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" name="phnum" placeholder="휴대폰번호">

      <p class="help-block">- 없이 적어주세요.</p>
    </div>
   </div>

   <div class="form-group">
    <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
    <div class="col-sm-6 checkbox">
      <label>
        <input id="agree" name="agree" type="checkbox"> <a href="#" id="agreement_open" > 이용약관</a>에 동의합니다.
    </label>
    </div>
  </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary" value="register" id="register_gogo">회원가입</button>
    </div>
    </div>
    </form>
   </div>
  </div> 

</body>
</html>