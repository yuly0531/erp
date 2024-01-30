<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>학생 검색 화면</title>
<link href="css/teaList.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<script>

$(function(){
      init();
   });

   function init(){}
   
	var checkTop = 0;


	function checkRadio(e) {
		$(e).siblings('input').prop('checked', false);
	}
	
	function checkMax(e, max) {
			var getName = $(e).attr('name');

			if ($(e).val().length > max){
				$(e).val($(e).val().slice(0, max));
			}    
		}
		function reSearch(){
				location.reload();
		}	
		
		function showDesc(e) {
			$('.desc_box').slideToggle();
			$('.filter').toggleClass('active');
		} 
	
	
	// 비움 버튼
	function dateEmpty(e, type) {
		var getVal = $(e).siblings('input');

		if(type=='date' || type=='text') {
			getVal.val('');
		}
		if(type=='checkbox' || type=='radio') {
			getVal.prop('checked', false);
		}
		if(type=='number') {
			getVal.val('');
		}
		if(type=='select') {
			$(e).siblings('select').val('');
		}
		$('.search').val('검색');
	}

	// 삭제 버튼 
function deleteInfo(){
		var formObj = $("[name='teaRegForm']")
		if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
		ajax(
				"/deleteTeaInfo.do"
				,"post"
				,formObj
				,function( deleteTeaCnt ){
					if( deleteTeaCnt>=1 ){
						alert("강사 정보가 삭제되었습니다.");
						closePopup();
						search();
					} else alert("WAS 접속 실패입니다. 관리자에게 문의 바랍니다.");
				}
		);
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

function closePopup(){
	var getHead = $('.teaRegForm').find('header');
	
		getHead.text('강사 상세 정보');
		$('.save').text('수정');
		$('.popup').find('input').prop('checked', false);
		$('.popup').find('textarea').val('');
		$('.popup').hide();
}

function showPopup(tea_id){
	
	$('.teaRegForm').find('[name="no_up_id"]').css('pointer-events', 'none');
	$('.alterBtn').css('pointer-events', 'none');
	$('input[type=radio]').prop('checked', false);
	$(".popup_main").animate({ scrollTop: 0 }, "fast");
	$('.tea_id').val(tea_id);
	
	
		ajax(
			"/teaDetail.do"
			,"post"
			,$("[name='teaRegForm']")
			,function(json){
				var data = json.teaList[0];
				$('.teaRegForm').find('[name="no_up_id"]').val(data.tea_id);
				$('.teaRegForm').find('[name="tea_pwd"]') .val(data.tea_pwd);
				$('.teaRegForm').find('[name="tea_name"]').val(data.tea_name);
				$('.teaRegForm').find('[name="tea_jumin_num1"]').val(data.jumin_num1);
				$('.teaRegForm').find('[name="tea_jumin_num2"]').val(data.jumin_num2);
				$('.teaRegForm').find('[name="tea_phone"]').val(data.tea_phone);
				$('.teaRegForm').find('[name="tea_emergency_name"]').val(data.emergency_name);
				$('.teaRegForm').find('[name="tea_emergency_relation"]').val(data.emergency_relation);
				$('.teaRegForm').find('[name="tea_emergency_phone"]').val(data.emergency_phone);
				$('.teaRegForm').find('[name="past_company_name"]').val(data.company);
				$('.teaRegForm').find('[name="salary"]').val(data.salary);
				$('.teaRegForm').find('[name="hire_date"]').val(data.hire_date);
				$('.teaRegForm').find('[name="fire_date"]').val(data.fire_date);
				$('.teaRegForm').find('[name="tea_etc"]').val(data.tea_etc);

			} 
		);
	$('.popup').show();	
}

function update() {
		var formObj = $("[name='teaRegForm']")
		var checkObj_tea_pwd = $("[name='tea_pwd']");
		var checkObj_rePwd = $("[name='rePwd']");
		var checkObj_tea_phone = $("[name='tea_phone']");
		var checkObj_tea_emergency_name = $("[name='tea_emergency_name']");
		var checkObj_tea_emergency_relation = $("[name='tea_emergency_relation']");
		var checkObj_tea_emergency_phone = $("[name='tea_emergency_phone']");
		var checkObj_past_company_name = $("[name='past_company_name']");	
		var checkObj_salary = $("[name='salary']");	
		var checkObj_hire_date = $("[name='hire_date']");	
		var checkObj_fire_date = $("[name='fire_date']");
		var checkObj_tea_etc = $("[name='tea_etc']");

		
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
			checkObj_rePwd.val())
			  
			{alert("입력한 암호와 다릅니다. 재입력 요망")
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
	  else{
			if(checkObj_hire_date.val()>
			checkObj_fire_date.val()&& checkObj_fire_date.val()!=""){
				alert("입사일은 퇴사일 보다 빠를 수 없습니다.")
			return;
			}
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
				"/updateTeaInfo.do"
				,"post"
				,formObj
				,function( updateTeaCnt ){
					if( updateTeaCnt>=1 ){
						alert('강사 정보가 수정되었습니다.');
						closePopup();
						search();
					} else alert("WAS 접속 실패입니다. 관리자에게 문의 바랍니다.");
				}
		);
}

		function pageNoClick(
					clickPageNo      
		){
			var formObj=$("[name='searchteaDevForm']");
			formObj.find("[name='selectPageNo']").val(clickPageNo);
			search();
}


function search(){
	var formObj = $("[name='searchTeaForm']")
	var checkObj_keyword1 = formObj.find("[name='keyword1']");                            
	var checkObj_keyword2 = $("[name='keyword2']");                            
	var checkObj_min_regist_date = formObj.find("[name='min_regist_date']");
	var checkObj_max_regist_date = formObj.find("[name='max_regist_date']");
	var checkObj_min_career = formObj.find("[name='min_career']");
	var checkObj_max_career = formObj.find("[name='max_career']");
	var checkObj_min_age = formObj.find("[name='min_age']");
	var checkObj_max_age = formObj.find("[name='max_age']");

	
	if (checkObj_keyword1.val() !== "") {
    var inputValue = checkObj_keyword1.val().trim();

    if (/^(.|\n){2,20}$/.test(inputValue)) {
        alert("검색조건이 유효합니다.");
    } else {
        alert("검색조건은 임의문자 2~20자만 입력 가능하고 공백으로 구성은 안됩니다.");
        checkObj_keyword1.val(""); 
    }
}
	
	if (checkObj_keyword2.val() !== "") {
	var inputValue = checkObj_keyword2.val().trim();

	  if (/^(.|\n){2,20}$/.test(inputValue)) {
	    alert("검색조건이 유효합니다.");
	} else {
	    alert("검색조건은 임의문자 2~20자만 입력 가능하고 공백으로 구성은 안됩니다.");
	    checkObj_keyword2.val(""); 
	}
}
	
	
	 
 	if(checkObj_min_regist_date.val()==""
		&& checkObj_max_regist_date.val()!=""){
		alert("최소 입사일을 설정해주세요.")
	return;
}
else{
	if(checkObj_min_regist_date.val()>
	checkObj_max_regist_date.val()&& checkObj_max_regist_date.val()!=""){
		alert("최소 입사일은 최대 입사일을 넘을 수 없습니다.")
	return;
	}
} 

	
	
	if(checkObj_min_career.val()==""
		&& checkObj_max_career.val()!=""){
		alert("최소 경력을 설정해주세요.")
	return;
}
	
else{
	if(checkObj_min_career.val()>
	checkObj_max_career.val()&& checkObj_max_career.val()!=""){
		alert("최소 경력은 최대 경력을 넘을 수 없습니다.")
	return;
	}
} 
	
	if(checkObj_min_age.val()==""
		&& checkObj_max_age.val()!=""){
		alert("최소 나이를 설정해주세요.")
	return;
}
	
	else{
		if(checkObj_min_age.val()>
		checkObj_max_age.val()&& checkObj_max_age.val()!=""){
			alert("최소 나이는 최대 나이를 넘을 수 없습니다.")
		return;
		}
	} 
	
	ajax(
			"/teaList.do"
			,"post"
			,formObj
			,function(responseHtml){
					
			var obj = $(responseHtml);
			var searchResultCnt = obj.find(".searchResultCnt").html();
			var searchResult = obj.find(".searchResult");
			var pageNos = obj.find(".pageNos").html();
			var html = 
			'<div class="isEmpty"><i class="fa fa-search" aria-hidden="true"></i>검색 결과가 없습니다.</div>';

			$(".searchResultCnt").html(searchResultCnt);
			$(".searchResult").html(searchResult);
			$(".pageNos").html(pageNos);
			$('.pageNos').show();

			if($('.impect').text() == 0 || $('.impect').text() == '0') {
				$(".searchResult").html( html );
				$('.pageNos').hide();
					}
				}
		);
	}

</script>
<body>
	<form name="teaSearch" class="header">
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
		<br>
		</div>
		</form>

		<div>
			<form name="searchTeaForm" class="boardForm">
			<header>
				<div>강사 검색</div>
			</header>
				<div class="search_bar_box">
			<tr>
				<td>
					<input type="text" name="keyword1" maxlength="30">
					<select name="orand">
					<option value="or">or
					<option value="and">and
					</select>
			<input type="text" name="keyword2" maxlength="30">
			
			<input type="button" onClick="search()" name="Search" class="search" value="검색">
			</td>
			</tr>
			
			<div class="button_box">
				<input type="button" onClick="reSearch()"  name="reSearch" class="desc_btn" value="초기화 후 전부검색">
				<input type="button" name="teaSearch" class="teaSearch desc_btn"  onclick="location.replace('/registTea.do')" value="강사 등록">
				<span class='filter' onclick="showDesc(this)"><i class="fa fa-angle-down" aria-hidden="true"></i></span>
			</div>
			</div>
				<div class="desc_box">
					<div>
								<tr>
									<div class="title" >성별</div>
									<td>
										<input type="checkbox" name="gender" value="1">남
										<input type="checkbox" name="gender" value="2">여
									</td>
								</tr>  
							</div>
								<div>
									<tr>
												<div class="title">입사일</div>
															<td>
																<input type="date" name="min_regist_date"> ~
																<input type="date" name="max_regist_date">
																<input onclick="dateEmpty(this, 'date')" type="button" name="role_reset" value="비움">
															</td>
									</tr>  
								</div>
								<div>
									<tr>
												<div class="title" >경력</div>
															<td>
																<input type="number" name="min_career"> 년 ~
																<input type="number" name="max_career"> 년
																<input onclick="dateEmpty(this, 'number')" type="button" name="age_reset" value="비움">
															</td>
									</tr>
								</div>
								<div>
									<tr>
												<div class="title" >나이</div>
															<td>
																<input type="number" name="min_age"> 살 ~
																<input type="number" name="max_age"> 살
																<input onclick="dateEmpty(this, 'number')" type="button" name="age_reset" value="비움">
															</td>
									</tr>
								</div>
							
								
					</div>
					<input type="hidden" name="selectPageNo" value="1">
					<table>
					<section>
					<section class="count_desc">
					<section class="searchResultCnt">
					검색개수 : <span class="accent impect">${teaListMap.teaListCnt}</span> 
									개
					</section>	
								<select name="rowCntPerPage" onChange="search()" class="rownum">
								<option value="10">10 
								<option value="15">15 
								<option value="20">20 
</select>&nbsp;행 보기
</section>
</section>
</table>
					
							
						
	<div name="searchResult" class="searchResult" >
		<div class="resultCate">
		
			<div>번호</div>
			<div>아이디</div>
			<div>이름</div>
			<div>나이</div>
			<div>성별</div>
			<div>경력</div>
			<div>핸드폰</div>
		</div>
			<div class="SearchResult_box">
			<div>
				<c:forEach var="teList" items="${teaListMap.teaList}" varStatus="vs">
		      	<div class="searchDetail" onclick="showPopup('${teList.tea_id}')">
			        <div>${vs.count}</div>
			        <div>${teList.tea_id}</div>
			        <div>${teList.tea_name}</div>    
			        <div>${teList.tea_age}</div>
			        <div>${teList.tea_gender}</div>
			     	<div>${teList.career}</div>	
			        <div>${teList.tea_phone}</div>
		        </div>
	         	</c:forEach>
			</div>
	</div> 
	</div>
	
	<span class="pageNos"> 
		<span onClick="pageNoClick(1)"><i class="fa fa-angle-left" aria-hidden="true"></i><i class="fa fa-angle-left" aria-hidden="true"></i></span>
		<span onClick="pageNoClick(${requestScope.teaListMap.selectPageNo}-1)"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<c:forEach var="pageNo" begin="${requestScope.teaListMap.begin_pageNo}" end="${requestScope.teaListMap.end_pageNo}">
				<c:if test="${requestScope.teaListMap.selectPageNo==pageNo}">
					<span class='isSelect'>
						${pageNo}
					</span>
				</c:if>
			<c:if test="${requestScope.teaListMap.selectPageNo!=pageNo}">
				<span style="cursor:pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
			</c:if>  
	</c:forEach> 

		<span onClick="pageNoClick(${requestScope.teaListMap.selectPageNo}+1)"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
		<span onClick="pageNoClick(${requestScope.teaListMap.last_pageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i><i class="fa fa-angle-right" aria-hidden="true"></i></span>
	</div>    
			</form>
		</div> 
		
	<div class='popup'>
	<div class="dim">
	<div class='popup_main'>
	<form name="teaRegForm" class="boardForm teaRegForm">
	<header>강사 상세 정보</header>
	<div class="inform">
	<div class="title">강사 기본 정보</div>
		<div>
			<div class='flex'>
			아이디
			<input type="text" name="no_up_id" maxlength="20">
			암호
			<input type="password" name="tea_pwd" maxlength="20"> 
			암호확인
			<input type="password" name="rePwd" maxlength="20">
	</div>
	
		<div class='flex'>
			이름
		 	<input type="text" name="tea_name"> 
			주민번호
			<input type="text" name="tea_jumin_num1" maxlength="6">-
			<input type="text" name="tea_jumin_num2" maxlength="7">
		</div>
		
		<div class='flex'>
			핸드폰
			<input type="text" name="tea_phone" maxlength="11"> (-없이 입력)
		</div>
					            
		<div class="category">
			긴급연락처(사고 대비)
		</div>
		
		<div class='flex'>
			연락 받을 사람 이름 :&nbsp;
		 <input type="text" name="tea_emergency_name" size="10">
		</div>
		
		<div class='flex'>
			관계 :
		<select name="tea_emergency_relation">
				 <option value=""></option>
				 <option value="부모">부모</option>
				 <option value="배우자">배우자</option>
				 <option value="자식">자식</option>
			     <option value="형제">형제</option>
				 <option value="친척">친척</option>
				 <option value="지인">지인</option>
		</select>
		</div>
		
	    <div class='flex'>
			전화번호 :
		<input type="tel" name="tea_emergency_phone"  maxlength="11"> 
		</div>  
		
		<div class="compan_div">
              <div class="category">회사 경력
        </div>
        <div class="company">
        <div class="flex">
   		</div>
   		
 		<div class="flex">
           	   <input type="text" name="past_company_name" placeholder="회사명">
               <input type="text" name="salary" placeholder="연봉">
               <input type="month" name="hire_date" >
               <input type="month" name="fire_date">
              </div>
            </div>         
		   </tr>
	    </div>
      <div>

	   </div>
		<div>
		<div>기타</div>
		<textarea name="tea_etc" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
		</div>  
		</div>	
			<span onclick="closePopup()" name="cancel" class="cancel">닫기</span>
			<span onclick="deleteInfo()" name="delete" class="delete">삭제</span>
			<span onclick="update()" name="save" class="save">저장</span>
			<input type="hidden" name="tea_id" class="tea_id">
		</form>
		</div>
	</div>
</div>

	<div class="none">
		<form name="searchTeaDetailForm" action="/teaDetailForm.do" post="post">
			<input type="hidden" name="tea_uid" class="tea_uid" value="">
		</form>

		<form name="deleteteaInFo" action="/deleteTeaInFo.do" post="post">
			<input type="hidden" name="del_tea_uid" class="del_tea_uid">
		</form>
	</div>
</body>
</html>