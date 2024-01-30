<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>출석현황</title>
<link href="css/stuList.css" rel="stylesheet">
<link rel="stylesheet" href="/js/main.min.css">
<script src="/js/main.min.js"></script>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<script>
$(function(){
	  
	   window.onpageshow = function(event) {
	   if (event.persisted) {
	              ﻿location.reload(true);﻿
		    }
		}
		$(window).bind("pageshow", function(event) {
		if (event.originalEvent && event.originalEvent.persisted){
		              ﻿location.reload(true);﻿
		    }
		});﻿

})

function goMarkForm(){
    document.markForm.submit();
}

</script>
		<body>
				<form name="stuSearch" class="header">
						<div class="header_box">
							<div class="logo" onclick="location.replace('/stuMain.do')">
								<img src="">
								<div>
									학원명
								</div>
							</div>
							<table>
								<tr class="cate_box">
              						<td class="main_cate" onclick="location.replace('/mark.do')">출석 현황</td>
									<td class="main_cate" onclick="location.replace('/dayOff.do')">휴가 신청</td>
									<td class="main_cate" onclick="location.replace('/examList.do')">시험</td>
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
				<form name="CalendarForm" class="boardForm">
					<header>
					반갑습니다 ${stu_id}님
					</header>
					 <div id="calendarBox"style="width: 70%" >
       				 <div id="calendar" ></div>
         			</div>
       </form>	
       <form name="markForm" method="post" action="/mark.do"></form>		
		</div>
		</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
	
    var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
    		initialView: 'dayGridMonth',
    		headerToolbar: {
    		      left: 'prevYear,prev,next,nextYear today',
    		      center: 'title',
    		      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    		    },
    		    locale:'ko',
    		    timeZone: 'Asia/Seoul',
            events:[ 
            	
            	<c:forEach var="calendar" items="${selectCalendarMap.selectCalendar}" varStatus="vs">
            	<c:if test="${sessionScope.stu_id==calendar.stu_id}">
            {
            	
            	title:"${calendar.stu_name}"+"-"+"${calendar.attend_status}",
                start:"${calendar.attend_date}",
                color:
                <c:if test="${calendar.attend_status eq '출석'}">
                "blue"
                </c:if>
                <c:if test="${calendar.attend_status eq '결석'}">
                "red"
                </c:if>
                <c:if test="${calendar.attend_status eq '조퇴'}">
                "gold"
                </c:if>
                <c:if test="${calendar.attend_status eq '지각'}">
                "green"
                </c:if>
       		},
       		</c:if>
            </c:forEach>
            ],
            editable: true
        });
        calendar.render();
    });
    

</script>
</html>