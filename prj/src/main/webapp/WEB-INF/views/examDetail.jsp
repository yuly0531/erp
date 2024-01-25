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

      var formObj = $("[name='examDetail']");
      
      if( confirm("정말 수정하시겠습니까?")==false ) { return; }
      ajax(
            "/updateExamInfo.do"
            ,"post"
            ,$("[name='examDetail']")
            , function( updateExamCnt ){
               alert(updateExamCnt)
               if( updateExamCnt>=1 ){
                  alert("수정이 성공했습니다.");
                  document.examListForm.submit();
               }                  
               else{
                  alert("수정 실패! 관리자에게 문의 바랍니다.");
               }

            }
      );
} 
 function checkExamDelForm(){

     var formObj = $("[name='examDetail']");
     
     if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
     ajax(
           "/deleteExamInfo.do"
           ,"post"
           ,$("[name='examDetail']")
           , function( deleteExamCnt ){
              if( deleteExamCnt>=1 ){
                 alert("시험이 삭제되었습니다.");
                 document.examListForm.submit();
              }                  
              else{
                 alert("삭제 실패! 관리자에게 문의 바랍니다.");
              }

           }
     );
} 

 
 function checkExamGradeForm() {
	    if( confirm("제출 하시겠습니까? 제출 이후 수정이 불가능합니다.")==false ) { return; }
	    var score = 0;
	    for (var i = 1; i <= 10; i++) {
	        if ($('[name="exam_answer' + i + '"]').val() === $('input[name="stu_exam_answer' + i + '"]').val()) {
	        	score = score + 10;
	        }
	    }
	    
	    $('[name="score"]').val(score)
	    
	     ajax(
	           "/registExamScore.do"
	           ,"post"
	           ,$("[name='examDetail']")
	           , function( examScoreRegCnt ){
	              if( examScoreRegCnt>=1 ){
	                 alert("제출이 완료되었습니다.\n시험 성적 : "+score+"점");
	                 document.examListForm.submit();
	              }                  
	              else{
	                 alert("제출 실패! 관리자에게 문의 바랍니다.");
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
      <c:if test="${whatRole eq '강사'}">
          <tr class="cate_box">
         <td class="main_cate" onclick="location.replace('/??.do')">수업 관리(출석)</td>
         <td class="main_cate" onclick="location.replace('/stuList.do')">학생 관리</td>
         <td class="main_cate" onclick="location.replace('/dayOff.do')">휴가 관리</td>
         <td class="main_cate active" onclick="location.replace('/examList.do')">시험 출제</td>
          </tr>
      </c:if>
      <c:if test="${whatRole eq '학생'}">
          <tr class="cate_box">
	        <td class="main_cate" onclick="location.replace('/mark.do')">출석현황</td>
			<td class="main_cate" onclick="location.replace('/dayOff.do')">휴가신청</td>
			<td class="main_cate" onclick="location.replace('/examList.do')">시험응시</td>
			<td class="main_cate" onclick="location.replace('/checkGrade.do')">성적확인</td>
          </tr>
      </c:if>
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
                   시험 응시일 :
                   <input type="date" name="exam_date" value="${examDetailMap.examDetailInfo[0].exam_date}">
                   <br><input type="hidden" name="tea_id" value="${sessionScope.tea_id}">
                   <input type="hidden" name="stu_id" value="${sessionScope.stu_id}">
                   <input type="hidden" name="exam_id" value="${param.exam_id}">
        </div>
     </div>

<c:if test="${whatRole eq '강사'}">
	<c:forEach var="examDetail" items="${examDetailMap.examDetailProblem}" varStatus="vs">
	    <div>
	        <div>문제 ${vs.index + 1}번</div><br>
	        <textarea name="exam_question${vs.index + 1}" cols="10" rows="7" maxlength="300">${examDetailMap.examDetailProblem[vs.index].exam_question}</textarea>
	        <div><br>${vs.index + 1}번 답 : 
	            <input type="text" name="exam_answer${vs.index + 1}" value="${examDetailMap.examDetailAnswer[vs.index].exam_answer}"> 
	        </div>
	        <input type="hidden" name="exam_no${vs.index + 1}" value="${examDetailMap.examDetailProblem[vs.index].exam_no}">
	    </div>
	</c:forEach>
	
    <span onclick="location.replace('/examList.do')" name="cancel" class="cancel">이전</span>
    <span onclick="checkExamUpForm();" name="save" class="save">수정</span>
    <span onclick="checkExamDelForm();" name="save" class="save">삭제</span>
</c:if>
<c:if test="${whatRole eq '학생'}">
	<c:forEach var="examDetail" items="${examDetailMap.examDetailProblem}" varStatus="vs">
	    <div>
	        <div>문제 ${vs.index + 1}번</div><br>
	        <textarea name="exam_question${vs.index + 1}" cols="10" rows="7" maxlength="300" readonly>${examDetailMap.examDetailProblem[vs.index].exam_question}</textarea>
	        <div><br>${vs.index + 1}번 답 : 
	        <input type="text" name="stu_exam_answer${vs.index + 1}"> 
	            <input type="hidden" name="exam_answer${vs.index + 1}" value="${examDetailMap.examDetailAnswer[vs.index].exam_answer}"> 
	        </div>
	        <input type="hidden" name="exam_no${vs.index + 1}" value="${examDetailMap.examDetailProblem[vs.index].exam_no}">
	    </div>
	</c:forEach>
	<input type="hidden" name="score">
    <span onclick="location.replace('/examList.do')" name="cancel" class="cancel">이전</span>
    <span onclick="checkExamGradeForm();" name="save" class="save">제출</span>
</c:if>
    </div>
   </form>
  <form name="examListForm" class="no dumP_form" method="post" action="/examList.do"></form>
</body>
</html>