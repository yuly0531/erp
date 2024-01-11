<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/registExample.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>

function goExamListForm(){
	document.ExamListForm.method="post";
	document.ExamListForm.action="/examList.do";
	document.ExamListForm.submit();
}

function checkExamUpForm(){

		var formObj = $("[name='examUpDelForm']");
		if( !checkTeaId(formObj.find("[name='tea_id']"))  )   { return; }
		
		
		if( confirm("정말 수정하시겠습니까?")==false ) { return; }
		ajax(
				"/updateExamInfo.do"
				,"post"
				,formObj
				, function( responseJson ){
					var examUpCnt = responseJson["updateExamCnt"];
					if( examUpCnt==1 ){
						alert("수정이 성공했습니다.");
						document.examListForm.submit();
					}						
					else{
						alert("수정 실패! 관리자에게 문의 바랍니다.");
					}

				}
		);
}

</script>

<title>시험 상세 보기</title>
</head>
<body>
  <form class="header">
    <div class="header_box">
      <div class="logo" onclick="location.replace('/teaMain.do')">
        <img src="">
        <div>
          ERP
        </div>
      </div>
      <table>
          <tr class="cate_box">
         <td class="main_cate" onclick="location.replace('/??.do')">수업 관리(출석)</td>
         <td class="main_cate" onclick="location.replace('/stuList.do')">학생 관리</td>
         <td class="main_cate active" onclick="location.replace('/dayOff.do')">휴가 관리</td>
         <td class="main_cate" onclick="location.replace('/examList.do')">시험 출제</td>
         <td class="main_cate" onclick="location.replace('/??.do')">근태 관리</td>
          </tr>
      </table>
      <div class="welcome_user">
        <div>
          
          <div class="welcome_name">로그아웃</div>
               </div>
        <div class="logout_btn" onclick="location.replace('/loginForm.do')"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
      </div>
      
    </div>
  </form>
  <form name="examDetail" class="boardForm">
  <div class="inform">
      <div class="dev_user">
	        <div>
	          	시험 제목 : 
	            <input type="text" name="exam_name" value="${examDetailMap.examDetailInfo[0].exam_name}"><br>
	            <br>
	        </div>
	             <div> 
	             	시험 응시일
	                <input type="date" name="exam_date" value="${examDetailMap.examDetailInfo[0].exam_date}">
	                <br>
	                <br><input type=hidden name="tea_id" value="${sessionScope.tea_id}">

	     </div>
     </div>
<c:forEach var="examDetail" items="${examDetailMap.examDetailProblem}" varStatus="vs">
    <div>
        <div>문제 ${vs.index + 1}번</div><br>
        <textarea name="exam_question${vs.index + 1}" cols="10" rows="7" maxlength="300">${examDetailMap.examDetailProblem[vs.index].exam_question}</textarea>
        <div><br>${vs.index + 1}번 답 : 
            <input type="text" name="exam_answer${vs.index + 1}" value="${examDetailMap.examDetailAnswer[vs.index].exam_answer}"> 
        </div>
    </div>
</c:forEach>

        		
		      

    <span onclick="location.replace('/examList.do')" name="cancel" class="cancel">이전</span>
    <span onclick="checkExamUpForm();" name="save" class="save">수정</span>
    </div>
   </form>
  <form name="examListForm" class="no dumP_form" method="post" action="/examList.do"></form>
</body>
</html>