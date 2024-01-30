<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>학생 출석 관리</title>
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
			hidePopup();
	});
	
function hidePopup(){
	$("#insertForm").hide();
	$("#updateForm").hide();
	
	
};

function showInsert(){
	$("#insertForm").show();
};
function showUpdate(i,t,d){
	var name = t.split("-")
	$("#updateForm").show();
	$("#updateForm").find("[name=stu_name]").val(name[0]);
	$("#updateForm").find("[name=attend_date]").val(d);
	$("#updateForm").find("[name=attend_status]").val(name[1]);
	$("#updateForm").find("[name=id]").val(i)
};


function saveData(){
	var formObj = $("#insertForm");
	ajax(
	"/insertCalendar.do"
    ,"post"
    ,formObj
    ,function(responseJson){
  	  var insertcalendarCnt = responseJson["insertcalendarCnt"];
       if(insertcalendarCnt>=1) {
          alert("등록되었습니다.");
          document.markTeaForm.submit();
       }
       else{
          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
       }
  });
}

function updateData(){
	var formObj = $("#updateForm");
	ajax(
	"/updateCalendar.do"
    ,"post"
    ,formObj
    ,function(responseJson){
		
       if(responseJson>=1) {
          alert("수정되었습니다.");
          document.markTeaForm.submit();
       }
       else{
          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
       }
  });
}
function deleteData(){
	var formObj = $("#updateForm");
	ajax(
	"/deleteCalendar.do"
    ,"post"
    ,formObj
    ,function(responseJson){
		if(responseJson>=1) {
          alert("삭제되었습니다.");
          document.markTeaForm.submit();
       }
       else{
          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
       }
  });
}


</script>
<body>
<form name="stuSearch" class="header">
						<div class="header_box">
							<div class="logo" onclick="location.replace('/teaMain.do')">
								<img src="">
								<div>
									학원명
								</div>
							</div>
							<table>
								<tr class="cate_box">
									<td class="main_cate" onclick="location.replace('/markTea.do')">수업 관리(출석)</td>
									<td class="main_cate" onclick="location.replace('/stuList.do')">학생 관리</td>
									<td class="main_cate active" onclick="location.replace('/dayOff.do')">휴가 관리</td>
									<td class="main_cate" onclick="location.replace('/examList.do')">시험 출제</td>
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
<form name="Form" class="boardForm">
					<header>
					반갑습니다 ${tea_id}님
					</header>
		<div id="calendar" style="width: 70%"></div></form>
    <form class='calendarForm' id="insertForm">
	<div class="dim">
	<div name="insert_check" class='calendar_popup'>
    <header>
    	출결 등록
    </header>
    <div>
        학생명
        <select name="stu_name">
	   	    <option value="">	</option>
	   	    <c:forEach var="stu" items="${student}" varStatus="vs">
			<option value="${stu.stu_name}">${stu.stu_name}-${stu.phone_num}</option>
			</c:forEach>
		</select>
		
     </div>
    <div>날짜 <input type="date" name="attend_date">
	   </div>
	    <div>
   	   	출석여부
   	    <select name="attend_status">
	   	    <option value="">	</option>
			<option value="출석">출석</option>
			<option value="지각">지각</option>
			<option value="조퇴">조퇴</option>
			<option value="결석">결석</option>
		</select>
   	</div>
	   <br>
   <div>
    	<input type="button" value="취소" onClick="hidePopup()">
    	<input type="button" class="save_btn" onClick="saveData()" value="제출">
    </div> 
  </div>
 </div>
   </form>
   
   
   
   
   <form class='calendarForm' id="updateForm">
	<div class="dim">
	<div name="insert_check" class='calendar_popup'>
    <header>
    	출결 수정
    </header>
    <div>
        학생명<input type="text" name="stu_name">
     </div>
     <div>날짜<input type="date" name="attend_date" disabled="disabled">
	   </div>
	    <div>
   	   	출석여부
   	    <select name="attend_status">
	   	    <option value="">	</option>
			<option value="출석">출석</option>
			<option value="지각">지각</option>
			<option value="조퇴">조퇴</option>
			<option value="결석">결석</option>
		</select>
   	</div>
	   <br>
   <div>
    	<input type="button" value="취소" onClick="hidePopup()">
    	<input type="button" class="save_btn" onClick="updateData()" value="수정">
    	<input type="button" class="save_btn" onClick="deleteData()" value="삭제">
    	<input type="hidden" name="id" value="" >
    </div> 
  </div>
 </div>
   </form>
</div>
<form name="markTeaForm" method="post" action="/markTea.do"></form> 	
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
	
    var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
    		initialView: 'dayGridMonth',
    		
    		headerToolbar: {
    		      left: 'prevYear,prev,next,nextYear today',
    		      center: 'title',
    		      right: 'addEventButton dayGridMonth,dayGridWeek,dayGridDay'
    		    }, customButtons: {
                    addEventButton: { 
                        text : "출결 등록",  
                        click : function(){ 
                        	showInsert();
                        }
                    }
    		    },
    		    locale:'ko',
    		    timeZone: 'Asia/Seoul',
            events:[ <c:forEach var="calendar" items="${getCalendarMap.getCalendar}" varStatus="vs">
            {
            	id:"${calendar.att_id}",
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
            </c:forEach>
            ],
          
            eventClick: function(info) {
            	var dateStr = info.event.start.toISOString();
            	var date = dateStr.substr(0,10)
            	var conf = confirm(date+"/"+info.event.title +" "+"이 출결을 수정 하시겠습니까?");
               
               if(conf){
            	   showUpdate(info.event.id,info.event.title,date);
                }
              }
        });
        calendar.render();
    });
</script>


</html>