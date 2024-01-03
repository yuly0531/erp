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
		var formObj = $("[name='deleteteaInFo']")
		if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
		ajax(
				"/deleteteaInfo.do"
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
	var getHead = $('.teaRegForm').find('header');
	
		getHead.text('프리랜서 개발자 상세 정보');
		$('.save').text('수정');
		$('.save').attr('onclick', 'alterInfo(this)');
		$('.popup').find('input').prop('checked', false);
		$('.popup').find('textarea').val('');
		$('.popup').hide();
}

function showPopup(tea_num){
	$('.teaRegForm').find('input').css('pointer-events', 'none');
	$('.teaRegForm').find('textarea').css('pointer-events', 'none');
	$('.teaRegForm').find('select').css('pointer-events', 'none');
	$('.alterBtn').css('pointer-events', 'none');
	$('input[type=radio]').prop('checked', false);
	$(".popup_main").animate({ scrollTop: 0 }, "fast");
	$('.tea_uid').val(tea_num);
	$('.del_tea_uid, .upd_tea_uid').val(tea_num.replace('F',''));

		ajax(
			"/searchteaDevDetail.do"
			,"post"
			,$("[name='searchteaDevDetailForm']")
			,function(json){
				var data = json.teaList[0];
				
			$('.teaRegForm').find('[name="fName"]').val(data.fName);
			$('.teaRegForm').find('.email').val(data.email);
			$('.teaRegForm').find('.phone').val(data.phone);
			$('.teaRegForm').find('.birth_year').val(data.birth_year);
			$('.teaRegForm').find('.graduate_date').val(data.graduate_date);
			$('.teaRegForm').find('[name="call_notice"]').val(data.call_notice);
			$('.teaRegForm').find('[name="etc_want"]').val(data.etc_want);
			$('.teaRegForm').find('[name="etc_opinion"]').val(data.etc_opinion);
			$('.teaRegForm').find('.can_dispatch_date').val(data.can_dispatch_date);
			$('.teaRegForm').find('.consultation_time ').val(data.consultation_time);
			$('.teaRegForm').find('.min_dev_cost').val(data.min_dev_cost);
	         $('.teaRegForm').find('.max_dev_cost').val(data.max_dev_cost);
			$('.teaRegForm').find('.min_operate_cost').val(data.min_operate_cost);
			$('.teaRegForm').find('.max_operate_cost').val(data.min_operate_cost);
			$('.teaRegForm').find('.dev_year_standard_date').val(data.dev_year_standard_date);

				if(data.how_dev_cost==1)  $('.teaRegForm').find('[name="how_dev_cost"]:nth-child(1)').prop('checked', true);
				if(data.how_dev_cost==2)  $('.teaRegForm').find('[name="how_dev_cost"]:nth-child(2)').prop('checked', true);
				if(data.how_operate_cost==1)  $('.teaRegForm').find('[name="how_operate_cost"]:nth-child(1)').prop('checked', true);
				if(data.how_operate_cost==2)  $('.teaRegForm').find('[name="how_operate_cost"]:nth-child(2)').prop('checked', true);
				if(data.dispatch_role==1) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(1)').prop('checked', true);
				if(data.dispatch_role==2) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(2)').prop('checked', true);
				if(data.dispatch_role==3) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(3)').prop('checked', true);
				if(data.dispatch_role==4) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(4)').prop('checked', true);
				if(data.dispatch_role==5) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(5)').prop('checked', true);
				if(data.dispatch_role==6) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(6)').prop('checked', true);
				if(data.dispatch_role==7) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(7)').prop('checked', true);
				if(data.dispatch_role==8) $('.teaRegForm').find('[name="dispatch_role_code"]:nth-of-type(8)').prop('checked', true);
				if(data.job==1) $('.teaRegForm').find('[name="job"]:nth-of-type(1)').prop('checked', true);
				if(data.job==2) $('.teaRegForm').find('[name="job"]:nth-of-type(2)').prop('checked', true);
				if(data.job==3) $('.teaRegForm').find('[name="job"]:nth-of-type(3)').prop('checked', true);
				if(data.fix_dispatch_date==1) $('.teaRegForm').find('[name="fix_dispatch_date"]').prop('checked', true);
				if(data.gender==1)  $('.teaRegForm').find('.gender_m').prop('checked', true);
				if(data.gender==2)  $('.teaRegForm').find('.gender_w').prop('checked', true);
				if(data.have_notebook==1) $('.teaRegForm').find('[name="have_notebook"]').prop('checked', true);
				if(data.highestLevel_edu==1) $('.teaRegForm').find('#highestLevel_edu').val(1);
				if(data.highestLevel_edu==2) $('.teaRegForm').find('#highestLevel_edu').val(2);
				if(data.highestLevel_edu==3) $('.teaRegForm').find('#highestLevel_edu').val(3);
				if(data.highestLevel_edu==4) $('.teaRegForm').find('#highestLevel_edu').val(4);
				if(data.highestLevel_edu==5) $('.teaRegForm').find('#highestLevel_edu').val(5);
				if(data.abode==1) $('.teaRegForm').find('[name="abode"]').val(1);
				if(data.abode==2) $('.teaRegForm').find('[name="abode"]').val(2);
				if(data.abode==3) $('.teaRegForm').find('[name="abode"]').val(3);
				if(data.abode==4) $('.teaRegForm').find('[name="abode"]').val(4);
				if(data.abode==5)$('.teaRegForm').find('[name="abode"]').val(5);
				if(data.abode==6) $('.teaRegForm').find('[name="abode"]').val(6);
				if(data.abode==7)$('.teaRegForm').find('[name="abode"]').val(7);
				if(data.abode==8)$('.teaRegForm').find('[name="abode"]').val(8);
				if(data.abode==9) $('.teaRegForm').find('[name="abode"]').val(9);
				if(data.abode==10) $('.teaRegForm').find('[name="abode"]').val(10);

				if(data.is_black!=null) {
					var blacks = data.is_black.split(',');

				if(blacks[0]==1) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(1)').prop('checked', true);
				if(blacks[0]==2) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(2)').prop('checked', true);
				if(blacks[0]==3) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(3)').prop('checked', true);
				if(blacks[0]==4) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[0]==5) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[0]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[1]==2) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(2)').prop('checked', true);
				if(blacks[1]==3) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(3)').prop('checked', true);
				if(blacks[1]==4) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[1]==5) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[1]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[2]==3) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(3)').prop('checked', true);
				if(blacks[2]==4) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[2]==5) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[2]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[3]==4) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(4)').prop('checked', true);
				if(blacks[3]==5) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[3]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[4]==5) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(5)').prop('checked', true);
				if(blacks[4]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				if(blacks[5]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-of-type(6)').prop('checked', true);
				}

				if(data.skill!=null) {
					var skills = data.skill.split(',');
					for(var i=0; i<skills.length; i++) {
					if(skills[i]==1) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(1)').prop('checked', true); 
					if(skills[i]==2) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(2)').prop('checked', true); 
					if(skills[i]==3) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(3)').prop('checked', true); 
					if(skills[i]==4) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(4)').prop('checked', true); 
					if(skills[i]==5) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(5)').prop('checked', true); 
					if(skills[i]==6) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(6)').prop('checked', true); 
					if(skills[i]==7) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(7)').prop('checked', true); 
					if(skills[i]==8) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(8)').prop('checked', true); 
					if(skills[i]==9) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(9)').prop('checked', true); 
					if(skills[i]==10) $('.teaRegForm').find('[name="skill_category_code"]:nth-of-type(10)').prop('checked', true); 
					}
				}

				if(data.can_work_location!=null) {
					var locations = data.can_work_location.split(',');
					for(var i=0; i<locations.length; i++) {
					if(locations[i]==1) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(1)').prop('checked', true); 
					if(locations[i]==2) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(2)').prop('checked', true); 
					if(locations[i]==3) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(3)').prop('checked', true); 
					if(locations[i]==4) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(4)').prop('checked', true); 
					if(locations[i]==5) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(5)').prop('checked', true); 
					if(locations[i]==6) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(6)').prop('checked', true); 
					if(locations[i]==7) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(7)').prop('checked', true); 
					if(locations[i]==8) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(8)').prop('checked', true); 
					if(locations[i]==9) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(9)').prop('checked', true); 
					if(locations[i]==10) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(10)').prop('checked', true); 
					if(locations[i]==11) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(11)').prop('checked', true); 
					if(locations[i]==12) $('.teaRegForm').find('[name="tea_can_work_location"]:nth-of-type(12)').prop('checked', true); 
					}
				}

				if(data.favorite_part!=null) {
					var favorites = data.favorite_part.split(',');
					for(var i=0; i<favorites.length; i++) {
					
					if(favorites[i]==1) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(1)').prop('checked', true); 
					if(favorites[i]==2) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(2)').prop('checked', true); 
					if(favorites[i]==3) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(3)').prop('checked', true); 
					if(favorites[i]==4) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(4)').prop('checked', true); 
					if(favorites[i]==5) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(5)').prop('checked', true); 
					if(favorites[i]==6) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(6)').prop('checked', true); 
					if(favorites[i]==7) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(7)').prop('checked', true); 
					if(favorites[i]==8) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(8)').prop('checked', true); 
					if(favorites[i]==9) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(9)').prop('checked', true); 
					if(favorites[i]==10) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(10)').prop('checked', true); 
					if(favorites[i]==11) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(11)').prop('checked', true); 
					if(favorites[i]==12) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(12)').prop('checked', true); 
					if(favorites[i]==13) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(13)').prop('checked', true); 
					if(favorites[i]==14) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(14)').prop('checked', true); 
					if(favorites[i]==15) $('.teaRegForm').find('[name="favorite_part_code"]:nth-of-type(15)').prop('checked', true); 
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
					if(blacks[i]==1) $('.teaRegForm').find('[name="black_reason_name"]:nth-child(1)').prop('checked', true); 
					if(blacks[i]==2) $('.teaRegForm').find('[name="black_reason_name"]:nth-child(2)').prop('checked', true); 
					if(blacks[i]==3) $('.teaRegForm').find('[name="black_reason_name"]:nth-child(3)').prop('checked', true); 
					if(blacks[i]==4) $('.teaRegForm').find('[name="black_reason_name"]:nth-child(4)').prop('checked', true); 
					if(blacks[i]==5) $('.teaRegForm').find('[name="black_reason_name"]:nth-child(5)').prop('checked', true); 
					if(blacks[i]==6) $('.teaRegForm').find('[name="black_reason_name"]:nth-child(6)').prop('checked', true); 
					}
				}

				$('.teaRegForm').find('.resume_dev_year').val(data.yeoncha.substring(0, 2));
				$('.teaRegForm').find('.resume_dev_month').val(data.yeoncha.substring(2,4));
				if(data.calc_yeoncha.substring(0,1)=='0') data.calc_yeoncha = data.calc_yeoncha.replace(0, '');
				$('.teaRegForm').find('[name="yeoncha"]').html(data.calc_yeoncha);
			} 
		);

	$('.popup').show();	
}

function alterInfo(e) {
	var getHead = $('.teaRegForm').find('header'),
			value = $('.alter_name').val();
	
	$(".popup_main").animate({ scrollTop: 0 }, "fast");
	getHead.text('학생 정보 수정');
	$('.teaRegForm').find('input').css('pointer-events', 'all');
	$('.teaRegForm').find('textarea').css('pointer-events', 'all');
	$('.teaRegForm').find('select').css('pointer-events', 'all');
	$('.alterBtn').css('pointer-events', 'all');
	$('.alter_name').focus();
	$('.alter_name').val('');
	$('.alter_name').val(value);
	$(e).text('완료');
	$(e).attr('onclick', 'update()');
}

function update() {

		ajax(
				"/updateteaInfo.do"
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
			var formObj=$("[name='searchteaDevForm']");
			formObj.find("[name='selectPageNo']").val(clickPageNo);
			search();
		}

		function search(){
		
			ajax(
						"/searchteaDev.do"
						,"post"
						,$("[name='searchteaDevForm']")
						,function(responseHtml){
							
								var obj = $(responseHtml);
								var sort = obj.find(".sort").html();
								var searchResultCnt = obj.find(".searchResultCnt").html();
								var searchResult = obj.find(".searchResult");
								var pageNos = obj.find(".pageNos").html();
								var ascDesc1 =$("[name='teaSort1']").val();
								var ascDesc2 =$("[name='teaSort2']").val();
								var ascDesc3 =$("[name='teaSort3']").val();
								var ascDesc4 =$("[name='teaSort4']").val();
								var ascDesc5 =$("[name='teaSort5']").val();
								var ascDesc6 =$("[name='teaSort6']").val();
								var ascDesc7 =$("[name='teaSort7']").val();
								$(".sort").html(sort);
								var html = 
						'<div class="isEmpty"><i class="fa fa-search" aria-hidden="true"></i>검색 결과가 없습니다.</div>';

						$(".searchResultCnt").html(searchResultCnt);
						$(".searchResult").html(searchResult);
						$(".pageNos").html(pageNos);
						$('.pageNos').show();
						$("[name='teaSort1']").val(ascDesc1);
						$("[name='teaSort2']").val(ascDesc2);
						$("[name='teaSort3']").val(ascDesc3);
						$("[name='teaSort4']").val(ascDesc4);
						$("[name='teaSort5']").val(ascDesc5);
						$("[name='teaSort6']").val(ascDesc6);
						$("[name='teaSort7']").val(ascDesc7);
								

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

			<div onscroll="checkScroll(this)">
				<form name="searchteaForm" class="boardForm">
					<header>
						<div>강사 검색</div>
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
																<input onclick="dateEmpty(this, 'checkbox')" type="button" name="role_reset" value="비움">
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
					<input type="hidden" name="teaSort_fName">
					<input type="hidden" name="teaSort_age">
					<input type="hidden" name="teaSort_level_edu">
					<input type="hidden" name="teaSort_yeoncha">
					<input type="hidden" name="teaSort_can_dispatch_date">
					<input type="hidden" name="teaSort_consultation_date">
					<input type="hidden" name="teaSort_dev_year_standard_date">
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
			<div>이름</div>
			<div>성별</div>
			<div>나이</div>
			<div>학력</div>
			<div>수업시작일</div>
			<div>핸드폰</div>
			<div>이메일</div>
		</div>
			<div class="SearchResult_box">
			<div>
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
					            
						                <div class="category">
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
					                    <div class='flex'>
					                    	전화번호 :
					                        <input type="tel" name="emergency_phone"  maxlength="11"> 
					                	</div>  
					     	      		<div class="compan_div">
              <div class="category">회사 경력
              </div>
              <div class="company">
              <div class="flex">
                <div>회사명/업무</div>
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
									</div>	
						<span onclick="closePopup()" name="cancel" class="cancel">닫기</span>
						<span onclick="deleteInfo()" name="delete" class="delete">삭제</span>
						<span onclick="update()" name="save" class="save">저장</span>
						<input type="hidden" name="del_tea_uid" class="del_tea_uid">
					</form>
					</div>
			</div>
	</div>

	<div class="none">
		<form name="searchteaDevDetailForm" action="/teaDetailForm.do" post="post">
			<input type="hidden" name="tea_uid" class="tea_uid" value="">
		</form>

		<form name="deleteteaInFo" action="/deleteteaInFo.do" post="post">
			<input type="hidden" name="del_tea_uid" class="del_tea_uid">
		</form>
	</div>
</body>
</html>