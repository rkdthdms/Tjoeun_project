<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안서 결재 목록 보기</title>
<link rel="stylesheet" href="css/main.css"/>
<style type="text/css">
	.icons { /* 이름, 로그아웃 */
		height: 20px;
	}
	.icons #mainName { /* header 이름 span 태그 */
		font-size: 20px;
	}
	.icons #mainName:hover {
		font-size: 20px;
	}
	b:first-child { /* 이름 */
		font-size: 26px;
		color: #f56a6a;
	}
	b:last-child { /* 님 감사합니다. */
		font-size: 18px;
		font-weight: normal;
	}
	.icons #logout { /* 로그아웃 */
		font-size: 14px; 
		color: rgba(210, 215, 217, 0.75);
	}
	.icons #logout:hover {
		font-size: 14px; 
		color: #3d4449;
		transition: 0.2s;
	}
	table tr th {
		font-size: 30px;
		text-align: center;
		/* border-bottom: solid 3px #f56a6a; */
		padding: 0.6em;
	}
	.tr {
		font-size: 16px;
		color: #3d4449;
	}
	.actions .button {
		font-size: 13px;
		font-weight: normal;
		width: 60px;
		height: 30px;
		margin: 3px;
	}
	.write .button {
		font-size: 13px;
		font-weight: normal;
		width: 70px;
		height: 30px;
	}
	.btn {
		font-size: 13px;
		font-weight: normal;
		width: 30px;
		height: 30px;
		border-radius: 50%;
		margin: 5px;
	}
	form {
		margin: 10px;
	}
	select {
		display: inline-block;
		width: 150px;
		height: 30px;
		margin: 5px;
	}
	input[type=text] {
		display: inline-block;
		width: 250px; 
		height: 30px; 
		padding: 5px;
		margin: 5px;
	}
	input[type=submit] {
		font-size: 13px;
		font-weight: normal;
		width: 50px;
		height: 25px;
		color: #7f888f;
		border-color: #7f888f;
		margin: 5px;
	}
	#menu ul li {
		font-size: 16px;
	}
</style>
</head>
<body class="is-preload">
	<%
	request.setCharacterEncoding("UTF-8");
	
	String paper = request.getParameter("paper");
//	out.println(paper);
	%>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<div align="right">
						<ul class="icons">
							<li>
								<a href="myPage" style="font-size: 20px; border-bottom: none;">
									<span class="label" id="mainName"><b>${mvo.name}</b><b>님</b></span>
								</a>
							</li>
							<li>
								<a href="logoutOK" style="border-bottom: none;">
									<span class="label" id="logout">로그아웃</span>
								</a>
							</li>
						</ul>
					</div>
				</header>
				<%-- <c:if test="${paper eq '제안서'}"> --%> <!-- 나중에 결재안 리스트들 합쳐야 할 때 사용 -->
					<table class="table" style="width: 1000px; margin-left: auto; margin-right: auto;">
						<tr>
							<th colspan="4"><%=paper%> 결재 목록</th>
						</tr>
						<tr>
							<td colspan="4" align="right">
								${elecapprsawonList.totalCount}(${elecapprsawonList.currentPage} / ${elecapprsawonList.totalPage})
							</td>
						</tr>
						<tr class="tr">
							<td style="width: 100px; text-align: center;">글번호</td>
							<td style="width: 600px; text-align: center;">제목</td>
							<td style="width: 200px; text-align: center;">작성일</td>
							<td style="width: 100px; text-align: center;">결재 상태</td>
						</tr>
						
						<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 useBean으로 만든다. -->
						<jsp:useBean id="date" class="java.util.Date"/>
						
						<!-- 메인글을 출력한다. -->
						<c:set var="list" value="${elecapprsawonList.list}"/>
						<!-- 메인글이 1건도 없으면 글이 없다고 출력한다. -->
						<c:if test="${list.size() == 0}">
							<tr>
								<td colspan="5" align="center">
									글이 존재하지 않습니다.
								</td>
							</tr>
						</c:if>
						<!-- 메인글이 있으면 메인글의 개수만큼 반복하며 글 제목을 출력한다. -->
						<c:if test="${list.size() != 0}">
							<c:forEach var="eo" items="${list}">
								<tr>
									<td align="center">${eo.idx}</td>
									<td style="padding-left: 30px;">
										<!-- 제목에 태그 적용 불가 -->
										<c:set var="subject" value="${fn:replace(eo.subject, '<', '&lt;')}"/>
										<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
										<!-- 제목에 하이퍼링크를 걸어준다. -->
										<a href="selectsawonIdx?idx=${eo.idx}&currentPage=${currentPage}">
											${subject}
										</a>	
									</td>
									<!-- 오늘 글, 어제 글 다르게 표시 -->
									<td align="center">
										<c:if test="${date.year == eo.writeDate.year && date.month == eo.writeDate.month &&
											date.date == eo.writeDate.date}">
											<fmt:formatDate value="${eo.writeDate}" pattern="a h:mm"/>
										</c:if>			
										
										<c:if test="${date.year != eo.writeDate.year || date.month != eo.writeDate.month ||
											date.date != eo.writeDate.date}">
											<fmt:formatDate value="${eo.writeDate}" pattern="yyyy.MM.dd(E)"/>
										</c:if>				
									</td>
									<td align="center">
										<c:if test="${eo.status.equals('반려')}">
											<span style="color: #DF0101;">${eo.status}</span>
										</c:if>
										<c:if test="${eo.status.equals('승인')}">
											<span style="color: #04B4AE;">${eo.status}</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>	
						</c:if>
						<!-- 페이지 이동 버튼 -->
						<tr class="actions">
							<td colspan="4" align="center">
								<!-- 처음으로 -->
								<c:if test="${elecapprsawonList.currentPage > 1}">
									<button 
										class='button' 
										type="button" 
										title="첫 페이지로 이동합니다." 
										onclick="location.href='?currentPage=1'"
									>처음</button>
								</c:if>
								<c:if test="${elecapprsawonList.currentPage <= 1}">
									<button 
										class='button' 
										type="button" 
										disabled="disabled" 
										title="이미 첫 페이지 입니다."
									>처음</button>
								</c:if>
								<!-- 10페이지 앞으로 -->
								<c:if test="${elecapprsawonList.startPage > 1}">
									<button 
										class='button' 
										type="button" 
										title="이전 10페이지로 이동합니다." 
										onclick="location.href='?currentPage=${elecapprsawonList.startPage - 1}'"
									>이전</button>
								</c:if>
								<c:if test="${elecapprsawonList.startPage <= 1}">
									<button 
										class='button' 
										type="button" 
										disabled="disabled" 
										title="이미 첫 10페이지 입니다."
									>이전</button>
								</c:if>
								
								<!-- 페이지 이동 버튼 -->
								<c:forEach var="i" begin="${elecapprsawonList.startPage}" end="${elecapprsawonList.endPage}" step="1">
									<c:if test="${elecapprsawonList.currentPage == i}">
										<button class='btn' type='button' disabled='disabled'>${i}</button>
									</c:if>
									<c:if test="${elecapprsawonList.currentPage != i}">
										<button 
											class='btn' 
											type='button' 
											title="${i}페이지로 이동합니다."
											onclick="location.href='?currentPage=${i}'"
										>${i}</button>
									</c:if>
								</c:forEach>
								
								<!-- 10페이지 뒤로 -->
								<c:if test="${elecapprsawonList.endPage < elecapprsawonList.totalPage}">
									<button 
										class='button' 
										type="button" 
										title="다음 10페이지로 이동합니다." 
										onclick="location.href='?currentPage=${elecapprsawonList.endPage + 1}'"
									>다음</button>
								</c:if>
								<c:if test="${elecapprsawonList.endPage >= elecapprsawonList.totalPage}">
									<button 
										class='button' 
										type="button" 
										disabled="disabled" 
										title="이미 마지막 10페이지 입니다."
									>다음</button>
								</c:if>
								
								<!-- 마지막으로 -->
								<c:if test="${elecapprsawonList.currentPage < elecapprsawonList.totalPage}">
									<button
										class='button'  
										type="button" 
										title="마지막 페이지로 이동합니다." 
										onclick="location.href='?currentPage=${elecapprsawonList.totalPage}'"
									>마지막</button>
								</c:if>
								<c:if test="${elecapprsawonList.currentPage >= elecapprsawonList.totalPage}">
									<button 
										class='button' 
										type="button" 
										disabled="disabled" 
										title="이미 마지막 페이지 입니다."
									>마지막</button>
								</c:if>
							</td>
						</tr>
						<tr class="actions">
							<td colspan="4" align="right">
								<input class="button big" type="button" value="글쓰기"
									onclick="location.href='approvalInsert?paper=<%=paper%>'">
							</td>
						</tr>
					</table>
				<%-- </c:if> --%>
			</div> <!-- <div class="inner"> -->
		</div> <!-- <div id="main"> -->
		
		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="mainBoardList">홈</a></li>
						<li><a href="boardList">공지사항</a></li>
						<li><a href="#">사내 일정</a></li>
						<li>
							<span class="opener">전자 결재</span>
							<ul>
							<!-- 사장이면 전체 보기를 눌렀을 때 사장이 보는 페이지로 넘어가는 if문 만들기 -->
								<c:if test="${mvo.cnum != 220}"> <!-- 사원 -->
									<li><a href="elecapprsawonList?cnum=${mvo.cnum}">전체보기</a></li>
								</c:if>
								<c:if test="${mvo.cnum == 220}"> <!-- 사장 -->
									<li><a href="Ceo">전체보기</a></li>
								</c:if>
								<li><a href="approvalList?cnum=${mvo.cnum}&paper=지출결의서">지출결의서</a></li>
								<li><a href="approvalList?cnum=${mvo.cnum}&paper=휴가근태서">휴가근태서</a></li>
								<li><a href="approvalList?cnum=${mvo.cnum}&paper=제안서">제안서</a></li>
								<li><a href="approvalList?cnum=${mvo.cnum}&paper=공문">공문</a></li>
								<li><a href="approvalList?cnum=${mvo.cnum}&paper=사직서">사직서</a></li>
							</ul>
						</li>
						<li>
							<span class="opener">회의실 예약</span>
							<ul>
								<li><a href="getAllMeetingRooms?room_id=101">101호 회의실</a></li>
								<li><a href="getAllMeetingRooms?room_id=102">102호 회의실</a></li>
								<li><a href="getAllMeetingRooms?room_id=103">103호 회의실</a></li>
							</ul>
						</li>
						<li><a href="#">임금님 귀는 당나귀 귀</a></li>
						<li><a href="mealListView">식단표</a></li>
					</ul>
				</nav>
				<!-- Footer -->
				<footer id="footer">
				</footer>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/menu.js"></script>

</body>
</html>