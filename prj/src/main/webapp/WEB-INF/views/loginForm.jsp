<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 로그인</title>
<link rel="stylesheet" href="css/loginForm.css">
<!-- CLOUDTURING -->
<script>
    window.dyc = {
        chatbotUid: "c4b9ed8dd80c1b6e"
    };
</script>
<script async src="https://cloudturing.chat/v1.0/chat.js"></script>
<!-- End CLOUDTURING -->

<script>
	$(function(){  init();  })
	
	function init(){
		

	  $(".stu_login").show();
      $(".tea_login").hide();
      $(".mana_login").hide();
      
      $(".student").mouseup(
              function(){
                  	
                 	$(".stu_login").show();
                 	$(".tea_login").hide();
                 	$(".mana_login").hide();
                 	$(this).addClass('active').siblings('div').removeClass('active');
               }
              
             

          )
     	$(".teaructor").mouseup(
              function(){
                 	$(".stu_login").hide();
                 	$(".tea_login").show();
                 	$(".mana_login").hide();
                 	$(this).addClass('active').siblings('div').removeClass('active');
                 	}
              

      )
      
     	$(".manager").mouseup(
              function(){
                  $(".stu_login").hide();
                 	$(".tea_login").hide();
                 	$(".mana_login").show();
                 	$(this).addClass('active').siblings('div').removeClass('active');
                 	}
              
  	)
		
		
	$(".stu_loginBtn").bind("click",function(){
					
		});
		$("[name='stu_id']").val("${cookie.stu_id.value}");
		$("[name='stu_pwd']").val("${cookie.stu_pwd.value}");
		$("[name='autoLogin']").prop("checked", ${empty cookie.mid.value?false:true} );
		
	}
	

	function stu_checkLogin(){	
		var stu_id = $("[name='stu_id']").val();
		if( typeof(stu_id)!="string" ) { stu_id=""; }
		stu_id = $.trim(stu_id);
	
		var stu_pwd = $("[name='stu_pwd']").val();
		if( typeof(stu_pwd)!="string" ) { stu_pwd=""; }
		stu_pwd = $.trim(stu_pwd);
	
		if( stu_id=="" ){
			alert("아이디가 비어 있습니다.");
			return;
		}
	
		if( stu_pwd=="" ){
			alert("암호가 비어 있습니다.");
			return;
		}

		ajax(
				"/stu_loginProc.do"
				,"post"
				,$(".stu_login")
				,function(idCnt){
					if( idCnt==1 ){
						location.replace("/stuMain.do");
					} else {
						alert("아이디 또는 암호가 틀립니다. 다시 입력하시오");
						
						return;
					}
				}
		);
	}

	
	function tea_checkLogin(){	
		var tea_id = $("[name='tea_id']").val();
		if( typeof(tea_id)!="string" ) { tea_id=""; }
		tea_id = $.trim(tea_id);
	
		var tea_pwd = $("[name='tea_pwd']").val();
		if( typeof(tea_pwd)!="string" ) { tea_pwd=""; }
		tea_pwd = $.trim(tea_pwd);
	
		if( tea_id=="" ){
			alert("아이디가 비어 있습니다.");
			return;
		}
	
		if( tea_pwd=="" ){
			alert("암호가 비어 있습니다.");
			return;
		}

		ajax(
				"/tea_loginProc.do"
				,"post"
				,$(".tea_login")
				,function(idCnt){
					if( idCnt==1 ){
						location.replace("/teaMain.do");
					} else {
						alert("아이디 또는 암호가 틀립니다. 다시 입력하시오");
						return;
					}
				}
		);
	}
	
	function mana_checkLogin(){	
		var mana_id = $("[name='mana_id']").val();
		if( typeof(mana_id)!="string" ) { mana_id=""; }
		mana_id = $.trim(mana_id);
	
		var mana_pwd = $("[name='mana_pwd']").val();
		if( typeof(mana_pwd)!="string" ) { mana_pwd=""; }
		mana_pwd = $.trim(mana_pwd);
	
		if( mana_id=="" ){
			alert("아이디가 비어 있습니다.");
			return;
		}
	
		if( mana_pwd=="" ){
			alert("암호가 비어 있습니다.");
			return;
		}

		ajax(
				"/mana_loginProc.do"
				,"post"
				,$(".mana_login")
				,function(idCnt){
					if( idCnt==1 ){
						location.replace("/adminMain.do");
					} else {
						alert("아이디 또는 암호가 틀립니다. 다시 입력하시오");
						return;
					}
				}
		);
	}
</script>

</head>
<body>


  <div class="main">
  <div class="choice">
 <div class="student" style="float: left; padding: 25px;margin-top: -18px">학생</div>
 <div class="teaructor" style="float: left; padding: 25px ;margin-top: -18px; ">강사</div>
 <div class="manager" style="float: left;    padding: 25px; margin-top: -18px;">관리자</div>
 </div>
 		<!-- 학생 로그인 -->
		<form class="stu_login">
		<table>
        <div class="title">학생 로그인</div>
				<tr>
					<td>
						<input type="text" name="stu_id" placeholder="아이디" class="id">
					</td> 
				</tr> 
				<tr>
					<td>
						<input type="password" name="stu_pwd" class="pwd" placeholder="비밀번호">
					</td> 
				</tr> 
			</table>
      <div class="auto_box">
        <input type="checkbox" name="autoLogin" value="yes" class="autoLogin">
        <span class="autoTxt">자동 로그인</span>
      </div>
      <div class="button_box">
        <input type="button" value="Login" class="stu_loginBtn" onclick="stu_checkLogin()">
      </div>
      </form>
		
		<!--  강사 로그인 -->
		<form  class="tea_login">
		<table>
        <div class="title">강사 로그인</div>
				<tr>
					<td>
						<input type="text" name="tea_id" placeholder="아이디" class="id">
					</td> 
				</tr> 
				<tr>
					<td>
						<input type="password" name="tea_pwd" class="pwd" placeholder="비밀번호">
					</td> 
				</tr> 
			</table>
      <div class="auto_box">
        <input type="checkbox" name="autoLogin" value="yes" class="autoLogin">
        <span class="autoTxt">자동 로그인</span>
      </div>
      <div class="button_box">
        <input type="button" value="Login" class="tea_loginBtn" onclick="tea_checkLogin()">
      </div>
      </form>
		
		<!-- 관리자 로그인 -->
		<form  class="mana_login">
		<table>
        <div class="title">관리자 로그인</div>
				<tr>
					<td>
						<input type="text" name="mana_id" placeholder="아이디" class="id">
					</td> 
				</tr> 
				<tr>
					<td>
						<input type="password" name="mana_pwd" class="pwd" placeholder="비밀번호">
					</td> 
				</tr> 
			</table>
      <div class="auto_box">
        <input type="checkbox" name="autoLogin" value="yes" class="autoLogin">
        <span class="autoTxt">자동 로그인</span>
      </div>
      <div class="button_box">
        <input type="button" value="Login" class="mana_loginBtn" onclick="mana_checkLogin()">
      </div>
      </form>
	</div>
   
</body>

</html>















