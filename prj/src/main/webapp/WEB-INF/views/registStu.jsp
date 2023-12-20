<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>학생 등록 화면</title>
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
      <div class="logo" onclick="location.replace('/mainpage.do')">
        <img src="">
        <div>
          ERP
        </div>
      </div>
      <table>
          <tr class="cate_box">
			<td class="main_cate active" onclick="location.replace('/stuList.do')">학생 관리</td>
			<td class="main_cate" onclick="location.replace('/teaList.do')">강사 관리</td>
			<td class="main_cate" onclick="location.replace('/classList.do')">수업 관리</td>
			<td class="main_cate" onclick="location.replace('/searchDispatch.do')">어쩌구</td>
			<td class="main_cate" onclick="location.replace('/gyeoljaeList.do')">어쩌구</td>
			<td class="main_cate" onclick="location.replace('/boardList.do')">어쩌구</td>
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
   <form name="freelancerRegForm" class="boardForm">
    <header>
      <div>학생 등록</div>
    </header>
      <div class="inform">
      <div class="title">학생 기본 정보</div>
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
                        <input type="text" name="dName"> 
                    </td>
                    <td>주민번호</td>
                    <td>
                        <input type="text" name="jumin_num1" maxlength="6">-
                        <input type="text" name="jumin_num2" maxlength="7">
                    </td>
                    <td>핸드폰</td>
                    <td colspan="2">
                        <input type="text" name="phone" maxlength="11"> (-없이 입력)
                    </td>
                </div>
               <div>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email">
                    </td>
                    <td>병역</td>
                    <td>
                        
                        <select name="go_army">
                            <option value=""></option>
                            <option value="1">군필</option>
                            <option value="2">의가사제대</option>
                            <option value="3">면제</option>
                        </select>&nbsp;(여성은 면제로 입력해 주세요.)<br><td colspan="4"></td>
                    </td>
                </div>
            <br>
                <div>
                <td>주소 : </td>
                <td colspan="6">
                    <input type="text" name="address" maxlength="100" size="70"> <br>
                </td>
                </div>
                <br>
                <div>
                    <td>긴급연락처(사고 대비)</td>
                    <td>연락 받을 사람 이름 :&nbsp;
                        <input type="text" name="emergency_name" size="10"> <br><br>
                    </td>
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
                        </select> (부모,자식,형제,친척,지인)<br>
                    </td>
                    <td>전화번호 :</td>
                    <td>
                        <input type="tel" name="emergency_phone"  maxlength="11"> <br>
                    </td>
                </div>  
     	      <div>
		        <tr>
		          <th>수강 수업 : </th>
		          <select name="joinClass">
		             <option value=""></option>
		             <option value="1">서울</option>
		             <option value="2">인천</option>
		             <option value="3">경기</option>
		             <option value="4">강원</option>
		             <option value="5">충북</option>
		             <option value="6">전북</option>
		             <option value="7">전남</option>
		             <option value="8">경북</option>
		             <option value="9">경남</option>
		             <option value="10">국외</option>
		          </select>
		          
		        </tr>
		      </div>
		      <div>
		        <div>기타</div>
		        <textarea name="etc_want" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
		      </div>  
    <span onclick="location.replace('/stuList.do')" name="cancel" class="cancel">취소</span>
    <span onclick="saveData();" name="save" class="save">저장</span>
   </form>
  <form name="freelancerSearchForm" class="no dumP_form" method="post" action="/searchFreeDev.do"></form>
</body>
</html>