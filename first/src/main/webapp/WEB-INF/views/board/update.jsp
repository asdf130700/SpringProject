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

<script type="text/javascript">
	$(function() {

		// 글 리스트 중에 한줄을 클릭하면 게시판 글보기로 이동시키는 이벤트 처리
		$(".cancelBtn").click(function() {
			history.back();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<!-- 제목 -->
		<h1>게시판 글수정하기</h1>
		<div class="form-group">
			<label for="no">번호:</label> <input type="text" class="form-control"
				id="no" name="no" readonly="readonly" value="${update.no}">
		</div>
		<form method="post">
			<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title" required="required"
					maxlength="100" value="${update.title }">
			</div>
			<div class="form-group">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" id="content" name="content">${update.content }</textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자:</label> <input type="text"
					class="form-control" id="writer" name="writer" required="required"
					maxlength="10" value="${update.writer }">
			</div>
			<button type=submit class="updateBtn">수정</button>
			<button type="reset">새로입력</button>
			<button type="button" class="cancelBtn">취소</button>
		</form>
	</div>
</body>
</html>