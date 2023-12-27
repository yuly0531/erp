<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/loginForm.css">
<script>
	$(function(){   init();  })
	function init(){	
		$(".loginBtn").bind("click",function(){
			checkLoginForm();			
		});
		$("[name='mid']").val("${cookie.mid.value}");
		$("[name='pwd']").val("${cookie.pwd.value}");
		$("[name='autoLogin']").prop("checked", ${empty cookie.mid.value?false:true} );
	}
	
	function checkLoginForm(){			
		var mid = $("[name='mid']").val();
		if( typeof(mid)!="string" ) { mid=""; }
		mid = $.trim(mid);
	
		var pwd = $("[name='pwd']").val();
		if( typeof(pwd)!="string" ) { pwd=""; }
		pwd = $.trim(pwd);

		var role = $("[name='role']:checked").val();
		
		if( mid=="" ){
			alert("아이디가 비어 있음! 입력 바람");
			return;
		}
	
		if( pwd=="" ){
			alert("암호가 비어 있음! 입력 바람");
			return;
		}

		ajax(
				"/loginProc.do"
				,"post"
				,$("[name='loginForm']")
				,function(idCnt){
					if( idCnt==1 ){
						if(role=="student"){
							location.replace("/stuMain.do");
						}
						else if(role=="teacher"){
							location.replace("/teaMain.do");
						}
						else if(role=="manager"){
							location.replace("/adminMain.do");
						}
					} else {
						alert("로그인 실패! 아이디 또는 암호가 틀립니다. 재입력해 주십시요!");
						return;
					}
				}
		);
	}
</script>

</head>
<body>
  <div class="main">
		<form name="loginForm">
			<table>
        <div class="title">Welcome, ERP</div>
				<tr>
					<td>
						<input type="text" name="mid" placeholder="아이디" class="mid">
					</td> 
				</tr> 
				<tr>
					<td>
						<input type="password" name="pwd" class="pwd" placeholder="비밀번호">
					</td> 
				</tr> 
			</table>
      <div class="role_box">
	        <input type="radio" name="role" value="student" class="stu">
	        <span class="stuTxt">학생</span>
	        <input type="radio" name="role" value="teacher" class="tea">
	        <span class="teaTxt">강사</span>
	        <input type="radio" name="role" value="manager" class=mana>
	        <span class="adminTxt">관리자</span>
      </div>
      <div class="button_box">
        <input type="button" value="Login" class="loginBtn" onclick="checkLoginForm()">
      </div>
		</form>
  </div>
</body>
</html>













