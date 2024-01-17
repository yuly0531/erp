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
		function showDesc(e) {
			$('.desc_box').slideToggle();
			$('.filter').toggleClass('active');
		} 
		//플래그 추가
		var buttonsAdded = false;

		function stuSearch() {
		    var formObj = $("[name='searchStuForm']");
		    ajax(
		        "/stuJoinList.do",
		        "post",
		        formObj,
		        function(responseHtml) {
		            var obj = $(responseHtml);
		            var searchResultCnt = obj.find(".searchResultCnt").html();
		            var searchResult = obj.find(".searchResult");
		            console.log(searchResultCnt)
		            var pageNos = obj.find(".pageNos").html();
		            var html =
		                '<div class="isEmpty"><i class="fa fa-search" aria-hidden="true"></i>검색 결과가 없습니다.</div>';

		            $(".searchResultCnt").html(searchResultCnt);
		            $(".searchResult").html(searchResult);
		            $(".pageNos").html(pageNos);
		            $('.pageNos').show();

		            if ($('.impect').text() == 0 || $('.impect').text() == '0') {
		                $(".searchResult").html(html);
		                $('.pageNos').hide();
		            }

		            if (!buttonsAdded) {
		                var cancelButtonHtml = '<input type="button" name="cancel" class="stuSearch desc_btn"  onclick="closePopup()" value="취소">';
		                var saveButtonHtml = '<input type="button" name="save" class="stuSearch desc_btn"  onclick="save()" value="등록">';
		                
		                $(".pageNos").after(saveButtonHtml);
		                $(".pageNos").after(cancelButtonHtml);

		                buttonsAdded = true;
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

			
<div class='popup_stu_search'>
    <div class="dim">
       <div class='popup_stu_search_main'>
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
										<input type="button" onClick="stuSearch()" name="Search" class="search" value="검색">
									</td>
								</tr>
								<div class="button_box">
									<input type="button" onClick="reSearch4()"  name="reSearch" class="desc_btn" value="초기화 후 전부검색">
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
			<div>수강여부</div>
		</div>
			<div class="SearchResult_box">
				<c:forEach var="stuList" items="${stuListMap.stuList}" varStatus="vs">
		      		<div class="searchDetail">
			            <div>${stuListMap.begin_serialNo_desc-vs.index}</div>
			            <div>${stuList.stu_name}</div>
			            <div>${stuList.gender}</div>
			            <div>${stuList.age}</div>
			            <div>${stuList.phone_num}</div>
			            <div>${stuList.regist_date}</div>
			            <div><input type="checkbox" name="join_id" value="${stuList.stu_id}" ${stuList.isJoined ? 'checked' : ''}>
						</div>
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