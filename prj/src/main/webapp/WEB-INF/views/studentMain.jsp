<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>학생페이지</title>
<link href="css/stuList.css" rel="stylesheet">
<link rel="stylesheet" href="/js/main.min.css">
<script src="/js/main.min.js"></script>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });
</script>
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
									<td class="main_cate" onclick="location.replace('/dayOff.do')">휴가신청</td>
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
<div  style="width: 1300px">
<div  style="width: 600px;height: 600px;border: 2px solid lightgray;  text-align:center; float: left; padding:5px; background-color: white"><b>출석 현황</b><br>
					<div id='calendar'></div>
					</div>
					<div style="width: 600px;margin-left:10px ; height: 600px; border: 2px solid lightgray;  text-align:center; float: left; padding:11px ;background-color: white"><b>수업 참여율</b></div>
					</div>
					<div style="width: 1300px ">
					<div style="width: 600px;margin-top: 20px; height: 600px; border: 2px solid lightgray;  text-align:center; float: left; padding:11px;background-color: white"><b>시험정보</b><br>
					시험응시 현황 및 예정일자<br>
					성적 확인 여부 등</div>
					<div style="width: 600px; margin-top: 20px;height: 600px;margin-left:10px ; border: 2px solid lightgray;  text-align:center; float: left; padding:11px;background-color: white"><b>휴가 신청 현황</b><br>
					신청한 휴가<br>휴가 결재 신청 현황등</div>
					</div>
				</form>			
			</div>
</body>


</html>