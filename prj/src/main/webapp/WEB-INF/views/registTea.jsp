<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강사 등록 화면</title>
  <script src="js/registFreeDev.js"></script>
  <link href="css/registTea.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
  $(function(){init();});
  
  function checkRadio(e) {
    $(e).siblings('input').prop('checked', false);
  }

  function checkMax(e, max) {
    var getName = $(e).attr('name');

    if ($(e).val().length > max){
      $(e).val($(e).val().slice(0, max));
    }    
  }

  function dateEmpty(e, type) {
      var getVal = $(e).siblings('input');

      if(type=='date' || type=='text') {
         getVal.val('');
      }
      if(type=='checkbox' || type=='radio') {
         getVal.prop('checked', false);
      }
      if(type=='select') {
         $(e).siblings('select').val('');
      }
      $('.search').val('검색');
   }
   
  function dateNow() {
	  var now = new Date(),
	      offset = now.getTimezoneOffset() * 60000,
	      adjustedDate = new Date(now.getTime() - offset),
	      formattedDate = adjustedDate.toISOString().substring(0,16);

	  $('.consultation_time').val(formattedDate)
	};

  function goFreelancerSearchForm(){
      document.freelancerSearchForm.submit();
  }

  function checkSpace(obj){ 
    var a = $(obj),             
        b = a.val().replace(/ /gi, ''); 
    a.val(b); 
    if(a.attr('type') == 'number') {
      var maxLength = Number(a.attr('maxlength')),
            orgLength = a.val().length;

      if (orgLength > maxLength){
          var c = a.val().slice(0, maxLength);
          a.val(c);
      } 
    };
  };
   
    
function init(){  
}

function goTeaListForm(){
    document.teaListForm.submit();
}

function save(){
	var formObj = $("[name='teaRegForm']"); 
	var checkObj_tea_id = formObj.find("[name='tea_id']");
	var checkObj_tea_pwd = $("[name='tea_pwd']");
	var checkObj_re_Pwd = $("[name='re_Pwd']");
	var checkObj_tea_name = $("[name='tea_name']");
	var checkObj_tea_jumin_num1 = $("[name='tea_jumin_num1']");
	var checkObj_tea_jumin_num2 = $("[name='tea_jumin_num2']");
	var checkObj_tea_phone = $("[name='tea_phone']");
	var checkObj_tea_emergency_name = $("[name='tea_emergency_name']");
	var checkObj_tea_emergency_relation = $("[name='tea_emergency_relation']");
	var checkObj_tea_emergency_phone = $("[name='tea_emergency_phone']");
	var checkObj_past_company_name = $("[name='past_company_name']");	
	var checkObj_salary = $("[name='salary']");	
	var checkObj_hire_date = $("[name='hire_date']");	
	var checkObj_fire_date = $("[name='fire_date']");
	var checkObj_tea_joinClass = $("[name='tea_joinClass']");
	var checkObj_tea_etc = $("[name='tea_etc']");

	  if(checkVal(
		        checkObj_tea_id
		          ,"아이디는 영소문자 또는 숫자로 구성되고 4~15자리"
		          ,/^[a-z0-9]{4,15}$/
		        )==false){
		          checkObj_tea_id.focus();
		          return;
		  }
	  if(checkVal(
		        checkObj_tea_pwd
		          ,"암호는 영소문 또는 숫자로 구성되고 4~12자 입력해야 합니다."
		          ,/^[a-z0-9]{4,12}$/
		        )==false){
		          checkObj_tea_pwd.focus();
		          return;
		  }
	
	  if(
		checkObj_tea_pwd.val()
		!=
		checkObj_re_Pwd.val())
		  
		{alert("입력한 암호와 다릅니다. 재입력 요망")
		return;
	}
	  
	  if(checkVal(
		         checkObj_tea_name
		          ,"강사명은 2~10자이고 한글로만 입력됩니다."
		          ,/^[가-힣]{2,10}$/
		        )==false){
		          checkObj_tea_name.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_jumin_num1
		          ,"주민번호 앞6자리를 입력하세요. "
		          ,/^[0-9]{6}$/
		        )==false){
		          checkObj_tea_jumin_num1.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_jumin_num2
		          ,"주민번호 뒤7자리를 입력하세요. 재입력 요망"
		          ,/^[0-9]{7}$/
		        )==false){
		          checkObj_tea_jumin_num2.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_phone
		          ,"핸드폰 번호는 숫자로만 구성되고 -은 제외합니다."
		          ,/^[0-9]{8,13}$/
		        )==false){
		          checkObj_tea_phone.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_emergency_name
		          ,"비상연락명은 2~10자 이고 한글로만 구성됩니다.재입력 요망"
		          ,/^[가-힣]{2,10}$/
		        )==false){
		          checkObj_tea_emergency_name.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_emergency_relation
		          ,"연락 받는 사람의 관계는 필수 선택사항입니다."
		          ,/^[^ ]{1,}$/
		          )==false){
		          checkObj_tea_emergency_relation.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_emergency_phone
		          ,"비상연락망은 숫자로만 구성되고 -은 제외합니다."
		          ,/^[0-9]{8,13}$/
		        )==false){
		          checkObj_tea_emergency_phone.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_past_company_name
		          ,"회사명은 한글,영어로만 구성되고 1~20자로 구성됩니다."
		          ,/^[a-z가-힣]{1,20}$/
		        )==false){
		          checkObj_past_company_name.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_salary
		          ,"연봉은 숫자만 입력하세요."
		          ,/^[0-9]{3,6}$/
		        )==false){
		          checkObj_salary.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_hire_date
		         ,"입사일은 필수 선택사항입니다."
		          ,/^[^ ]{1,}$/
		          )==false){
		          checkObj_hire_date.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_fire_date
		         ,"퇴사일은 필수 선택사항입니다."
		          ,/^[^ ]{1,}$/
		          )==false){
		          checkObj_fire_date.focus();
		          return;
		      }
	  
	  if(checkVal(
		         checkObj_tea_joinClass
		         ,"담당수업은 필수 선택사항입니다."
		          ,/^[^ ]{1,}$/
		          )==false){
		          checkObj_tea_joinClass.focus();
		          return;
	 }
	  
	  if(checkVal(
		         checkObj_tea_etc
		         ,"기타내용은 임의 문자 2~500자 입력해야하고 공백으로 이루어질수 없습니다."
		         ,/^(.|\n){2,500}$/
		          )==false){
		          checkObj_tea_etc.focus();
		          return;
		      }
	  
   	ajax(
      "/registTeaProc.do"
      ,"post"
      ,formObj
      ,function(responseJson){
          var teaRegCnt = responseJson["teaRegCnt"];
    	  if(teaRegCnt>=1) {
            alert("강사 정보가 등록되었습니다.");
            goTeaListForm();
         }
         else{
            alert("강사 등록 중 오류가 발생했습니다. 다시 시도해주십시오.")
         }
    });
  }
  </script>
</head>
<body>
  <form class="header">
    <div class="header_box">
      <div class="logo" onclick="location.replace('/adminMain.do')">
        <img src="">
        <div>
          ERP
        </div>
      </div>
      <table>
          <tr class="cate_box">
			<td class="main_cate" onclick="location.replace('/stuList.do')">학생 관리</td>
			<td class="main_cate active" onclick="location.replace('/teaList.do')">강사 관리</td>
			<td class="main_cate" onclick="location.replace('/classList.do')">수업 관리</td>
			<td class="main_cate" onclick="location.replace('/dayOff.do')">결재 관리</td>
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
   <form name="teaRegForm" class="boardForm">
    <header>
      <div>강사 등록</div>
    </header>
      <div class="inform">
      <div class="title">강사 기본 정보</div>
      <div class="dev_user">
                    <td>아이디</td>
                    <td>
                        <input type="text" name="tea_id" maxlength="20">
                    </td>
               <td>암호</td>
                    <td>
                        <input type="password" name="tea_pwd" maxlength="20"> 
                    </td>
                    <td>암호확인</td>
                    <td colspan="2">
                        <input type="password" name="re_Pwd" maxlength="20">
                    </td>
                    </div>
             <div> 
                    <td>이름</td>
                    <td>
                        <input type="text" name="tea_name"> 
                    </td>
                    <td>주민번호</td>
                    <td>
                        <input type="text" name="tea_jumin_num1" maxlength="6">-
                        <input type="text" name="tea_jumin_num2" maxlength="7">
                    </td>
                    </div>
                    <div>
                    <td>핸드폰</td>
                    <td colspan="2">
                        <input type="text" name="tea_phone" maxlength="11"> (-없이 입력)
                    </td>
                </div>
            
                <div class="category">
                    <td>긴급연락처(사고 대비)</td>
                 </div>
                 <div>
                    <td>연락 받을 사람 이름 :&nbsp;
                        <input type="text" name="tea_emergency_name" size="10"> 
                    </td>
                 </div>
                 <div>
                    <td>
                        관계 :
                    </td>
                    <td>
                        <select name="tea_emergency_relation">
                            <option value=""></option>
                            <option value="부모">부모</option>
                            <option value="자식">자식</option>
                            <option value="형제">형제</option>
                            <option value="친척">친척</option>
                            <option value="지인">지인</option>
                        </select> (부모,자식,형제,친척,지인)
                    </td>
                    </div>
                    <div>
                    <td>전화번호 :</td>
                    <td>
                        <input type="tel" name="tea_emergency_phone"  maxlength="11"> 
                    </td>
                </div> 
		    <div class="category">회사 경력
              </div>
              <div class="company">
              <div class="flex">
                <div>회사명</div>
                <div>연봉</div>
                <div>입사일</div>
                <div>퇴사일</div>
              </div>
              
              
              <div class="flex">
                  <input type="text" name="past_company_name" placeholder="회사명">
                  <input type="text" name="salary" placeholder="연봉">
                    <input type="month" name="hire_date" >
                    <input type="month" name="fire_date">
                  </div>
              </div>

		          
		        </tr>
     	      <div>
		        <tr>
		          <th>담당 수업 : </th>
		          <select name="tea_joinClass">
		             <option value=""></option>
		             <option value="1">어쩌구</option>
		             <option value="2">어쩌구</option>
		             <option value="3">어쩌구</option>
		          </select>
		          
		        </tr>
		      </div>
		      <div>
		        <div>기타</div>
		        <textarea name="tea_etc" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
		      </div>  
    <span onclick="location.replace('/teaList.do')" name="cancel" class="cancel">취소</span>
    <span onclick="save();" name="save" class="save">저장</span>
   </form>
  <form name="teaListForm" class="no dumP_form" method="post" action="/teaList.do"></form>
</body>
</html>