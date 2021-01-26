<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

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
//이벤트 처리
		$(".cancelBtn").click(function() {
		//이전페이지로 돌아가기 
			history.back();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<!-- 제목 -->
		<h1>게시판 글쓰기</h1>
		<!-- 데이터 테이블 -->
		<!-- bootstrap 적용 : w3schools.com 
		: 1. 라이브러리 등록 , 2.body안에 container 3. 그외필요한 객체 => tag 안에 class -->
		<form method="post" class="form-group" action="/board/write" enctype="multipart/form-data">
			<table class="table">  
				<tr>
					<th>제목</th>
					<td><input class="form-control" name="title" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" name="content"></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input class="form-control" name="writer" /></td>
				</tr>
								<tr>
					<th>작성자</th>
					<td><input type="file" name="file" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type= "submit">등록</button>
						<button type="reset">새로입력</button>
						<button type="button" class="cancelBtn">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>