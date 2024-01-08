<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>학생출석관리</title>
<link href="css/stuList.css" rel="stylesheet">
<link rel="stylesheet" href="/js/main.min.css">
<script src="/js/main.min.js"></script>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<script>

document.addEventListener('DOMContentLoaded', function () {
var calendarEl = document.getElementById('calendar');
           var calendar = new FullCalendar.Calendar(calendarEl, {
               timeZone: 'UTC',
               initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
               events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                   {
                   	<c:forEach var="calendar" items="${getCalendarMap.getCalendar}" varStatus="vs">
       				title:"${calendar.stu_name}"+"${calendar.attend_status}",
                       start:"${calendar.attend_date}",
                   	</c:forEach>
                       
                       // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                   }
               ], headerToolbar: {
                   center: 'addEventButton' // headerToolbar에 버튼을 추가
               }, customButtons: {
                   addEventButton: { // 추가한 버튼 설정
                       text : "일정 추가",  // 버튼 내용
                       click : function(){ // 버튼 클릭 시 이벤트 추가
                           $("#calendarModal").modal("show"); // modal 나타내기
						$("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                               var content = $("#calendar_content").val();
                               var start_date = $("#calendar_start_date").val();
                               var end_date = $("#calendar_end_date").val();
                               
                               //내용 입력 여부 확인
                               if(content == null || content == ""){
                                   alert("내용을 입력하세요.");
                               }else if(start_date == "" || end_date ==""){
                                   alert("날짜를 입력하세요.");
                               }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                   alert("종료일이 시작일보다 먼저입니다.");
                               }else{ // 정상적인 입력 시
                                   var obj = {
                                       "title" : content,
                                       "start" : start_date,
                                   }//전송할 객체 생성

                                 
                               }
                           });
                       }
                   }
               },
               editable: true, // false로 변경 시 draggable 작동 x 
               displayEventTime: false // 시간 표시 x
           });
           calendar.render();
       });


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
									<td class="main_cate" onclick="location.replace('/dayOff.do')">휴가 관리</td>
									<td class="main_cate" onclick="location.replace('/registExample.do')">시험 출제</td>
									<td class="main_cate" onclick="location.replace('/??.do')">근태 관리</td>
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
					반갑습니다 ${tea_id}님
					</header>
					 <div id="calendarBox">
        <div id="calendar"></div>
        <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
    </div>
    </div>
    </div>
    </div>
    </div>
  
</form>					
</div>
</body>


</html>