<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link href="css/dayOff.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <script>
 $(function(){
	
	 init()
	 });
 
 function init(){
	 hidePopup();
};

function hidePopup(){
	$("#updelForm").hide();
};
	
function showPopup(){
	$("#updelForm").show();
};

function godayOffForm(){
	document.dayOffForm.submit();
}
 
 function updateData(){
	 var formObj = $("#updelForm");
	 if(confirm("수정하시겠습니까?")==false){return;}
	 <c:if test="${whatRole eq '학생'}">
					ajax(
					"/updateStuOff.do"
				    ,"post"
				    ,formObj
				    ,function(responseJson){
						if(responseJson>=1) {
				          alert("수정되었습니다.");
				          godayOffForm();
				       }
				       else{
				          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
				       }
				  });
	</c:if>
	<c:if test="${whatRole eq '강사'}">
			ajax(
			"/updateTeaOff.do"
		    ,"post"
		    ,formObj
		    ,function(responseJson){
				if(responseJson>=1) {
		          alert("수정되었습니다.");
		          godayOffForm();
		       }
		       else{
		          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
		       }
		  });
</c:if>
	};
	
 function deleteData(){
	 var formObj = $("#updelForm");
	 if(confirm("삭제하시겠습니까?")==false){return;}
	 <c:if test="${whatRole eq '학생'}">
			ajax(
				"/deleteStuOff.do"
			    ,"post"
			    ,formObj
			    ,function(responseJson){
					if(responseJson>=1) {
			          alert("삭제되었습니다.");
			          godayOffForm();
			       }
			       else{
			          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
			       }
			  });
			</c:if>
			<c:if test="${whatRole eq '강사'}">
					ajax(
							"/deleteTeaOff.do"
						    ,"post"
						    ,formObj
						    ,function(responseJson){
								if(responseJson>=1) {
						          alert("삭제되었습니다.");
						          godayOffForm();
						       }
						       else{
						          alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
						       }
						  });
				</c:if>
		
};
function result(resultText){
	if( confirm(resultText+" 하시겠습니까?")==false ) { return; }
	$("[name='resultText'] [name='payment_status']").val(resultText);
	$("[name='resultText'] [name='tea_payment_status']").val(resultText);
	var formObj = $("[name='resultText']")
	
	ajax(
			"/DayOffResult.do"
			,"post"
			,formObj
			,function(responseJson){
				var stu_DayoffUpCnt = responseJson["stu_DayoffUpCnt"];
				var tea_DayoffUpCnt = responseJson["tea_DayoffUpCnt"];
				if(stu_DayoffUpCnt>=1||tea_DayoffUpCnt>=1
						){
					alert(resultText+"완료 되었습니다.");
					godayOffForm();
				}
				else{
					alert("결재 처리 중 오류가 발생했습니다. 다시 시도해주십시오.")
				}
		 });
	
}
 
 </script>
 </head>
<body>
	<form class="header">
        <div class="header_box">
        
        <c:if test="${whatRole eq '학생'}">
          	<div class="logo" onclick="location.replace('/stuMain.do')">
				<img src="">
				<div>
					학원명
				</div>
			</div>
			<table>
				<tr class="cate_box">
          			<td class="main_cate" onclick="location.replace('/mark.do')">출석 현황</td>
					<td class="main_cate active" onclick="location.replace('/dayOff.do')">휴가 신청</td>
					<td class="main_cate" onclick="location.replace('/examList.do')">시험</td>
				</tr>
			</table>
		</c:if> 
		
		 
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
          </tr>
          </table>
		</c:if> 
		
		
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
        
         <c:if test="${whatRole eq '학생'}">
        <form class="dayOffList">
       <header>결재 내용 상세보기</header>
			<div class="gyeoljaeDetail_desc">
				<div>
					<div> 등록일 : ${dayOff.application_date}</div>
				</div>
				<div>
					<div class="gyeoljae_progress">결재상태 : ${dayOff.payment_status}</div>
				</div>
				
				<div>
					<div class="writer">요청자 : ${dayOff.stu_name}</div>
				</div>
				
				<div>
					<textarea style="border: 1px solid lightgrey; padding: 15px; width: 500px;height: 200px; font-size: 15px;" readonly>
					
					종류 : ${dayOff.dayoff_kind}
					시작일 : ${dayOff.dayoff_start}
					종료일 : ${dayOff.dayoff_end}
					비고 : ${dayOff.etc}</textarea>
				</div>
			</div>
			<span class="backList" onClick="godayOffForm()">
					<i class="fa fa-bars" aria-hidden="true"></i>
					<span>목록</span>
				</span>
				<c:if test="${sessionScope.stu_id==dayOff.stu_id}">
				<span class="backList alterBoard" onClick="showPopup()">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<span>수정/삭제</span>
				</span>
				</c:if>
	</form>
	
	
	<form class='dayOffForm' id="updelForm">
			<div class="dim">
			<div class='dayOffForm_popup'>
		    <header>
		    	수정 및 삭제
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
					<input type="text" value="${dayOff.stu_name}" disabled="disabled">
					
			   </div>
			   <div>
			         내용
			            <textarea cols="100" rows="15" name="etc"></textarea>
			   </div> <br>
		   <div>
		   <input type="hidden" name="day_id" value="${param.day_id}">
		    	<input type="button" value="취소" onClick="hidePopup()">
		    	<input type="button" class="save_btn" value="수정" onClick="updateData()">
		    	<input type="button" class="save_btn" value="삭제" onClick="deleteData()">
		   </div> 
		  </div>
		  </div>
		</form>
		</c:if>
		
		
		  <c:if test="${whatRole eq '강사'||whatRole eq '관리자'}">
        <form class="dayOffList">
       <header>결재 내용 상세보기</header>
			<div class="gyeoljaeDetail_desc">
				<div>
					<div> 등록일 : ${tea_dayOff.tea_application_date}${dayOff.application_date}</div>
				</div>
				<div>
					<div>결재상태 : ${tea_dayOff.tea_payment_status}${dayOff.payment_status}</div>
				</div>
				
				<div>
					<div class="writer">요청자 : ${tea_dayOff.tea_name}${dayOff.stu_name}</div>
				</div>
				<div>
					<textarea style="border: 1px solid lightgrey; padding: 15px; width: 500px;height: 200px; font-size: 15px;" readonly>
					
					종류 : ${dayOff.dayoff_kind}${tea_dayOff.tea_dayoff_kind}
					시작일 : ${dayOff.dayoff_start}${tea_dayOff.tea_dayoff_start}
					종료일 : ${dayOff.dayoff_end}${tea_dayOff.tea_dayoff_end}
					비고 : ${dayOff.etc}${tea_dayOff.tea_etc}</textarea>
				</div>
			</div>
			<span class="backList" onClick="godayOffForm()">
					<i class="fa fa-bars" aria-hidden="true"></i>
					<span>목록</span>
				</span>
				<c:if test="${dayOff.payment_status!='반려' && dayOff.payment_status!='승인'&&
				tea_dayOff.tea_payment_status!='반려' && tea_dayOff.tea_payment_status!='승인'}">
				<c:if test="${sessionScope.tea_id==tea_dayOff.tea_id}">
				<span class="backList alterBoard" onClick="showPopup()">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<span>수정/삭제</span>
				</span>
				</c:if>
				<c:if test="${whatRole eq '관리자'}">
				<span onClick="result('승인');">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<span>승인</span>
				</span>
				<span onClick="result('반려');">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<span>반려</span>
				</span>
				</c:if>
				</c:if>
	</form>
	
	<form class='dayOffForm' id="updelForm">
			<div class="dim">
			<div class='dayOffForm_popup'>
		    <header>
		    	수정 및 삭제
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
					<input type="text" value="${tea_dayOff.tea_name}" disabled="disabled">
					
			   </div>
			   <div>
			         내용
			            <textarea cols="100" rows="15" name="tea_etc"></textarea>
			   </div> <br>
		   <div>
		   <input type="hidden" name="tea_day_id" value="${param.tea_day_id}">
		    	<input type="button" value="취소" onClick="hidePopup()">
		    	<input type="button" class="save_btn" value="수정" onClick="updateData()">
		    	<input type="button" class="save_btn" value="삭제" onClick="deleteData()">
		   </div> 
		  </div>
		  </div>
		</form>
		</c:if>
		
		<form name="dayOffForm" method="post" action="/dayOff.do"> </form>
		<form name="resultText">
				<input type="hidden" name="payment_status" value="${requestScope.dayOff.payment_status}">
				<input type="hidden" name="tea_payment_status" value="${requestScope.tea_dayOff.tea_payment_status}">
				<input type="hidden" name="day_id" value="${param.day_id}">
			<input type="hidden" name="tea_day_id" value="${param.tea_day_id}">
			</form>
</body>
 </html>