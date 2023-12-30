<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>출석현황</title>
<link href="css/stuList.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<html>
		<body>
				<form name="stuSearch" class="header">
						<div class="header_box">
							<div class="logo" onclick="location.replace('/studentMain.do')">
								<img src="">
								<div>
									학원명
								</div>
							</div>
							<table>
								<tr class="cate_box">
              						<td class="main_cate" onclick="location.replace('/mark.do')">출석현황</td>
									<td class="main_cate" onclick="location.replace('/holiday.do')">휴가신청</td>
									<td class="main_cate" onclick="location.replace('/testList.do')">시험응시</td>
									<td class="main_cate" onclick="location.replace('/checkGrade.do')">성적확인</td>
								</tr>
							</table>
							<div class="welcome_user">
								<div>
									
							<div class="welcome_name">로그아웃</div>
							
									</div>
								<div class="logout_btn" onclick="location.replace('/loginForm.do')"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
							</div>
							<br>
						</div>
			</form>

			<div onscroll="checkScroll(this)">
				<form name="searchstuDevForm" class="boardForm">
					<header>
					🌈반갑습니다 ${stu_id}님
					</header>
					<div  style="width: 1600px;height:500px;border: 2px solid lightgray;  text-align:center; float: left; padding:11px; background-color: white">
					성적확인 여기서 하는듯 이의신청도 넣으면 좋지않을까?
					</div>
				</form>			
			</div>
</body>


</html>