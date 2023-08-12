<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재안 올리기</title>
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
		text-align:center; 
		padding-top: 0.6em;
	}
	table tr td {
		font-size: 20px; 
	}
	input[type=text], textarea {
		padding: 5px;
		width: 95%
	}
	.filebox {
		font-weight: normal;
		vertical-align: middle;
	}
	.filebox .file {
	    display: inline-block;
	    border: none;
	    width: 50%;
	    color: #999999;
	    font-size: 15px;
	}
	.filebox .file::file-selector-button {
		display: none;
	}
	.filebox label {
	    display: inline-block;
		width: 100px;
	    font-size: 15px;
		text-align: center;
	    cursor: pointer;
	    font-weight: normal;
	}
	.actions .button {
		width: 80px;
		font-size: 13px;
		font-weight: normal;
		margin-left: 5px;
	}
	#menu ul li {
		font-size: 16px;
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
				<form action="mealInsertOK" method="post">
					<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
						<tr align="center">
							<th colspan="2">게시물 올리기</th>
						</tr>
						<tr>
							<td class="td" align="center">
								<label for="subject" style="font-size: 20px;">제목</label>
							</td>
							<td>
								<input id="subject" type="text" name="subject"/>
							</td>
						</tr>
						<tr>
							<td class="td" align="center">
								<label for="content" style="font-size: 20px;">내용</label>
							</td>
							<td>
								<textarea id="content" rows="10" name="content" style="resize: none;"></textarea>
							</td>
						</tr>
						<tr class="actions">
							<td colspan="2">
								<div class="filebox">
									<label for="formFileMultiple">파일 첨부</label>
									<input class="file" type="file" id="formFileMultiple"/>
								</div>
							</td>   
						</tr>
						<tr class="actions">
							<td colspan="2" align="center">
								<input class="button big" type="submit" value="제출하기"/>
								<input class="button big" type="reset" value="다시쓰기"/>
								<c:if test="${mvo.cnum != 220}"> <!-- 사원 -->
									<input class="button big" type="button" value="목록으로" 
										onclick="location.href='elecapprsawonList?cnum=${mvo.cnum}'"/>
								</c:if>
								<c:if test="${mvo.cnum == 220}"> <!-- 사장 -->
									<input class="button big" type="button" value="목록으로" 
										onclick="mealView"/>
								</c:if>
							</td>
						</tr>
					</table>
					<input id="name" type="hidden" name="name" value="${mvo.name}"/>
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