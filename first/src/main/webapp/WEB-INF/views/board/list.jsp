<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
/* 마우스가 올라가면 배경과 커서 모  양이 바뀌는 CSS */
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}

ul {
	text-align: center;
	margin: 0;
}

li {
	display: inline-block;
	list-style: none;
	padding: 16px;
	margin-right: 15px;
	list-style: none;
}



#list_btn {
	margin-right: 15px;
}
</style>

<!-- <script type="text/javascript">
	$(function() {
		// 글 리스트 중에 한줄을 클릭하면 게시판 글보기로 이동시키는 이벤트 처리
		$(".dataRow").click(function() {
			// 글번호 찾기 - 클릭한 것(this=tr) 안에 글번호 클래스 객체(td) 안에 글자(text)
			var no = $(this).find(".no").text();
			// 글보기로 이동 - 글번호를 붙여서
			location = "view.do?no=" + no + "&inc=1";
		});

	});
</script> -->

</head>

<body>
	<div class="container">
		<!-- 제목 -->
		<h1>게시판 리스트</h1>


		<!-- 데이터 테이블 -->
		<!-- bootstrap 적용 : w3schools.com 
		: 1. 라이브러리 등록 , 2.body안에 container 3. 그외필요한 객체 => tag 안에 class -->
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:if test="${empty list }">
				<!-- 데이터가 없는 경우 처리 -->
				<tr>
					<td colspan="5" class="text-center">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<!-- 데이터의 갯수 만큼 tr을 만든다. : 반복문 -> jsp jstl 사용 태그로 작성 -->

			<c:forEach items="${list}" var="list">
				<tr class="dataRow">
					<td>${list.no}</td>
					<td><a href="/board/view?no=${list.no}"><c:out
								value="${list.title}" /></a></td>
					<td>${list.writer}</td>
					<!-- 날짜형을 특별한 패턴을 만듬형식에 맞춰서 출력 : JSTL - fmt : JAVA-SimpleDateFormat -->
					<td><fmt:formatDate value="${list.writeDate}"
							pattern="yyyy.MM.dd" /></td>
					<td>${list.hit}</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="5">
				<!-- get : 주소에 입력, a href, location.href --> <a href="write">
					<button>글쓰기</button>
			</a>
			</td>
			</tr>
		</table>
		  <div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
        <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMarker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
    </div>
		<div class="bottomNav">
			<%-- 			<ul>
				<c:if test="${pageMarker.prev}">
					<li><a
						href="list${pageMarker.makeQuery(pageMarker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMarker.startPage}"
					end="${pageMarker.endPage}" var="idx">
					<li><a href="list${pageMarker.makeQuery(idx)}"><button>${idx}</button></a></li>
				</c:forEach>

				<c:if test="${pageMarker.next && pageMarker.endPage > 0}">
					<li><a
						href="list${pageMarker.makeQuery(pageMarker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul> --%>
			<ul>
				<li><c:if test="${pageMarker.prev}">
						<a href="list${pageMarker.makerSearch(pageMarker.startPage - 1)}">이전</a>
					</c:if></li>
				<li><c:forEach begin="${pageMarker.startPage}"
						end="${pageMarker.endPage}" var="idx">
						<a href="list${pageMarker.makerSearch(idx)}"><button class="btn btn-default"
								id="list_btn">${idx}</button></a>
					</c:forEach></li>
				<li><c:if test="${pageMarker.next && pageMarker.endPage > 0}">
						<a href="list${pageMarker.makerSearch(pageMarker.endPage + 1)}">다음</a>
					</c:if></li>
			</ul>
		</div>
	</div>
</body>
</html>