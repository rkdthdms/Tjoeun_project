<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 확인 페이지</title>
<link rel="stylesheet" href="css/main.css"/>
<script type="text/javascript" src="js/CeoComment.js"></script>
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
	table td {
		padding-top: 15px;
		padding-bottom: 15px;
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
		padding-left: 10px;
		font-size: 16px;
	}
	.actions .button {
		width: 80px;
		font-size: 13px;
		font-weight: lighter;
		margin-left: 5px;
	}
	.actions .btn {
		width: 140px;
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
				<form action="CeoUpdate" method="post">
					<table style="width: 1000px; margin-left: auto; margin-right: auto;">
						<tr>
							<th colspan="8" class="th">결재 확인</th>
						</tr>
						<tr>
							<td class="text" style="width: 150px;" align="center">사원번호</td>
							<td style="width: 100px;"><span>${co.cnum}</span></td>
							<td class="text" style="width: 100px;" align="center">이름</td>
							<td style="width: 150px;">
								<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"/>
								<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
								${name}
							</td>
							<td class="text" style="width: 100px;" align="center">결재 종류</td>
							<td style="width: 200px;">${co.paper}</td>
							<td class="text" style="width: 100px;" align="center">결재 상태</td>
							<td style="width: 100px;">
								${co.status}
							</td>
						</tr>
						<jsp:useBean id="date" class="java.util.Date"/>
						<tr>
							<td class="text" align="center">제목</td>
							<td colspan="7">
								<c:set var="subject" value="${fn:replace(co.subject, '<', '&lt;')}"/>
								<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
								${subject}
							</td>
						</tr>
						<tr>
							<td class="text" align="center">내용</td>
							<td colspan="7">
								<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"/>
								<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(content, 'enter', '<br/>')}"/>
								${content} 
							</td>
						</tr>
						<tr class="actions">
							<td colspan="8" align="right">
								<c:if test="${co.cnum == 220}">
									<input 
										class="button big" 
										type="submit" 
										value="수정"
										style="font-size: 13px;"/>
								
									<input 
										class="button big" 
										type="button" 
										value="삭제"
										style="font-size: 13px;"
										onclick="location.href='CeoDelete?idx=${co.idx}&cnum=${mvo.cnum}&currentPage=${currentPage}'"/>
								</c:if>
								<input class="button big" type="button" value="승인" 
									onclick="location.href='CeoCommentUpdate?idx=${co.idx}&status=${co.status}&currentPage=${currentPage}'"/>
								<input class="button big" type="button" value="반려" onclick="reasonComment()"/>
								<input class="button big" type="button" value="전체목록"
									onclick="location.href='Ceo?currentPage=${currentPage}'"/>
							</td>
						</tr>
						<tr style="display: none;">
							<td colspan="8">
								<input type="text" name="idx" value="${co.idx}"/>
								<input type="text" name="currentPage" value="${currentPage}"/>
								<input type="text" name="subject" value="${co.subject}"/>
								<input type="text" name="content" value="${co.content}"/>
								<input type="text" name="status" value="${co.status}"/>
								<input type="text" name="reason" value="${co.reason}"/>
								<input type="text" name="paper" value="${co.paper}"/>
							</td>
						</tr>
					</table>
				</form>
				<c:if test="${co.reason != null}">
					<table style="width: 1000px; margin-left: auto; margin-right: auto;">
						<tr class="tr">
							<th style="font-size: 22px;">반려 사유</th>
						</tr>
						<tr>
							<td>
								<c:set var="reason" value="${fn:replace(co.reason, '<', '&lt;')}"/>
								<c:set var="reason" value="${fn:replace(reason, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(reason, 'enter', '<br/>')}"/>
								<span>${reason}</span>
							</td>
						</tr>
						<tr class="actions">
							<td align="right">
								<input class="btn" type="button" value="코멘트 수정하기" onclick="reasonComment()"/>
							</td>
						</tr>
					</table>
				</c:if>
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