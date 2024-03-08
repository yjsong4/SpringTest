<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="jsp/ajax/booking/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<header class="mt-4">
		    <div class="text-center display-4">통나무 팬션</div>
		    <nav class="mt-4 bg-warning">
		        <ul class="nav nav-fill">
		            <li class="nav-item"><a class="nav-link text-white" href="#">팬션소개</a></li>
		            <li class="nav-item"><a class="nav-link text-white" href="#">객실보기</a></li>
		            <li class="nav-item"><a class="nav-link text-white" href="#">예약안내</a></li>
		            <li class="nav-item"><a class="nav-link text-white" href="#">커뮤니티</a></li>
		        </ul>
		    </nav>
		</header>
		
		<h3 class="text-center mt-3 mb-3">예약 목록 보기</h3>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>예약날짜</th>
					<th>숙박일수</th>
					<th>숙박인원</th>
					<th>전화번호</th>
					<th>예약상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookingList }">
				<tr>
					<td>${booking.name }</td>
					<td><fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 d일" /></td>
					<td>${booking.day }</td>
					<td>${booking.headcount }</td>
					<td>${booking.phoneNumber }</td>
					<c:choose>
						<c:when test="${booking.state eq '대기중' }">
							<td class="text-info">${booking.state }</td>						
						</c:when>
						<c:when test="${booking.state eq '확정' }">
							<td class="text-success">${booking.state }</td>						
						</c:when>
						<c:when test="${booking.state eq '취소' }">
							<td class="text-danger">${booking.state }</td>						
						</c:when>
						<c:otherwise>
							<td>${booking.state }</td>
						</c:otherwise>
					</c:choose>
					<td><a href="#"><button type="button" class="btn btn-danger btn-sm delete-btn">삭제</button></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<footer class="mt-3 text-secondary small">
		    <address>
		        제주특별자치도 제주시 애월읍  <br>
		        사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목 <br>
		        Copyright 2025 tongnamu All right reserved
		    </address>
		</footer>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>