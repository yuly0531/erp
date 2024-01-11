<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>학생 검색 화면</title>
<link href="css/stuList.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<script>
	var checkTop = 0;


	function checkRadio(e) {
		$(e).siblings('input').prop('checked', false);
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


	function deleteInfo(){
		var formObj = $("[name='stuRegForm']")
		if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
		ajax(
				"/deleteStuInfo.do"
				,"post"
				,formObj
				,function( stuDelCnt ){
					alert(stuDelCnt)
					if( stuDelCnt>=1 ){
						alert("학생 정보가 삭제되었습니다.");
						closePopup();
						search();
					} 
					else {
						alert("WAS 접속 실패입니다. 관리자에게 문의 바랍니다.");
					}
				}
		);
	}

	function closePopup(){
		var getHead = $('.stuRegForm').find('header');
		
			getHead.text('학생 상세 정보');
			$('.popup').find('input').prop('checked', false);
			$('.popup').find('textarea').val('');
			$('.popup').hide();
	}

	function showPopup(id){
		$('.stuRegForm').find('[name="no_up_id"]').css('pointer-events', 'none');
		$('input[type=radio]').prop('checked', false);
		$(".popup_main").animate({ scrollTop: 0 }, "fast");
		$('.id').val(id);
	
			ajax(
				"/stuDetail.do"
				,"post"
				,$("[name='stuRegForm']")
				,function(json){
					var data = json.stuList[0];
					
					$('.stuRegForm').find('[name="no_up_id"]').val(data.stu_id);
					$('.stuRegForm').find('[name="pwd"]').val(data.stu_pwd);
					$('.stuRegForm').find('[name="name"]').val(data.stu_name);
					$('.stuRegForm').find('[name="jumin_num1"]').val(data.jumin_num1);
					$('.stuRegForm').find('[name="jumin_num2"]').val(data.jumin_num2);
					$('.stuRegForm').find('[name="phone"]').val(data.phone_num);
					$('.stuRegForm').find('[name="etc_want"]').val(data.etc);
					
	
					$('.stuRegForm').find('[name="emergency_name"]').val(data.emergency_name);
					$('.stuRegForm').find('[name="emergency_phone"]').val(data.emergency_phone);
					$('.stuRegForm').find('[name="emergency_relation"]').val(data.emergency_relation);
					$('.stuRegForm').find('[name="joinClass"]').val(data.class_id);
	
				} 
			);
	
		$('.popup').show();	
	}


	function update() {
		var formObj = $("[name='stuRegForm']")
		ajax(
				"/updateStuInfo.do"
				,"post"
				,formObj
				,function( stuUpCnt ){
					if( stuUpCnt>=1 ){
						alert('학생 정보가 수정되었습니다.');
						closePopup();
						search();
					} 
					else {alert("WAS 접속 실패입니다. 관리자에게 문의 바랍니다.")};
				}
		);
	}

		function pageNoClick(
					clickPageNo      
		){
			var formObj=$("[name='searchstuDevForm']");
			formObj.find("[name='selectPageNo']").val(clickPageNo);
			search();
		}

		function search(){
			var formObj = $("[name='searchStuForm']")
			ajax(
						"/stuList.do"
						,"post"
						,formObj
						,function(responseHtml){
								var obj = $(responseHtml);
								var sort = obj.find(".sort").html();
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
				<form name="stuSearch" class="header">
						<div class="header_box">
							<c:if test="${whatRole eq '강사'}">
          <div class="logo" onclick="location.replace('/teaMain.do')">
            <img src="">
            <div>
              ERP
            </div>
          </div>
          <table>
            <tr class="cate_box">
			<td class="main_cate" onclick="location.replace('/??.do')">수업 관리(출석)</td>
			<td class="main_cate active" onclick="location.replace('/stuList.do')">학생 관리</td>
			<td class="main_cate" onclick="location.replace('/dayOff.do')">휴가 관리</td>
			<td class="main_cate" onclick="location.replace('/examList.do')">시험 출제</td>
			<td class="main_cate" onclick="location.replace('/??.do')">근태 관리</td>
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
	         		<td class="main_cate active" onclick="location.replace('/stuList.do')">학생 관리</td>
					<td class="main_cate" onclick="location.replace('/teaList.do')">강사 관리</td>
					<td class="main_cate" onclick="location.replace('/classList.do')">수업 관리</td>
					<td class="main_cate" onclick="location.replace('/dayOff.do')">결재 관리</td>
				</tr>
			</table>
		</c:if> 
							<div class="welcome_user">
								<div>
									
							<div class="welcome_name">로그아웃</div>
							
									</div>
								<div class="logout_btn" onclick="location.replace('/loginForm.do')"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
							</div>
							<br>
						</div>
			</form>

			<div onscroll="checkScroll(this)">
				<form name="searchStuForm" class="boardForm">
					<header>
						<div>학생 검색</div>
					</header>
							<div class="search_bar_box">
								<tr>
									<td>
										<input type="text" name="keywordS" maxlength="30">
										<select name="orand">
													<option value="or">or
													<option value="and">and
										</select>
										<input type="text" name="keywordE" maxlength="30">
										<input onclick="dateEmpty(this, 'text')" type="button" name="grad_reset" value="비움">
										<input type="button" onClick="search()" name="Search" class="search" value="검색">
									</td>
								</tr>
								<div class="button_box">
									<input type="button" onClick="reSearch4()"  name="reSearch" class="desc_btn" value="초기화 후 전부검색">
									<input type="button" name="stuSearch" class="stuSearch desc_btn"  onclick="location.replace('/registStu.do')" value="학생 등록">
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
												<div class="title">등록일</div>
															<td>
																<input type="date" name="min_regist_date"> ~
																<input type="date" name="max_regist_date">
																<input onclick="dateEmpty(this, 'checkbox')" type="button" name="role_reset" value="비움">
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
	<input type="hidden" name="stuSort_fName">
	<input type="hidden" name="stuSort_age">
	<input type="hidden" name="stuSort_level_edu">
	<input type="hidden" name="stuSort_yeoncha">
	<input type="hidden" name="stuSort_can_dispatch_date">
	<input type="hidden" name="stuSort_consultation_date">
	<input type="hidden" name="stuSort_dev_year_standard_date">
	<section>
		<section class="count_desc">
				<section class="searchResultCnt">
					검색개수 : <span class="accent impect">${stuListMap.stuListCnt}</span> 
					개
				</section>
			
				<select name="rowCntPerPage" onChange="search()" class="rownum">
							<option value="10">10 
							<option value="15">15 
							<option value="20">20 
				</select>&nbsp;행 보기
		</section>
	</section>	
						
	<div name="searchResult" class="searchResult" >
		<div class="resultCate">
			<div>번호</div>
			<div>이름</div>
			<div>성별</div>
			<div>나이</div>
			<div>핸드폰</div>
			<div>등록일</div>
		</div>
			<div class="SearchResult_box">
				<c:forEach var="stuList" items="${stuListMap.stuList}" varStatus="vs">
		      		<div class="searchDetail" onclick="showPopup('${stuList.stu_id}')">
			            <div>${stuListMap.begin_serialNo_desc-vs.index}</div>
			            <div>${stuList.stu_name}</div>
			            <div>${stuList.gender}</div>
			            <div>${stuList.age}</div>
			            <div>${stuList.phone_num}</div>
			            <div>${stuList.regist_date}</div>
		         	</div>
	         	</c:forEach>
			<div>
			</div>
	</div> 
	</div>
	<span class="pageNos"> 
		<span onClick="pageNoClick(1)"><i class="fa fa-angle-left" aria-hidden="true"></i><i class="fa fa-angle-left" aria-hidden="true"></i></span>
		<span onClick="pageNoClick(${requestScope.stuListMap.selectPageNo}-1)"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<c:forEach var="pageNo" begin="${requestScope.stuListMap.begin_pageNo}" end="${requestScope.stuListMap.end_pageNo}">
				<c:if test="${requestScope.stuListMap.selectPageNo==pageNo}">
					<span class='isSelect'>
						${pageNo}
					</span>
				</c:if>
			<c:if test="${requestScope.stuListMap.selectPageNo!=pageNo}">
				<span style="cursor:pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
			</c:if>  
	</c:forEach> 

		<span onClick="pageNoClick(${requestScope.stuListMap.selectPageNo}+1)"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
		<span onClick="pageNoClick(${requestScope.stuListMap.last_pageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i><i class="fa fa-angle-right" aria-hidden="true"></i></span>
	</div>    
			</form>
		</div> 
		
		<div class='popup'>
			<div class="dim">
				<div class='popup_main'>
					<form name="stuRegForm" class="boardForm stuRegForm">
						<header>학생 상세 정보</header>
							<div class="inform">
								<div class="title">학생 기본 정보</div>
									<div>
										<div class='flex'>
											아이디
					                        <input type="text" name="no_up_id" maxlength="20">
						                    암호
					                        <input type="password" name="pwd" maxlength="20"> 
					                    	암호확인
					                        <input type="password" name="rePwd" maxlength="20">
					                    </div>
					             		<div class='flex'>
						                    이름
					                        <input type="text" name="name"> 
					                        주민번호
					                        <input type="text" name="jumin_num1" maxlength="6">-
					                        <input type="text" name="jumin_num2" maxlength="7">
					                    </div>
					             		<div class='flex'>
					                    	핸드폰
					                        <input type="text" name="phone" maxlength="11"> (-없이 입력)
					                	</div>
					            
						                <div class="categoty">
						                    긴급연락처(사고 대비)
						                </div>
						                <div class='flex'>
						                 	연락 받을 사람 이름 :&nbsp;
						                    <input type="text" name="emergency_name" size="10">
					                 	</div>
						                <div class='flex'>
					                        관계 :
					                        <select name="emergency_relation">
					                            <option value=""></option>
					                            <option value="부모">부모</option>
					                            <option value="배우자">배우자</option>
					                            <option value="자식">자식</option>
					                            <option value="형제">형제</option>
					                            <option value="친척">친척</option>
					                            <option value="지인">지인</option>
					                        </select>
					                    </div>
					                    <div class='flex' style="border-bottom: 1px solid lightgray;">
					                    	전화번호 :
					                        <input type="tel" name="emergency_phone"  maxlength="11"> 
					                	</div>  
					     	      		<div class='flex'>
					     	      			수강 수업 :
									          <select name="joinClass">
									             <option value=""></option>
									             <option value="1">어쩌구</option>
									             <option value="2">어쩌구</option>
									             <option value="3">어쩌구</option>
									          </select>
							      		</div>
					     	      		<div>
							        	<div>기타</div>
							        	<textarea name="etc" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
							      		</div> 
									</div>	
						<span onclick="closePopup()" name="cancel" class="cancel">닫기</span>
						<span onclick="deleteInfo()" name="delete" class="delete">삭제</span>
						<span onclick="update()" name="save" class="save">저장</span>
						<input type="hidden" name="id" class="id">
					</form>
			</div>
		</div>
	</div>

	<div class="none">
		<form name="searchstuDevDetailForm" action="/stuDetailForm.do" post="post">
			<input type="hidden" name="stu_uid" class="stu_uid" value="">
		</form>

		<form name="deletestuInFo" action="/deletestuInFo.do" post="post">
			<input type="hidden" name="del_stu_uid" class="del_stu_uid">
		</form>
	</div>
</body>
</html>