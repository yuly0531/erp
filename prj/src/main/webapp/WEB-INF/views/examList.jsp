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

$(function(){init();})

function init(){ 
}

 function search(){
   ajax(
         "/boardList.do"
         ,"post"
         ,$("[name='boardSearchForm']")
         ,function(responseHtml){
            var obj = $(responseHtml);
            var searchResultCnt = obj.find(".searchResultCnt").html();
            var searchResult = obj.find(".search_list").html();

            var html = 
            '<div class="isEmpty"><i class="fa fa-search" aria-hidden="true"></i>검색 결과가 없습니다.</div>';

            $(".searchResultCnt").html( searchResultCnt );
            $(".search_list").html( searchResult );
            
            
         }
   );
   
} 
function gyeoljae(){

   ajax(
         "/gyeoljaeList.do"
         ,"post"
         ,$("[name='gyeoljaeSearchForm']")
         ,function(responseHtml){
            var obj = $(responseHtml);
            var searchResultCnt = obj.find(".searchResultCnt2").html();
            var searchResult = obj.find(".search_list").html();

            var html = 
            '<div class="isEmpty"><i class="fa fa-search" aria-hidden="true"></i>검색 결과가 없습니다.</div>';

            $(".searchResultCnt2").html( searchResultCnt );
            $(".search_list_all").html( searchResult );
            
         }
   );
}

function goBoardDetailForm(b_no){
   $("[name='boardDetailForm'] [name='b_no']").val(b_no);
   
   document.boardDetailForm.submit();
}

function goGyeoljaeDetailForm(gyeoljae_num){
   $("[name='gyeoljaeDetailForm'] [name='gyeoljae_num']").val(gyeoljae_num);
   document.gyeoljaeDetailForm.submit();
}

</script>

<title>시험 목록</title>
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
      
    </div>
  </form>
  <form name="examList" class="examList">
  <div class="main">
          <div class="box_exam_list">
            <div class="doc_more" style="cursor: pointer;" onclick="location.replace('/??.do')">
              시험 이름 EL <i class="fa fa-plus-square-o" aria-hidden="true"></i>
              </div>
          <div class="list">
          대충 시험 정보
          </div>
        </div>
        </div>
         <div class="main">
          <div class="box_exam_list">
            <div class="doc_more" style="cursor: pointer;" onclick="location.replace('/??.do')">
              시험 이름 EL <i class="fa fa-plus-square-o" aria-hidden="true"></i>
              </div>
          <div class="list">
          대충 시험 정보
          </div>
        </div>
        </div>
      
    </form>
  
</body>
</html>