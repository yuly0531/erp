<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/examList.css">
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
      <div class="logo" onclick="location.replace('/teaList.do')">
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
  <form name="examDetail" class="examList">
  <div class="inform">
      <div class="dev_user">
	        <div>
	          	시험 제목 : 
	            <input type="text" name="exam_name" value="${ examDTO.exam_name}"><br>
	            <br>
	        </div>
	             <div> 
	             	시험 응시일
	                <input type="date" name="exam_date" value="${ examDTO.exam_date}">
	                <br>
	                <br><input type="hidden" name="tea_id" value="${sessionScope.tea_id}">

	     </div>
     </div>
      	<div>
	        <div>문제 1번</div><br>
	        	<textarea name="exam_question1" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question1}"></textarea>
	        <div><br>1번 답 : 
	        	<input type="text" name="exam_answer1" value="${ examDTO.exam_answer1}"> 
	        </div>
          	</div>
        		<div>
	        <div>문제 2번</div><br>
	        	<textarea name="exam_question2" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question2}"></textarea>
	        <div><br>2번 답 : 
	        	<input type="text" name="exam_answer2" value="${ examDTO.exam_answer2}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 3번</div><br>
	        	<textarea name="exam_question3" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question3}"></textarea>
	        <div><br>3번 답 : 
	        	<input type="text" name="exam_answer3" value="${ examDTO.exam_answer3}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 4번</div><br>
	        	<textarea name="exam_question4" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question4}"></textarea>
	        <div><br>4번 답 : 
	        	<input type="text" name="exam_answer4" value="${ examDTO.exam_answer4}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 5번</div><br>
	        	<textarea name="exam_question5" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question5}"></textarea>
	        <div><br>5번 답 : 
	        	<input type="text" name="exam_answer5" value="${ examDTO.exam_answer5}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 6번</div><br>
	        	<textarea name="exam_question6" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question6}"></textarea>
	        <div><br>6번 답 : 
	        	<input type="text" name="exam_answer6" value="${ examDTO.exam_answer6}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 7번</div><br>
	        	<textarea name="exam_question7" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question7}"></textarea>
	        <div><br>7번 답 : 
	        	<input type="text" name="exam_answer7" value="${ examDTO.exam_answer7}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 8번</div><br>
	        	<textarea name="exam_question8" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question8}"></textarea>
	        <div><br>8번 답 : 
	        	<input type="text" name="exam_answer8" value="${ examDTO.exam_answer8}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 9번</div><br>
	        	<textarea name="exam_question9" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question9}"></textarea>
	        <div><br>9번 답 : 
	        	<input type="text" name="exam_answer9" value="${ examDTO.exam_answer9}"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 10번</div><br>
	        	<textarea name="exam_question10" cols="10" rows="7" maxlength="300" value="${ examDTO.exam_question10}"></textarea>
	        <div><br>10번 답 : 
	        	<input type="text" name="exam_answer10" value="${ examDTO.exam_question10}"> 
	        </div>
          	</div>
		      

    <span onclick="location.replace('/examList.do')" name="cancel" class="cancel">이전</span>
    <span onclick="checkExamUpForm();" name="save" class="save">수정</span>
   </form>
  <form name="examListForm" class="no dumP_form" method="post" action="/examList.do"></form>
</body>
</html>