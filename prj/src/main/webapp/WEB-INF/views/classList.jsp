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


function deleteInfo(){
		if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
		ajax(
				"/deleteClassInfo.do"
				,"post"
				,$("[name='classRegForm']")
				,function( deleteClassCnt ){
					
					if( deleteClassCnt>=1 ){
						alert("수업 정보가 삭제되었습니다.");
						closePopup();
						search();
					} else alert("WAS 접속 실패입니다. 관리자에게 문의 바랍니다.");
				}
		);
	}

function closePopup(){
	var getHead = $('.classRegForm').find('header');
	
		getHead.text('수업 상세 정보');
		$('.save').text('수정');
		$('.save').attr('onclick', 'alterInfo(this)');
		$('.popup').find('input').prop('checked', false);
		$('.popup').find('textarea').val('');
		$('.popup').hide();
}

function showPopup(class_id){
	$('.alterBtn').css('pointer-events', 'none');
	$(".popup_main").animate({ scrollTop: 0 }, "fast");
	$('.class_id').val(class_id);

		ajax(
			"/classDetail.do"
			,"post"
			,$("[name='classRegForm']")
			,function(json){
				var data = json.classList[0];
			console.log(data.take_charge_tea)
			$('.classRegForm').find('[name="class_name"]').val(data.class_name);
			$('.classRegForm').find('[name="class_start_date"]').val(data.class_start_date);
			$('.classRegForm').find('[name="class_end_date"]').val(data.class_end_date);
			$('.classRegForm').find('[name="take_charge_tea"]').val(data.take_charge_tea);
			$('.classRegForm').find('[name="class_subject"]').val(data.class_subject);
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
				"/updateClassInfo.do"
				,"post"
				,$("[name='classRegForm']")
				,function( updateClassCnt ){
					if( updateClassCnt>=1 ){
						alert('수업 정보가 수정되었습니다.');
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
						"/classList.do"
						,"post"
						,$("[name='searchclassForm']")
						,function(responseHtml){
							
								var obj = $(responseHtml);
								var sort = obj.find(".sort").html();
								var searchResultCnt = obj.find(".searchResultCnt").html();
								var searchResult = obj.find(".searchResult").html();
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
										<input type="text" name="keyword1" maxlength="30">
										<select name="orand">
													<option value="or">or
													<option value="and">and
										</select>
										<input type="text" name="keyword2" maxlength="30">
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
      <div class="searchDetail" onclick="showPopup('${classList.class_id}')">
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
						<header>수업 상세 정보</header>
						<div class="inform">
						<div class="title">수업 기본 정보</div>
						<div>
								<div class='flex'>
									<div class='desc_title'>수업명</div>
									<input type="text" name="class_name">
								</div>
								<div class='flex'>
									<div class='desc_title'>개강일</div>
                       				 <input type="date" name="class_start_date">
								</div>
								<div class='flex'>
									<div class='desc_title'>종강일</div>
			                        <input type="date" name="class_end_date">
			                    </div>
								<div class='flex'>
									<div class='desc_title'>담당 강사명</div>
										<select name="take_charge_tea">
								     	    <option value="">	
											<option value="asd">권웅순
											<option value="asd1">권웅순
											<option value="asd2">권웅순
											<option value="asd3">권웅순
											<option value="asd4">권웅순
											<option value="asd5">권웅순
										</select>
								</div>
								<div class='flex'>
									<div class='desc_title'>수업 내용</div>
			                        <textarea name="class_subject" cols="30" rows="10" maxlength="300" placeholder="최대 300자 입력"></textarea>
			                    </div>
								
						</div>	
						<span onclick="closePopup()" name="cancel" class="cancel">닫기</span>
						<span onclick="deleteInfo()" name="delete" class="delete">삭제</span>
						<span onclick="update()" name="save" class="save">저장</span>
						<input type="hidden" name="class_id" class="class_id">
					</form>
					</div>
			</div>
	</div>

	<div class="none">
		<form name="searchClassDetailForm" action="/classDetailForm.do" post="post">
		</form>

		<form name="deleteclassInFo" action="/deleteclassInFo.do" post="post">
		</form>
	</div>
</body>
</html>