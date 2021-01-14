<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>

<!-- Bootstrap 라이브러리 등록 : CND 방식 -> 인터넷이 되어야 한다. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
/* 마우스가 올라가면 배경과 커서 모양이 바뀌는 CSS */
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
</head>
<script type="text/javascript">
	/* $(document).ready(function(){
	 var formObj = $("form[name='deleteForm']");

	 $("#deleteBtn").on("click", (function(){
	 formObj.attr("action", "board/delete");
	 formObj.attr("method", "post");
	 formObj.submit();
	 return;
	 }
	 });
	 }); */
	$(function() {
		$("#deleteBtn").click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$("#deleteForm").submit();
				
			}
			return;
			location.href = "/board/list?page=${scri.page}"
				+ "&pageNum=${scri.pageNum}"
				+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";

		});
		$("#listBtn")
				.click(
						function() {
							location.href = "/board/list?page=${scri.page}"
									+ "&pageNum=${scri.pageNum}"
									+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
						});
		$("#updateBtn")
		.click(
				function() {
					location.href = "/board/update?no=${view.no}&page=${scri.page}"
							+ "&pageNum=${scri.pageNum}"
							+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
				});
	});
</script>
<body>
	<div class="container">
		<!-- 제목 -->
		<h1>게시판 글보기</h1>


		<!-- 데이터 테이블 -->
		<!-- bootstrap 적용 : w3schools.com 
		: 1. 라이브러리 등록 , 2.body안에 container 3. 그외필요한 객체 => tag 안에 class -->
		<form name="viewForm" role="form" method="post">
			<input type="hidden" id="no" name="no" value="${view.no}" /> 
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="pageNum" name="pageNum" value="${scri.pageNum}">
			<input type="hidden" id="searchType" name="searchType"
				value="${scri.searchType}"> <input type="hidden"
				id="keyword" name="keyword" value="${scri.keyword}">
		</form>
		<table class="table">
			<tr>
				<th>글번호</th>
				<td>${view.no }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${view.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${view.content }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${view.writer }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${view.writeDate}"
						pattern="yyyy.MM.dd" /> ${view.writeDate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${view.hit }</td>
			</tr>
			<tr>
				<td colspan="2">
<!-- 				<a href="list" id="listBtn"><button>목록보기</button></a> -->
<a href="#" id="listBtn"><button>목록보기</button></a>
<a href="#" id="updateBtn"><button>수정하기</button></a> 
<%-- 					<a href="update?no=${view.no }" id="updateBtn"><button>수정하기</button></a> 
 --%>					<a href="#" id="deleteBtn"><button>삭제하기</button></a>
			</tr>
		</table>
	</div>
	<!-- 삭제를 위한 form tag : 보이지 않는다.-->
	<form action="delete" method="post" id="deleteForm">
		<input type="hidden" name="no" value="${view.no }" />
	</form>
</body>
</html>