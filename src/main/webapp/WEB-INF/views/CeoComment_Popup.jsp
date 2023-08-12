<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 확인 팝업 페이지</title>
<link rel="stylesheet" href="css/main.css"/>
<script type="text/javascript" src="js/CeoComment_Popup.js" defer="defer"></script>
<style type="text/css">
	#header {
		padding-top: 3em;
	}
	table tr th {
		font-size: 30px; 
		text-align:center; 
		/* border-bottom: solid 3px #f56a6a; */
		padding-top: 0.6em;
	}
	table {
		width: 700px; 
		margin-left: auto; 
		margin-right: auto;
	}
	label {
		font-weight: 300;
	}
	.actions .button {
		width: 100px;
		font-size: 13px;
		font-weight: lighter;
		margin-left: 5px;
	}
</style>
</head>
<body class="is-preload">
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
				</header>
				<!-- 코멘트 -->
				<form id="reason_form" action="CeoCommentSend" method="post">
					<table>
						<tr>
							<th colspan="2">COMMENT</th>
						</tr>
						<tr>
							<td align="center" style="font-size: 20px; vertical-align: middle;">
								<label for="reason">반려 사유</label>
							</td>
							<td style="width: 550px;">
								<textarea id="reason" row="3" name="reason"
									style="width: 95%; resize: none; padding: 5px;">${co.reason}</textarea>
							</td>
						</tr>
						<tr class="actions">
							<td colspan="2" align="right">
								<!-- 코멘트 저장 -->
								<input class="button big" type="submit" id="button" value="코멘트 저장"/>
								<input class="button big" type="reset" value="다시 쓰기"/>
								<!-- 그냥 창 닫기 -->
								<input class="button big" type="button" value="닫기" onclick="closePopup()"/>
							</td>
						</tr>
						<tr style="display: none;">
						<!-- <tr> -->
							<td colspan="4">
								idx: <input type="text" name="idx" value="${co.idx}" size="1"/>&nbsp;
								status: <input type="text" name="status" value="${co.status}" size="1"/>&nbsp;
								currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/>&nbsp;
							</td>
						</tr>
					</table>
				</form>
			</div> <!-- <div class="inner"> -->
		</div> <!-- <div id="main"> -->
	</div> <!-- <div id="wrapper"> -->
</body>
</html>