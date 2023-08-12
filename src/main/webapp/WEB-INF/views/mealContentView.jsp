<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 1건</title>
<link rel="stylesheet" href="css/main.css"/>
<script src="js/mealContentDelete.js"></script>
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
		text-align:center; 
		/* border-bottom: solid 3px #f56a6a; */
		padding-top: 0.6em;
	}
	.table {
		width: 700px; 
		margin-left: auto; 
		margin-right: auto;
	}
	#menu ul li {
		font-size: 16px;
	}
	.text {
		padding: 10px;
		font-size: 18px;
		color: #3d4449;
	}
	span {
		font-size: 16px;
	}
	table .content {
		padding-left: 20px;
	}
	.actions .button {
		width: 80px;
		font-size: 13px;
		font-weight: lighter;
		margin-left: 5px;
	}
</style>
</head>
<body class="is-preload">
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
				<form action="mealContentDelete" method="post" id="delete">
					<table id="table" style="width: 800px; margin-left: auto; margin-right: auto;">
						<tr>
							<th colspan="6">식단표</th>
						</tr>
						<tr>
							<td class="text" style="width: 150px; text-align: center;">글번호</td>
							<td class="content" style="width: 150px; text-align: left;"><span>${bmo.idx}</span></td>
							<td class="text" style="width: 150px; text-align: center;">작성일</td>
							<td class="content" style="width: 300px; text-align: left;">
								<jsp:useBean id="date" class="java.util.Date"/>
								<fmt:formatDate value="${bmo.writeDate}" pattern="yyyy.MM.dd(E) a h:mm"/>
							</td>
							<td class="text" style="width: 150px; text-align: center;">작성자</td>
							<td class="content" style="width: 100px; text-align: left;"><span>${bmo.name}</span>
						</tr>
						<tr>
							<td class="text" align="center">제목</td>
							<td class="content" colspan="6">
								<c:set var="subject" value="${fn:replace(bo.subject, '<', '&lt;')}"/>
								<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
								<span>${bmo.subject}</span>
							</td>
						</tr>
						<tr>
							<td class="text" align="center">내용</td>
							<td class="content" colspan="6">
								<c:set var="content" value="${fn:replace(bo.content, '<', '&lt;')}"/>
								<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
								<span>${bmo.content}</span>
							</td>
						</tr>
						<tr class="actions">
							<td colspan="6" align="right">
								<c:if test="${mvo.cnum == 220}">
									<input 
										class="button big" 
										type="button" 
										value="수정하기"
										style="font-size: 13px;"
										onclick="location.href='boardUpdate.jsp?idx=${bo.idx}&currentPage=${currentPage}&job=update'"/>
								
									<input 
										class="button big" 
										type="button" 
										value="삭제하기"
										style="font-size: 13px;"
										onclick="confirmAndDelete()"/>
								</c:if>
								<input 
									class="button big" 
									type="button" 
									value="돌아가기"
									style="font-size: 13px;"
									onclick="location.href='boardList.jsp?cnum=${mvo.cnum}&currentPage=${currentPage}'"/>
							</td>
						</tr>
					</table>
					<input type="hidden" name="idx" value="${bmo.idx}"/>
					<input type="hidden" name="currentPage" value="${currentPage}"/>
				</form>

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