<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!doctype html>
<html>
<head>
<title>수업 검색 화면</title>
<link href="css/classList.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<script>
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
		function reSearch4(){
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

function dateNow() {
	var now = new Date(),
			offset = now.getTimezoneOffset() * 60000,
			adjustedDate = new Date(now.getTime() - offset),
			formattedDate = adjustedDate.toISOString().substring(0,16);

	$('.consulTime').val(formattedDate)
};

function deleteInfo(){
		var formObj = $("[name='deleteclassInFo']")
		if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
		ajax(
				"/deleteclassInfo.do"
				,"post"
				,formObj
				,function( boardDelCnt ){
					
					if( boardDelCnt>=1 ){
						alert("프리랜서 정보가 삭제되었습니다.");
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
	var getHead = $('.classRegForm').find('header');
	
		getHead.text('프리랜서 개발자 상세 정보');
		$('.save').text('수정');
		$('.save').attr('onclick', 'alterInfo(this)');
		$('.popup').find('input').prop('checked', false);
		$('.popup').find('textarea').val('');
		$('.popup').hide();
}

function showPopup(class_num){
	$('.classRegForm').find('input').css('pointer-events', 'none');
	$('.classRegForm').find('textarea').css('pointer-events', 'none');
	$('.classRegForm').find('select').css('pointer-events', 'none');
	$('.alterBtn').css('pointer-events', 'none');
	$('input[type=radio]').prop('checked', false);
	$(".popup_main").animate({ scrollTop: 0 }, "fast");
	$('.class_uid').val(class_num);
	$('.del_class_uid, .upd_class_uid').val(class_num.replace('F',''));

		ajax(
			"/searchclassDevDetail.do"
			,"post"
			,$("[name='searchclassDevDetailForm']")
			,function(json){
				var data = json.classList[0];
				
			$('.classRegForm').find('[name="fName"]').val(data.fName);
			$('.classRegForm').find('.email').val(data.email);
			$('.classRegForm').find('.phone').val(data.phone);
			$('.classRegForm').find('.birth_year').val(data.birth_year);
			$('.classRegForm').find('.graduate_date').val(data.graduate_date);
			$('.classRegForm').find('[name="call_notice"]').val(data.call_notice);
			$('.classRegForm').find('[name="etc_want"]').val(data.etc_want);
			$('.classRegForm').find('[name="etc_opinion"]').val(data.etc_opinion);
			$('.classRegForm').find('.can_dispatch_date').val(data.can_dispatch_date);
			$('.classRegForm').find('.consultation_time ').val(data.consultation_time);
			$('.classRegForm').find('.min_dev_cost').val(data.min_dev_cost);
	         $('.classRegForm').find('.max_dev_cost').val(data.max_dev_cost);
			$('.classRegForm').find('.min_operate_cost').val(data.min_operate_cost);
			$('.classRegForm').find('.max_operate_cost').val(data.min_operate_cost);
			$('.classRegForm').find('.dev_year_standard_date').val(data.dev_year_standard_date);

				if(data.how_dev_cost==1)  $('.classRegForm').find('[name="how_dev_cost"]:nth-child(1)').prop('checked', true);
				if(data.how_dev_cost==2)  $('.classRegForm').find('[name="how_dev_cost"]:nth-child(2)').prop('checked', true);
				if(data.how_operate_cost==1)  $('.classRegForm').find('[name="how_operate_cost"]:nth-child(1)').prop('checked', true);
				if(data.how_operate_cost==2)  $('.classRegForm').find('[name="how_operate_cost"]:nth-child(2)').prop('checked', true);
				if(data.dispatch_role==1) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(1)').prop('checked', true);
				if(data.dispatch_role==2) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(2)').prop('checked', true);
				if(data.dispatch_role==3) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(3)').prop('checked', true);
				if(data.dispatch_role==4) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(4)').prop('checked', true);
				if(data.dispatch_role==5) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(5)').prop('checked', true);
				if(data.dispatch_role==6) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(6)').prop('checked', true);
				if(data.dispatch_role==7) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(7)').prop('checked', true);
				if(data.dispatch_role==8) $('.classRegForm').find('[name="dispatch_role_code"]:nth-of-type(8)').prop('checked', true);
				if(data.job==1) $('.classRegForm').find('[name="job"]:nth-of-type(1)').prop('checked', true);
				if(data.job==2) $('.classRegForm').find('[name="job"]:nth-of-type(2)').prop('checked', true);
				if(data.job==3) $('.classRegForm').find('[name="job"]:nth-of-type(3)').prop('checked', true);
				if(data.fix_dispatch_date==1) $('.classRegForm').find('[name="fix_dispatch_date"]').prop('checked', true);
				if(data.gender==1)  $('.classRegForm').find('.gender_m').prop('checked', true);
				if(data.gender==2)  $('.classRegForm').find('.gender_w').prop('checked', true);
				if(data.have_notebook==1) $('.classRegForm').find('[name="have_notebook"]').prop('checked', true);
				if(data.highestLevel_edu==1) $('.classRegForm').find('#highestLevel_edu').val(1);
				if(data.highestLevel_edu==2) $('.classRegForm').find('#highestLevel_edu').val(2);
				if(data.highestLevel_edu==3) $('.classRegForm').find('#highestLevel_edu').val(3);
				if(data.highestLevel_edu==4) $('.classRegForm').find('#highestLevel_edu').val(4);
				if(data.highestLevel_edu==5) $('.classRegForm').find('#highestLevel_edu').val(5);
				if(data.abode==1) $('.classRegForm').find('[name="abode"]').val(1);
				if(data.abode==2) $('.classRegForm').find('[name="abode"]').val(2);
				if(data.abode==3) $('.classRegForm').find('[name="abode"]').val(3);
				if(data.abode==4) $('.classRegForm').find('[name="abode"]').val(4);
				if(data.abode==5)$('.classRegForm').find('[name="abode"]').val(5);
				if(data.abode==6) $('.classRegForm').find('[name="abode"]').val(6);
				if(data.abode==7)$('.classRegForm').find('[name="abode"]').val(7);
				if(data.abode==8)$('.classRegForm').find('[name="abode"]').val(8);
				if(data.abode==9) $('.classRegForm').find('[name="abode"]').val(9);
				if(data.abode==10) $('.classRegForm').find('[name="abode"]').val(10);

				if(data.is_black!=null) {
					var blacks = data.is_black.split(',');

				if(blacks[0]==1) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(1)').prop('checked', true);
				if(blacks[0]==2) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(2)').prop('checked', true);
				if(blacks[0]==3) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(3)').prop('checked', true);
				if(blacks[0]==4) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[0]==5) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[0]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[1]==2) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(2)').prop('checked', true);
				if(blacks[1]==3) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(3)').prop('checked', true);
				if(blacks[1]==4) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[1]==5) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[1]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[2]==3) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(3)').prop('checked', true);
				if(blacks[2]==4) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[2]==5) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[2]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[3]==4) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[3]==5) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[3]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[4]==5) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[4]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[5]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				}

				if(data.skill!=null) {
					var skills = data.skill.split(',');
					for(var i=0; i<skills.length; i++) {
					if(skills[i]==1) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(1)').prop('checked', true); 
					if(skills[i]==2) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(2)').prop('checked', true); 
					if(skills[i]==3) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(3)').prop('checked', true); 
					if(skills[i]==4) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(4)').prop('checked', true); 
					if(skills[i]==5) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(5)').prop('checked', true); 
					if(skills[i]==6) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(6)').prop('checked', true); 
					if(skills[i]==7) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(7)').prop('checked', true); 
					if(skills[i]==8) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(8)').prop('checked', true); 
					if(skills[i]==9) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(9)').prop('checked', true); 
					if(skills[i]==10) $('.classRegForm').find('[name="skill_category_code"]:nth-of-type(10)').prop('checked', true); 
					}
				}

				if(data.can_work_location!=null) {
					var locations = data.can_work_location.split(',');
					for(var i=0; i<locations.length; i++) {
					if(locations[i]==1) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(1)').prop('checked', true); 
					if(locations[i]==2) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(2)').prop('checked', true); 
					if(locations[i]==3) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(3)').prop('checked', true); 
					if(locations[i]==4) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(4)').prop('checked', true); 
					if(locations[i]==5) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(5)').prop('checked', true); 
					if(locations[i]==6) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(6)').prop('checked', true); 
					if(locations[i]==7) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(7)').prop('checked', true); 
					if(locations[i]==8) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(8)').prop('checked', true); 
					if(locations[i]==9) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(9)').prop('checked', true); 
					if(locations[i]==10) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(10)').prop('checked', true); 
					if(locations[i]==11) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(11)').prop('checked', true); 
					if(locations[i]==12) $('.classRegForm').find('[name="class_can_work_location"]:nth-of-type(12)').prop('checked', true); 
					}
				}

				if(data.favorite_part!=null) {
					var favorites = data.favorite_part.split(',');
					for(var i=0; i<favorites.length; i++) {
					
					if(favorites[i]==1) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(1)').prop('checked', true); 
					if(favorites[i]==2) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(2)').prop('checked', true); 
					if(favorites[i]==3) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(3)').prop('checked', true); 
					if(favorites[i]==4) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(4)').prop('checked', true); 
					if(favorites[i]==5) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(5)').prop('checked', true); 
					if(favorites[i]==6) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(6)').prop('checked', true); 
					if(favorites[i]==7) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(7)').prop('checked', true); 
					if(favorites[i]==8) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(8)').prop('checked', true); 
					if(favorites[i]==9) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(9)').prop('checked', true); 
					if(favorites[i]==10) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(10)').prop('checked', true); 
					if(favorites[i]==11) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(11)').prop('checked', true); 
					if(favorites[i]==12) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(12)').prop('checked', true); 
					if(favorites[i]==13) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(13)').prop('checked', true); 
					if(favorites[i]==14) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(14)').prop('checked', true); 
					if(favorites[i]==15) $('.classRegForm').find('[name="favorite_part_code"]:nth-of-type(15)').prop('checked', true); 
					}
				}

				if(data.license!=null) {
					var license = data.license.split(',');

					if(license[0]==1) $('.license_code:nth-of-type(1)').prop('checked', true);
					if(license[1]==2) $('.license_code:nth-of-type(2)').prop('checked', true);
				}

				if(data.black!=null) {
					var blacks = data.black.split(',');
					for(var i=0; i<license.length; i++) {
					if(blacks[i]==1) $('.classRegForm').find('[name="black_reason_name"]:nth-child(1)').prop('checked', true); 
					if(blacks[i]==2) $('.classRegForm').find('[name="black_reason_name"]:nth-child(2)').prop('checked', true); 
					if(blacks[i]==3) $('.classRegForm').find('[name="black_reason_name"]:nth-child(3)').prop('checked', true); 
					if(blacks[i]==4) $('.classRegForm').find('[name="black_reason_name"]:nth-child(4)').prop('checked', true); 
					if(blacks[i]==5) $('.classRegForm').find('[name="black_reason_name"]:nth-child(5)').prop('checked', true); 
					if(blacks[i]==6) $('.classRegForm').find('[name="black_reason_name"]:nth-child(6)').prop('checked', true); 
					}
				}

				$('.classRegForm').find('.resume_dev_year').val(data.yeoncha.substring(0, 2));
				$('.classRegForm').find('.resume_dev_month').val(data.yeoncha.substring(2,4));
				if(data.calc_yeoncha.substring(0,1)=='0') data.calc_yeoncha = data.calc_yeoncha.replace(0, '');
				$('.classRegForm').find('[name="yeoncha"]').html(data.calc_yeoncha);
			} 
		);

	$('.popup').show();	
}

function alterInfo(e) {
	var getHead = $('.classRegForm').find('header'),
			value = $('.alter_name').val();
	
	$(".popup_main").animate({ scrollTop: 0 }, "fast");
	getHead.text('수업 정보 수정');
	$('.classRegForm').find('input').css('pointer-events', 'all');
	$('.classRegForm').find('textarea').css('pointer-events', 'all');
	$('.classRegForm').find('select').css('pointer-events', 'all');
	$('.alterBtn').css('pointer-events', 'all');
	$('.alter_name').focus();
	$('.alter_name').val('');
	$('.alter_name').val(value);
	$(e).text('완료');
	$(e).attr('onclick', 'update()');
}

function update() {

		ajax(
				"/updateclassInfo.do"
				,"post"
				,formObj
				,function( boardDelCnt ){
					if( boardDelCnt>=1 ){
						alert('프리랜서 정보가 수정되었습니다.');
						closePopup();
						search();
					} else alert("WAS 접속 실패입니다. 관리자에게 문의 바랍니다.");
				}
		);
}

		function pageNoClick(
					clickPageNo      
		){
			var formObj=$("[name='searchclassDevForm']");
			formObj.find("[name='selectPageNo']").val(clickPageNo);
			search();
		}

		function search(){
		
			ajax(
						"/searchclassDev.do"
						,"post"
						,$("[name='searchclassDevForm']")
						,function(responseHtml){
							
								var obj = $(responseHtml);
								var sort = obj.find(".sort").html();
								var searchResultCnt = obj.find(".searchResultCnt").html();
								var searchResult = obj.find(".searchResult");
								var pageNos = obj.find(".pageNos").html();
								var ascDesc1 =$("[name='classSort1']").val();
								var ascDesc2 =$("[name='classSort2']").val();
								var ascDesc3 =$("[name='classSort3']").val();
								var ascDesc4 =$("[name='classSort4']").val();
								var ascDesc5 =$("[name='classSort5']").val();
								var ascDesc6 =$("[name='classSort6']").val();
								var ascDesc7 =$("[name='classSort7']").val();
								$(".sort").html(sort);
								var html = 
						'<div class="isEmpty"><i class="fa fa-search" aria-hidden="true"></i>검색 결과가 없습니다.</div>';

						$(".searchResultCnt").html(searchResultCnt);
						$(".searchResult").html(searchResult);
						$(".pageNos").html(pageNos);
						$('.pageNos').show();
						$("[name='classSort1']").val(ascDesc1);
						$("[name='classSort2']").val(ascDesc2);
						$("[name='classSort3']").val(ascDesc3);
						$("[name='classSort4']").val(ascDesc4);
						$("[name='classSort5']").val(ascDesc5);
						$("[name='classSort6']").val(ascDesc6);
						$("[name='classSort7']").val(ascDesc7);
								

						if($('.impect').text() == 0 || $('.impect').text() == '0') {
							$(".searchResult").html( html );
							$('.pageNos').hide();
						}
					}
			);
		}


		</script>
		<body>
				<form name="classSearch" class="header">
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
									<td class="main_cate" onclick="location.replace('/teaList.do')">강사 관리</td>
									<td class="main_cate active" onclick="location.replace('/classList.do')">수업 관리</td>
									<td class="main_cate" onclick="location.replace('/gyeoljaeList.do')">결재 관리</td>
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

			<div onscroll="checkScroll(this)">
				<form name="searchclassForm" class="boardForm">
					<header>
						<div>수업 검색</div>
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
									<input type="button" name="classSearch" class="classSearch desc_btn"  onclick="location.replace('/registClass.do')" value="수업 등록">
									<span class='filter' onclick="showDesc(this)"><i class="fa fa-angle-down" aria-hidden="true"></i></span>
								</div>
							</div>
							<div class="desc_box">
								<div>
									<tr>
												<div class="title">개강일</div>
															<td>
																<input type="date" name="min_start_date"> ~
																<input type="date" name="max_start_date">
																<input onclick="dateEmpty(this, 'checkbox')" type="button" name="role_reset" value="비움">
															</td>
									</tr>  
								</div>
								<div>
									<tr>
												<div class="title">수료일</div>
															<td>
																<input type="date" name="min_end_date"> ~
																<input type="date" name="max_end_date">
																<input onclick="dateEmpty(this, 'checkbox')" type="button" name="role_reset" value="비움">
															</td>
									</tr>  
								</div>
								
							
								
					</div>
					<input type="hidden" name="selectPageNo" value="1">
					<input type="hidden" name="classSort_fName">
					<input type="hidden" name="classSort_age">
					<input type="hidden" name="classSort_level_edu">
					<input type="hidden" name="classSort_yeoncha">
					<input type="hidden" name="classSort_can_dispatch_date">
					<input type="hidden" name="classSort_consultation_date">
					<input type="hidden" name="classSort_dev_year_standard_date">
							<table>
										<section>
											<section class="count_desc">
													<section class="searchResultCnt">
														검색개수 : <span class="accent impect">${classListMap.classListCnt}</span> 
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
         <div>수업명</div>
         <div>개강일</div>
         <div>종강일</div>
         <div>담당 강사명</div>
         <div>내용</div>
      </div>
         <div class="SearchResult_box">
         <div>
<c:forEach var="classList" items="${classListMap.classList}" varStatus="vs">
      <div class="searchDetail" onclick="showPopup('${classList.class_num}')">
            <div>${classListMap.begin_serialNo_desc-vs.index}</div>
            <div>${classList.class_name}</div>
            <div>${classList.class_start_date}</div>
            <div>${classList.class_end_date}</div>
            <div>${classList.take_charge_tea}</div>
            <div>${classList.class_subject}</div>
         </div>
         </c:forEach>
         </div>
   </div> 
   </div>
	<span class="pageNos"> 
		<span onClick="pageNoClick(1)"><i class="fa fa-angle-left" aria-hidden="true"></i><i class="fa fa-angle-left" aria-hidden="true"></i></span>
		<span onClick="pageNoClick(${requestScope.classListMap.selectPageNo}-1)"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
			<c:forEach var="pageNo" begin="${requestScope.classListMap.begin_pageNo}" end="${requestScope.classListMap.end_pageNo}">
				<c:if test="${requestScope.classListMap.selectPageNo==pageNo}">
					<span class='isSelect'>
						${pageNo}
					</span>
				</c:if>
			<c:if test="${requestScope.classListMap.selectPageNo!=pageNo}">
				<span style="cursor:pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
			</c:if>  
	</c:forEach> 

		<span onClick="pageNoClick(${requestScope.classListMap.selectPageNo}+1)"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
		<span onClick="pageNoClick(${requestScope.classListMap.last_pageNo})"><i class="fa fa-angle-right" aria-hidden="true"></i><i class="fa fa-angle-right" aria-hidden="true"></i></span>
	</div>    
			</form>
		</div> 
		
		<div class='popup'>
			<div class="dim">
					<div class='popup_main'>
						<form name="classRegForm" class="boardForm classRegForm">
						<header>프리랜서 개발자 상세 정보</header>
						<div class="inform">
						<div class="title">프리랜서 기본 정보</div>
						<div>
								<div class='flex'>
									<div class='desc_title'>이름</div>
									<input type='text' class='alter_name ' name="fName" value="${getclassListDetailMap.getclassListDetailList.fname}" onkeydown="checkSpace(this)"/>
								</div>
								<div class='flex'>
									<div class='desc_title'>성별</div>
									<div class='gender_box'>
										<input type="checkbox" name="gender" value="1" class="gender_m">남
										<input type="checkbox" name="gender" value="2" class="gender_w">여
									</div>
								</div>
								<div class='flex'>
									<div class='desc_title'>이메일</div>
									<input type="email" name="email" class="email" size="10" maxlength="30" onkeyup="checkSpace(this)" value="${classListDetailMap.email}">
								</div>
								<div class='flex'>
									<div class='desc_title'>핸드폰</div>
									<input type="text" name="phone" class="phone" size="10" maxlength="11" onkeyup="checkSpace(this)" value="${classListDetailMap.phone}">
								</div>
								<div class='flex'>
									<div class='desc_title'>출생년도</div>
									<input type="number" name="birth_year" class="birth_year" size="10" maxlength="4" onkeyup="checkSpace(this)" value="${classListDetailMap.birth_year}"> 년생
								</div>
								<div class='flex'>
									<div class='desc_title'>최종학력</div>
									<select name="highestLevel_edu" id="highestLevel_edu">
											<option value=""></option>
											<option value="1">고졸</option>
											<option value="2">전문대졸</option>
											<option value="3">일반대학사졸</option>
											<option value="4">일반대석사졸</option>
											<option value="5">일반대박사졸</option>
									</select>
								</div>
								<div class='flex'>
									<div class='desc_title'>졸업년도</div>
									<input type="month" name="graduate_date" class="graduate_date" min="1930-01" max="2023-12">
								</div>
						</div>
						</div>
					<div class="career">
						<div class="title">프리랜서 기본 년차</div>
						<div class="flex">
								<tr>
									<div class="dec_title">추정 개발년차</div>
									<span><span name="yeoncha">0</span> 년차</span>
								</tr>
								</div>
								<div>
								<div class="flex">
									<div class="dec_title">이력서 상 개발년차</div>
									<select name="resume_dev_year" class="resume_dev_year">
									<option value=""></option>
									<c:forEach var="nYear" begin="0" end="20">
											<c:choose>
												<c:when test="${nYear lt 10 }">
														<option value="0${nYear}">0${nYear}</option>
												</c:when>
												<c:otherwise>
														<option value="${nYear}">${nYear}</option>
												</c:otherwise>
											</c:choose>
									</c:forEach>
									</select> 년
									<select name="resume_dev_month" class="resume_dev_month">
									<option value=""></option>
									<c:forEach var="nYear" begin="0" end="11">
											<c:choose>
												<c:when test="${nYear lt 10 }">
														<option value="0${nYear}">0${nYear}</option>
												</c:when>
												<c:otherwise>
														<option value="${nYear}">${nYear}</option>
												</c:otherwise>
											</c:choose>
									</c:forEach>
									</select>개월
									<tr>
										( <input type="date" name="dev_year_standard_date" class="dev_year_standard_date"> 날짜 기준 )
									</tr>
								</div>
								</div>
						</div>
					<div class="eval">
						<div class="title">프리랜서 평가</div>
						<div class="flex">
								<tr>
									<div class="desc_title">블랙개발자</div>
									<input type="checkbox" name="black_reason_name" value="1"> 실력부족
									<input type="checkbox" name="black_reason_name" value="2"> 파견지부적응
									<input type="checkbox" name="black_reason_name" value="3"> 근태불성실
									<input type="checkbox" name="black_reason_name" value="4"> 무단이탈
									<input type="checkbox" name="black_reason_name" value="5"> 전화통화원치않음
									<input type="checkbox" name="black_reason_name" value="6"> 기타
								</tr>
						</div>
						<div class="etc">
								<div class="desc_title">기타 평가</div>
								<textarea name="etc_opinion" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
						</div>
						</div>
						<div class="dispatch">
						<div class="title">프리랜서 파견 정보</div>
						<div class="flex">
								<tr>
									<div class='desc_title'>상담시각</div>
									<input type="datetime-local" name="consultation_time" class="consultation_time consulTime"> 
									<span onclick="dateNow()" style="cursor: pointer;" class="alterBtn">[지금]</span>
									<span onclick="dateEmpty(this, 'date')" style="cursor: pointer;" class="alterBtn">[비움]</span>
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">현재직업</div>
										<input type="radio" name="job" value="1"> 프리랜서 개발자
										<input type="radio" name="job" value="2"> 정규직 개발자
										<input type="radio" name="job" value="3"> 기타직업
								</tr>
						</div>
			
						<div class="flex">
								<tr>
									<div class="desc_title">스킬분야</div>
									<input type="checkbox" name="skill_category_code" class="first_skill" value="1"> JAVA>JSP
									<input type="checkbox" name="skill_category_code" value="2"> .NET
									<input type="checkbox" name="skill_category_code" value="3"> PHP
									<input type="checkbox" name="skill_category_code" value="4"> ASP
									<input type="checkbox" name="skill_category_code" value="5"> ABAP
									<input type="checkbox" name="skill_category_code" value="6"> Delphi
									<input type="checkbox" name="skill_category_code" value="7"> PB
									<input type="checkbox" name="skill_category_code" value="8"> VC++
									<input type="checkbox" name="skill_category_code" value="9"> 웹디
									<input type="checkbox" name="skill_category_code" value="10"> 기타
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">파견역할</div>
									<input type="radio" name="dispatch_role_code" value="1"> 개발
									<input type="radio" name="dispatch_role_code" value="2"> 운영
									<input type="radio" name="dispatch_role_code" value="3"> 분석설계
									<input type="radio" name="dispatch_role_code" value="4"> PL
									<input type="radio" name="dispatch_role_code" value="5"> PM
									<input type="radio" name="dispatch_role_code" value="6"> 웹디
									<input type="radio" name="dispatch_role_code" value="7"> publisher
									<input type="radio" name="dispatch_role_code" value="8"> 기타
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">파견가능일</div>
									<input type="date" name="can_dispatch_date" class="can_dispatch_date" value="${classListDetailMap.can_dispatch_day}">
									<input type="checkbox" name="fix_dispatch_date" value="1"> 확정
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">개발 단가</div>
									<input type="number" name="min_dev_cost" class="min_dev_cost" onkeydown="checkMax(this, 10)">
									만원 ~
									<input type="number" name="max_dev_cost" class="max_dev_cost" onkeydown="checkMax(this, 10)"> 만원
								</tr>
								<span>
									<input type="checkbox" name="how_dev_cost" value="1" onchange="checkRadio(this)"> 단가고정
									<input type="checkbox" name="how_dev_cost" value="2" onchange="checkRadio(this)"> 협상후결정
								</span>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">운영 단가</div>
									<input type="number" name="min_operate_cost" class="min_operate_cost" onkeydown="checkMax(this, 10)">
									만원 ~
									<input type="number" name="max_operate_cost" class="max_operate_cost" onkeydown="checkMax(this, 10)"> 만원
								</tr>
								<span>
									<input type="checkbox" name="how_operate_cost" value="1" onchange="checkRadio(this)"> 단가고정
									<input type="checkbox" name="how_operate_cost" value="2" onchange="checkRadio(this)"> 협상후결정
								</span>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">기사자격증</div>
									<input type="checkbox" name="license_code" value="1" class="license_code"> 정보처리기사
									<input type="checkbox" name="license_code" value="2" class="license_code"> 정보처리산업기사
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">노트북 소유</div>
									<input type="checkbox" name="have_notebook" value="1"> 노트북대여희망
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">선호지역</div>
									<input type="checkbox" name="class_can_work_location" class="first_loc" value="1"> 서울
									<input type="checkbox" name="class_can_work_location" value="2"> 인천
									<input type="checkbox" name="class_can_work_location" value="3"> 경기
									<input type="checkbox" name="class_can_work_location" value="4"> 강원
									<input type="checkbox" name="class_can_work_location" value="5"> 충북
									<input type="checkbox" name="class_can_work_location" value="6"> 충남
									<input type="checkbox" name="class_can_work_location" value="7"> 전북
									<input type="checkbox" name="class_can_work_location" value="8"> 전남
									<input type="checkbox" name="class_can_work_location" value="9"> 경북
									<input type="checkbox" name="class_can_work_location" value="10"> 경남
									<input type="checkbox" name="class_can_work_location" value="11"> 제주
									<input type="checkbox" name="class_can_work_location" value="12"> 국외
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class='desc_title'>선호분야</div>
									<input type="checkbox" name="favorite_part_code" class="first_part" value="1"> 교육
									<input type="checkbox" name="favorite_part_code" value="2"> 대부
									<input type="checkbox" name="favorite_part_code" value="3"> 대학
									<input type="checkbox" name="favorite_part_code" value="4"> 보험
									<input type="checkbox" name="favorite_part_code" value="5"> 쇼핑
									<input type="checkbox" name="favorite_part_code" value="6"> 언론
									<input type="checkbox" name="favorite_part_code" value="7"> 유통
									<input type="checkbox" name="favorite_part_code" value="8"> 은행
									<input type="checkbox" name="favorite_part_code" value="9"> 의료
									<input type="checkbox" name="favorite_part_code" value="10"> 전자/전기
									<input type="checkbox" name="favorite_part_code" value="11"> 정부기관
									<input type="checkbox" name="favorite_part_code" value="12"> 증권
									<input type="checkbox" name="favorite_part_code" value="13"> 카드
									<input type="checkbox" name="favorite_part_code" value="14"> 통신
									<input type="checkbox" name="favorite_part_code" value="15"> 기타
								</tr>
						</div>
						<div class="flex">
								<tr>
									<div class="desc_title">거주지</div>
									<select name="abode">
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
									</select>시(도)
								</tr>
						</div>
						<div class="etc">
								<div class="desc_title">기타요구</div>
								<textarea name="etc_want" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
						</div>
						<div class="etc">
								<div class="desc_title">전화상담시<br>주의사항</div>
								<textarea name="call_notice" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
						</div>
						</div>	
						<span onclick="closePopup()" name="cancel" class="cancel">닫기</span>
						<span onclick="deleteInfo()" name="delete" class="delete">삭제</span>
						<span onclick="alterInfo(this)" name="save" class="save">수정</span>
						<input type="hidden" name="del_class_uid" class="del_class_uid">
					</form>
					</div>
			</div>
	</div>

	<div class="none">
		<form name="searchclassDevDetailForm" action="/classDetailForm.do" post="post">
			<input type="hidden" name="class_uid" class="class_uid" value="">
		</form>

		<form name="deleteclassInFo" action="/deleteclassInFo.do" post="post">
			<input type="hidden" name="del_class_uid" class="del_class_uid">
		</form>
	</div>
</body>
</html>