<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%> 

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>시험 출제 화면</title>
<script src="js/registFreeDev.js"></script>
<link href="css/registExample.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
function goExamListForm(){
    document.goExamListForm.submit();
}

function saveData(){
    var formObj = $("[name='examListForm']");  
    var checkObj_exam_name = formObj.find("[name='exam_name']");
    var checkObj_exam_date = formObj.find("[name='exam_date']");
    
    var checkObj_exam_question1 = formObj.find("[name='exam_question1']");
    var checkObj_exam_question2 = formObj.find("[name='exam_question2']");
    var checkObj_exam_question3 = formObj.find("[name='exam_question3']");
    var checkObj_exam_question4 = formObj.find("[name='exam_question4']");
    var checkObj_exam_question5 = formObj.find("[name='exam_question5']");
    var checkObj_exam_question6 = formObj.find("[name='exam_question6']");
    var checkObj_exam_question7 = formObj.find("[name='exam_question7']");
    var checkObj_exam_question8 = formObj.find("[name='exam_question8']");
    var checkObj_exam_question9 = formObj.find("[name='exam_question9']");
    var checkObj_exam_question10 = formObj.find("[name='exam_question10']");
    
    var checkObj_exam_answer1 = formObj.find("[name='exam_answer1']");
    var checkObj_exam_answer2 = formObj.find("[name='exam_answer2']");
    var checkObj_exam_answer3 = formObj.find("[name='exam_answer3']");
    var checkObj_exam_answer4 = formObj.find("[name='exam_answer4']");
    var checkObj_exam_answer5 = formObj.find("[name='exam_answer5']");
    var checkObj_exam_answer6 = formObj.find("[name='exam_answer6']");
    var checkObj_exam_answer7 = formObj.find("[name='exam_answer7']");
    var checkObj_exam_answer8 = formObj.find("[name='exam_answer8']");
    var checkObj_exam_answer9 = formObj.find("[name='exam_answer9']");
    var checkObj_exam_answer10 = formObj.find("[name='exam_answer10']");
    
    
    
    if(checkVal(
          checkObj_exam_name
             , "시험 제목은 공백으로만 이루어질 수 없습니다."
             , /[^ ]/
          )==false){
       checkObj_exam_name.focus()
             return;
          }
    
    if(checkObj_exam_date.val()==""){
         alert("시험 응시일을 지정해 주세요.")
         checkObj_exam_date.focus()
         return;
     }
    
    if(checkVal(
          checkObj_exam_question1
             , "1번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question1.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer1
             , "1번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer1.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question2
             , "2번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question2.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer2
             , "2번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer2.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question3
             , "3번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question3.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer3
             , "3번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer3.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question4
             , "4번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question4.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer4
             , "4번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer4.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question5
             , "5번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question5.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer5
             , "5번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer5.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question6
             , "6번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question6.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer6
             , "6번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer6.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question7
             , "7번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question7.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer7
             , "7번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer7.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question8
             , "8번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question8.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer8
             , "8번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer8.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question9
             , "9번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question9.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer9
             , "9번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer9.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_question10
             , "10번 문제를 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_question10.focus()
             return;
          }
    
    if(checkVal(
          checkObj_exam_answer10
             , "10번 정답을 입력해 주세요."
             , /[^ ]/
          )==false){
       checkObj_exam_answer10.focus()
             return;
          }
    
    
ajax(
   "/registExamProc.do"
   ,"post"
   ,formObj
   ,function(responseJson){
      var examRegCnt = responseJson["examRegCnt"];
      if(examRegCnt>=1) {
         alert("시험 정보가 등록되었습니다.");
         goExamListForm();
      }
      else{
         alert("정보 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
      }
 });
}
  </script>
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
			<td class="main_cate" onclick="location.replace('/dayOff.do')">휴가 신청</td>
			<td class="main_cate active" onclick="location.replace('/examList.do')">시험 출제</td>
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
   <form name="examListForm" class="boardForm">
    <header>
      <div>시험 출제</div>
    </header>
      <div class="inform">
	      <div class="dev_user">
	        <div>
	          	시험 제목 : 
	            <input type="text" name="exam_name"><br>
	            <br>
	        </div>
	             <div> 
	             	시험 응시일
	                <input type="date" name="exam_date">
	                <br>
	                <br><input type="hidden" name="tea_id" value="${sessionScope.tea_id}">

	     </div>
     </div>
      	<div>
	        <div>문제 1번</div><br>
	        	<textarea name="exam_question1" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>1번 답 : 
	        	<input type="text" name="exam_answer1"> 
	        </div>
          	</div>
        		<div>
	        <div>문제 2번</div><br>
	        	<textarea name="exam_question2" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>2번 답 : 
	        	<input type="text" name="exam_answer2"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 3번</div><br>
	        	<textarea name="exam_question3" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>3번 답 : 
	        	<input type="text" name="exam_answer3"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 4번</div><br>
	        	<textarea name="exam_question4" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>4번 답 : 
	        	<input type="text" name="exam_answer4"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 5번</div><br>
	        	<textarea name="exam_question5" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>5번 답 : 
	        	<input type="text" name="exam_answer5"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 6번</div><br>
	        	<textarea name="exam_question6" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>6번 답 : 
	        	<input type="text" name="exam_answer6"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 7번</div><br>
	        	<textarea name="exam_question7" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>7번 답 : 
	        	<input type="text" name="exam_answer7"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 8번</div><br>
	        	<textarea name="exam_question8" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>8번 답 : 
	        	<input type="text" name="exam_answer8"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 9번</div><br>
	        	<textarea name="exam_question9" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>9번 답 : 
	        	<input type="text" name="exam_answer9"> 
	        </div>
          	</div>
          	<div>
	        <div>문제 10번</div><br>
	        	<textarea name="exam_question10" cols="10" rows="7" maxlength="300"></textarea>
	        <div><br>10번 답 : 
	        	<input type="text" name="exam_answer10"> 
	        </div>
          	</div>
		      

    <span onclick="location.replace('/examList.do')" name="cancel" class="cancel">취소</span>
    <span onclick="saveData();" name="save" class="save">저장</span>
   </form>
  <form name="goExamListForm" class="no dumP_form" method="post" action="/examList.do"></form>
</body>
</html>