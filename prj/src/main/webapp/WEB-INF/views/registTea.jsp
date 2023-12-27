<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강사 등록 화면</title>
  <script src="js/registFreeDev.js"></script>
  <link href="css/registStu.css" rel="stylesheet">

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
  var formObj = $("[name='freelancerRegForm']");   
}

function saveData(){
     
   ajax(
      "/registFreeDevProc.do"
      ,"post"
      ,formObj
      ,function(responseJson){
         if(freelancerRegCnt>=1) {
            alert("프리랜서 정보가 등록되었습니다.");
            goFreelancerSearchForm();
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
			<td class="main_cate" onclick="location.replace('/gyeoljaeList.do')">결재 관리</td>
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
   <form name="freelancerRegForm" class="boardForm">
    <header>
      <div>강사 등록</div>
    </header>
      <div class="inform">
      <div class="title">강사 기본 정보</div>
      <div class="dev_user">
                    <td>아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="20">
                    </td>
               <td>암호</td>
                    <td>
                        <input type="password" name="pwd" maxlength="20"> 
                    </td>
                    <td>암호확인</td>
                    <td colspan="2">
                        <input type="password" name="rePwd" maxlength="20">
                    </td>
                    </div>
             <div> 
                    <td>이름</td>
                    <td>
                        <input type="text" name="name"> 
                    </td>
                    <td>주민번호</td>
                    <td>
                        <input type="text" name="jumin_num1" maxlength="6">-
                        <input type="text" name="jumin_num2" maxlength="7">
                    </td>
                    </div>
                    <div>
                    <td>핸드폰</td>
                    <td colspan="2">
                        <input type="text" name="phone" maxlength="11"> (-없이 입력)
                    </td>
                </div>
            
                <div class="categoty">
                    <td>긴급연락처(사고 대비)</td>
                 </div>
                 <div>
                    <td>연락 받을 사람 이름 :&nbsp;
                        <input type="text" name="emergency_name" size="10"> 
                    </td>
                 </div>
                 <div>
                    <td>
                        관계 :
                    </td>
                    <td>
                        <select name="emergency_relation">
                            <option value=""></option>
                            <option value="1">부모</option>
                            <option value="2">자식</option>
                            <option value="3">형제</option>
                            <option value="4">친척</option>
                            <option value="5">지인</option>
                        </select> (부모,자식,형제,친척,지인)
                    </td>
                    </div>
                    <div style="border-bottom: 1px solid lightgray;">
                    <td>전화번호 :</td>
                    <td>
                        <input type="tel" name="emergency_phone"  maxlength="11"> 
                    </td>
                </div> 
		          <div class="compan_div">
              <div class="category">회사 경력
              </div>
              <div class="compan">
                <div>회사명/업무</div>
                <div>연봉</div>
                <div>입사일/퇴사일</div>
              </div>
              
              
              	<div class="compan_desc">
                <div class="compan_name">
                  <input type="text" name="past_company_name" placeholder="회사명">
                </div>
                <div>
                  <input type="text" name="salary">
                </div>
                <div>
                  <div>
                    <span>입사일 : </span>
                    <input type="month" name="hire_date">
                  </div>
                  <div>
                    <span>퇴사일 : </span>
                    <input type="month" name="fire_date">
                  </div>
                </div>
              </div>

		          
		        </tr>
		      </div>
     	      <div>
		        <tr>
		          <th>담당 수업 : </th>
		          <select name="joinClass">
		             <option value=""></option>
		             <option value="1">어쩌구</option>
		             <option value="2">어쩌구</option>
		             <option value="3">어쩌구</option>
		          </select>
		          
		        </tr>
		      </div>
		      <div>
		        <div>기타</div>
		        <textarea name="etc" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
		      </div>  
    <span onclick="location.replace('/teaList.do')" name="cancel" class="cancel">취소</span>
    <span onclick="saveData();" name="save" class="save">저장</span>
   </form>
  <form name="freelancerSearchForm" class="no dumP_form" method="post" action="/searchFreeDev.do"></form>
</body>
</html>