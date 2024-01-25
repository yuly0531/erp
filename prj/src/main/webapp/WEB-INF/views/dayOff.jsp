<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
<link href="css/dayOff.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 </head>
 
 <script>
 
 $(function(){ init(); });
 
 
 function init(){
 	hidePopup();
 };
 
 function hidePopup(){
 	$("#stuOff").hide();
 	$("#teaOff").hide();
 };
 
 function showStuPopup(){
 	$("#stuOff").show();
 };
 
 function showTeaPopup(){
 	$("#teaOff").show();
 	
 };
 
 function save(){
	 <c:if test="${whatRole eq '학생'}">
 	var formObj = $("#stuOff");
	if( confirm("신청 하시겠습니까?")==false ) { return; }
	var startclock = formObj.find('[name=dayoff_start]').val()
	var endclock = formObj.find('[name=dayoff_end]').val()
	formObj.find('[name=dayoff_start]').val(startclock);
	formObj.find('[name=dayoff_end]').val(endclock);
		ajax(
				"/insertStuOff.do"
				,"post"
				,formObj
				,function(responseJson){
					var StuOffRegCnt = responseJson["StuOffRegCnt"]; 
					if( StuOffRegCnt==1 ){
						alert("신청이 완료되었습니다.");
						document.dayOffFormLink.submit();
					}
					else{
						alert( "신청에 실패하였습니다. 잠시 후에 시도해주세요.");
					}
				}
		);
		</c:if>
		 <c:if test="${whatRole eq '강사'}">
		 	var formObj = $("#teaOff");
			var startclock = formObj.find('[name=tea_dayoff_start]').val()
			var endclock = formObj.find('[name=tea_dayoff_end]').val()
			formObj.find('[name=tea_dayoff_start]').val(startclock);
			formObj.find('[name=tea_dayoff_end]').val(endclock);
			alert(endclock)
			if( confirm("신청 하시겠습니까?")==false ) { return; }
				ajax(
						"/insertTeaOff.do" 
						,"post"
						,formObj
						,function(responseJson){
							var TeaOffRegCnt = responseJson["TeaOffRegCnt"]; 
							if( TeaOffRegCnt==1 ){
								alert("신청이 완료되었습니다.");
								document.dayOffFormLink.submit();
							}
							else{
								alert( "신청에 실패하였습니다. 잠시 후에 시도해주세요.");
							}
						}
				);
				</c:if>
	};
 </script>
  <script>
   
   /* 
    function search(){
    	<c:if test="${sessionScope.stu_id==stu_id}">
    	var formObj = $("#StudayOffList");
		ajax(
				"/dayOff.do"
				,"post"
				,formObj
				,function(responseJson){
					var DayoffRegCnt = responseJson["DayoffRegCnt"]; 
					alert(DayoffRegCnt)
				}
		);
			</c:if>
			var formObj = $("#stuOff");
			ajax(
					"/dayOff.do"
					,"post"
					,function(responseJson){
						var DayoffRegCnt = responseJson["DayoffRegCnt"]; 
						if( DayoffRegCnt==1 ){
							alert("신청이 완료되었습니다.");
							dayOffForm();
						}
						else{
							alert( "신청에 실패하였습니다. 잠시 후에 시도해주세요.");
						}
					}
    	
    	
    };
    
    */
  
    
  

 </script>
 
 </head>
 <body>
 <form class="header">
        <div class="header_box">
        <!-- !!!!!!!!!!!학생 헤더!!!!!!!! -->
        <c:if test="${whatRole eq '학생'}">
          	<div class="logo" onclick="location.replace('/studentMain.do')">
				<img src="">
				<div>
					학원명
				</div>
			</div>
			<table>
				<tr class="cate_box">
          			<td class="main_cate" onclick="location.replace('/mark.do')">출석현황</td>
					<td class="main_cate active" onclick="location.replace('/dayOff.do')">휴가신청</td>
					<td class="main_cate" onclick="location.replace('/testList.do')">시험응시</td>
					<td class="main_cate" onclick="location.replace('/checkGrade.do')">성적확인</td>
				</tr>
			</table>
		</c:if> 
		
		 <!-- !!!!!!!!!!!강사 헤더!!!!!!!! -->
        <c:if test="${whatRole eq '강사'}">
          <div class="logo" onclick="location.replace('/teaMain.do')">
            <img src="">
            <div>
              ERP
            </div>
          </div>
          <table>
            <tr class="cate_box">
			<td class="main_cate" onclick="location.replace('/markTea.do')">수업 관리(출석)</td>
			<td class="main_cate" onclick="location.replace('/stuList.do')">학생 관리</td>
			<td class="main_cate active" onclick="location.replace('/dayOff.do')">휴가 관리</td>
			<td class="main_cate" onclick="location.replace('/examList.do')">시험 출제</td>
			<td class="main_cate" onclick="location.replace('/??.do')">근태 관리</td>
          </tr>
          </table>
		</c:if> 
		
		<!-- !!!!!!!!!!!관리자 헤더!!!!!!!! -->
		<c:if test="${whatRole eq '관리자'}">
          	<div class="logo" onclick="location.replace('/adminMain.do')">
				<img src="">
				<div>
					ERP
				</div>
			</div>
			<table>
				<tr class="cate_box">
	         		<td class="main_cate" onclick="location.replace('/stuList.do')">학생 관리</td>
					<td class="main_cate" onclick="location.replace('/teaList.do')">강사 관리</td>
					<td class="main_cate" onclick="location.replace('/classList.do')">수업 관리</td>
					<td class="main_cate active" onclick="location.replace('/dayOff.do')">결재 관리</td>
				</tr>
			</table>
		</c:if> 
		<div class="welcome_user">
			<div>
				<div class="welcome_name">로그아웃</div>
			</div>
			<div class="logout_btn" onclick="location.replace('/loginForm.do')"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
		</div>
        </div>
        </form>
        <!-- !!!!!!!!!!!학생 헤더밑에 보이는 내용들!!!!!!!! -->
        <c:if test="${whatRole eq '학생'}">
        <form id="StudayOffList" class="day	OffList">
        <header>휴가 관리</header>
		<table class="search_bar"> 
			<tr>
				<td class="searchbar_box">
					<input type="text" name="keyword1">
					<input class="search_btn" type="button" value="검색" onclick="search()">
					<input class="search_btn" type="button" value="휴가 신청" onclick="showStuPopup()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" value="1">
		
		<input type="hidden" name="sort">
		<table>
	        <section class="count_desc">
	          <section class="searchResultCnt">
	              <div class="impect">전체 : ${requestScope.getStuOff.dayoffListCnt} 개</div> 
	         </section>
	          <select name="rowCntPerPage" onChange="search()" class="rownum">
	                  <option value="10">10 
	                  <option value="15">15 
	                  <option value="20">20 
	            </select>&nbsp;행 
	        </section>
		</table>
		<div>
	</div>
	<div class="search_list">	
			<div>
				<c:forEach var="board" items="${requestScope.getStuOff.dayoffList}" varStatus="vs">
					<div onClick="goBoardDetailForm(${board.day_id})" class="search_con">
						<div class="b_no">${requestScope.getStuOff.begin_serialNo_desc-vs.index}</div> 
						<div class="subject">${board.dayoff_kind}</div>
						<div class="writer">${board.stu_name}</div>
						<div class="view_i">
							<div class="reg_date list_reg">
								<i class="fa fa-calendar-o" aria-hidden="true"></i>
                <span class="reg_date">${board.application_date}</span>
							</div>
							<div class="readcount">
                <span style="font-size: 12px">${board.payment_status}</span>
							</div> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="pageNos"> 
			<span onClick="pageNoClick(1)"><i class="fa fa-angle-left" aria-hidden="true"></i><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<span onClick="pageNoClick(${requestScope.getStuOff.selectPageNo}-1)"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<c:forEach var="pageNo" begin="${requestScope.getStuOff.begin_pageNo}" end="${requestScope.getStuOff.end_pageNo}">
				<c:if test="${requestScope.getStuOff.selectPageNo==pageNo}">
					<span class="isClick">${pageNo}</span>
				</c:if>
				<c:if test="${requestScope.getStuOff.selectPageNo!=pageNo}">
					<span class="unClick" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span onClick="pageNoClick(${requestScope.getStuOff.selectPageNo}+1)"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
			<span onClick="pageNoClick(${requestScope.getStuOff.last_pageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i><i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</div>
	</form>
	</c:if> <!-- !!!!!!!!!!!강사 헤더밑에 보이는 내용들!!!!!!!! -->
        <c:if test="${whatRole eq '강사'}">
        <form id="StuandTeadayOffList" class="day	OffList">
        <header>휴가 관리</header>
		<table class="search_bar"> 
			<tr>
				<td class="searchbar_box">
					<input type="text" name="keyword1">

					<input class="search_btn" type="button" value="검색" onclick="search()">
					<input class="search_btn" type="button" value="휴가 신청" onclick="showTeaPopup()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" value="1">
		
		<input type="hidden" name="sort">
		<table>
	        <section class="count_desc">
	          <section class="searchResultCnt">
	              <div class="impect">전체 : ${requestScope.getStuOff.dayoffListCnt+requestScope.getTeaOff.getTeaOffCnt} 개</div> 
	         </section>
	          
	            <select name="rowCntPerPage" onChange="search()" class="rownum">
	                  <option value="10">10 
	                  <option value="15">15 
	                  <option value="20">20 
	            </select>&nbsp;행 
	        </section>
		</table>
		<div>
	</div>
	<div class="search_list">	
			<div>
				<c:forEach var="board" items="${requestScope.boardMap.boardList}" varStatus="vs">
					<div onClick="goBoardDetailForm(${board.b_no})" class="search_con">
						<div class="b_no">${requestScope.boardMap.begin_serialNo_desc-vs.index}</div> 
						<div class="subject">${board.subject}</div>
						<div class="writer">${board.writer}</div>
						<div class="view_i">
							<div class="reg_date list_reg">
								<i class="fa fa-calendar-o" aria-hidden="true"></i>
                <span class="reg_date">${board.reg_date}</span>
							</div>`	
							<div class="readcount">
								<i class="fa fa-eye" aria-hidden="true"></i>
                <span>${board.readcount}</span>
							</div> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="pageNos"> 
			<span onClick="pageNoClick(1)"><i class="fa fa-angle-left" aria-hidden="true"></i><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<span onClick="pageNoClick(${requestScope.boardMap.selectPageNo}-1)"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<c:forEach var="pageNo" begin="${requestScope.boardMap.begin_pageNo}" end="${requestScope.boardMap.end_pageNo}">
				<c:if test="${requestScope.boardMap.selectPageNo==pageNo}">
					<span class="isClick">${pageNo}</span>
				</c:if>
				<c:if test="${requestScope.boardMap.selectPageNo!=pageNo}">
					<span class="unClick" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span onClick="pageNoClick(${requestScope.boardMap.selectPageNo}+1)"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
			<span onClick="pageNoClick(${requestScope.boardMap.last_pageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i><i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</div>
	</form>
	</c:if>
        
        <!-- !!!!!!!!!!!관리자 헤더밑에 보이는 내용들!!!!!!!! -->
        <c:if test="${whatRole eq '관리자'}">
        <form id="AlldayOffList" class="day	OffList">
        <header>휴가 관리</header>
		<table class="search_bar"> 
			<tr>
				<td class="searchbar_box">
					<input type="text" name="keyword1">

					<input class="search_btn" type="button" value="검색" onclick="search()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" value="1">
		
		<input type="hidden" name="sort">
		<table>
	        <section class="count_desc">
	          <section class="searchResultCnt">
	              <div class="impect">전체 : ${requestScope.getStuOff.dayoffListCnt+requestScope.getTeaOff.getTeaOffCnt} 개</div> 
	         </section>
	          
	            <select name="rowCntPerPage" onChange="search()" class="rownum">
	                  <option value="10">10 
	                  <option value="15">15 
	                  <option value="20">20 
	            </select>&nbsp;행 
	        </section>
		</table>
		<div>
	</div>
	<div class="search_list">	
			<div>
				<c:forEach var="board" items="${requestScope.boardMap.boardList}" varStatus="vs">
					<div onClick="goBoardDetailForm(${board.b_no})" class="search_con">
						<div class="b_no">${requestScope.boardMap.begin_serialNo_desc-vs.index}</div> 
						<div class="subject">${board.subject}</div>
						<div class="writer">${board.writer}</div>
						<div class="view_i">
							<div class="reg_date list_reg">
								<i class="fa fa-calendar-o" aria-hidden="true"></i>
                <span class="reg_date">${board.reg_date}</span>
							</div>
							<div class="readcount">
								<i class="fa fa-eye" aria-hidden="true"></i>
                <span>${board.readcount}</span>
							</div> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="pageNos"> 
			<span onClick="pageNoClick(1)"><i class="fa fa-angle-left" aria-hidden="true"></i><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<span onClick="pageNoClick(${requestScope.boardMap.selectPageNo}-1)"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<c:forEach var="pageNo" begin="${requestScope.boardMap.begin_pageNo}" end="${requestScope.boardMap.end_pageNo}">
				<c:if test="${requestScope.boardMap.selectPageNo==pageNo}">
					<span class="isClick">${pageNo}</span>
				</c:if>
				<c:if test="${requestScope.boardMap.selectPageNo!=pageNo}">
					<span class="unClick" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span onClick="pageNoClick(${requestScope.boardMap.selectPageNo}+1)"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
			<span onClick="pageNoClick(${requestScope.boardMap.last_pageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i><i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</div>
	</form>
	</c:if>
	  <!--  !!!!!!!!!학생 휴가신청 팝업!!!!!!!!!!!!!!!!!!!! -->
<c:if test="${whatRole eq '학생'}">
<form class='dayOffForm' id="stuOff">
	<div class="dim">
	<div class='dayOffForm_popup'>
    <header>
    	휴가 신청
    </header>
      <div>
          휴가 시작일
          <input type="datetime-local" name="dayoff_start">
          &nbsp;~&nbsp;  
          휴가 종료일
          <input type="datetime-local" name="dayoff_end">
     </div>
   	 <div>
   	   	휴가 종류
   	    <select name="dayoff_kind">
	   	    <option value="">	
			<option value="휴가">휴가
			<option value="병가">병가
			<option value="조퇴">조퇴
			<option value="지각">지각
			<option value="기타">기타
		</select>
   	</div>
	   <div>
			신청자 :
	            <input type="text" name="stu_name">
	   </div>
	   <div>
	         내용
	            <textarea cols="100" rows="15" name="etc"></textarea>
	   </div> <br>
   <div>
   <input type="hidden" name="stu_id" value="${stu_id}">
    	<input type="button" value="취소" onClick="hidePopup()">
    	<input type="button" class="save_btn" value="제출" onClick="save()">
   </div> 
  </div>
  </div>
</form>
</c:if>

 <!-- !!!!!!!!!강사 휴가신청 팝업!!!!!!!!!!!!!!!!!!!! -->
<c:if test="${whatRole eq '강사'}">
<form class='dayOffForm' id="teaOff">
	<div class="dim">
	<div class='dayOffForm_popup'>
    <header>
    	휴가 신청
    </header>
      <div>
          휴가 시작일
          <input type="datetime-local" name="tea_dayoff_start">
          &nbsp;~&nbsp;  
          휴가 종료일
          <input type="datetime-local" name="tea_dayoff_end">
     </div>
   	 <div>
   	   	휴가 종류
   	    <select name="tea_dayoff_kind">
	   	    <option value="">	
			<option value="연차">연차
			<option value="반차">반차
			<option value="병가">병가
			<option value="휴직">휴직
			<option value="기타">기타
		</select>
   	</div>
	   <div>
			신청자 :
	            <input type="text" name="tea_name">
	   </div>
	   <div>
	         내용
	            <textarea cols="100" rows="15" name="tea_etc"></textarea>
	   </div> <br>
   <div>
     <input type="hidden" name="tea_id" value="${tea_id}">
    	<input type="button" value="취소" onClick="hidePopup()">
    	<input type="button" class="save_btn" value="제출" onClick="save()">
   </div> 
  </div>
  </div>
</form>
</c:if>
	 
	
   <form name="dayOffFormLink" method="post" action="/dayOff.do">
   </form> 
 </body>
 </html>