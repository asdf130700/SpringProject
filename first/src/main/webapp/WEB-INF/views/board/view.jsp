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
.rpform_write {
	position: absolute;
	width: 80%;
	float: left;
}

.rp_wrt_btn {
	position: absolute;
	width: 15%;
	float: right;
}

.rp_write {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
	height: 250px;
	padding: 15px;
	border: 1px solid gray;
	/*   position: absolute; 
  left: 50%; 
  transform: translateX(-50%);  */
}

.rp_writer {
	text-align: center;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	width: 900px;
	height: 50px;
}

.rp_content {
	top: 50%;
	lefg: 50%;
	text-align: center;
	margin-top: 20px;
	margin: 0 auto;
	word-break: break-all;
	width: 900px;
	height: 100px;
}

.dataRow:hover {
	background: #eee;
	cursor: pointer;
}

.replyList {
	text-align: center;
	margin: 0;
}

ul {
	text-align: center;
	margin: 0;
}

li {
	/* display: inline-block; */
	list-style: none;
	padding: 16px;
	margin-right: auto;
	margin-left: auto;
	list-style: none;
	border: 1px solid gray;
	text-align: left;
	width: 1200px;
	 background-color: #d2d2d2;
}

#list_btn {
	margin-right: 15px;
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
		$("#deleteBtn")
				.click(
						function() {
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
		$(".replyWriteBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/viewReply");
			formObj.submit();
		});
		//댓글 수정 View
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdate?no=${view.no}"

							+ "&page=${scri.page}"
							+ "&pageNum=${scri.pageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
		});
				
	//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDelete?no=${view.no}"
				+ "&page=${scri.page}"
				+ "&pageNum=${scri.pageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
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
			<input type="hidden" id="no" name="no" value="${view.no}" /> <input
				type="hidden" id="page" name="page" value="${scri.page}"> <input
				type="hidden" id="pageNum" name="pageNum" value="${scri.pageNum}">
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
					<a href="#" id="listBtn"><button>목록보기</button></a> <a href="#"
					id="updateBtn"><button>수정하기</button></a> <%-- 					<a href="update?no=${view.no }" id="updateBtn"><button>수정하기</button></a> 
 --%> <a href="#" id="deleteBtn"><button>삭제하기</button></a>
			</tr>
		</table>
	</div>


	<!-- 댓글 -->
	<div id="replyNav">
		<ol class="replyList">
			<c:forEach items="${replyList }" var="replyList">
				<li>
					<p>
						작성자 : ${replyList.writer} 작성 날짜 :
						<fmt:formatDate value="${replyList.writeDate}"
							pattern="yyyy-MM-dd" />
					</p>
					<br />

					<p>${replyList.content}</p>
					<div>
		  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
		  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
		</div>
				</li>
			</c:forEach>
		</ol>
	</div>
	<ol>
		<div class="rp_write">
			<form class="rpform_write" name="replyForm" method="post">
				<input type="hidden" id="no" name="no" value="${view.no}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="pageNum" name="pageNum" value="${scri.pageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}">
				<div class="re_from">
					<label for="writer">댓글 작성자</label><br />
					<input type="text" class="rp_writer" id="writer" name="writer" />
					<br /> <label for="content">댓글 내용</label><br />
					<input type="text" class="rp_content" id="content" name="content" />
				</div>
				<div class="rp_wrt_btn">
					<button type="submit" class="replyWriteBtn">작성</button>
				</div>
			</form>
		</div>
	</ol>
	

	<!-- 삭제를 위한 form tag : 보이지 않는다.-->
	<form action="delete" method="post" id="deleteForm">
		<input type="hidden" name="no" value="${view.no }" />
	</form>
</body>
</html>