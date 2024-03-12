<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/ajax/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
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
		
		<section>
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
						<td><a href="#"><button type="button" class="btn btn-danger btn-sm delete-btn" date-booking-id="${booking.id }">삭제</button></a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	
		<footer class="mt-3 ml-4 text-secondary small">
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
    
    <script>
    	$(document).ready(function() {
    		
    		$(".delete-btn").on("click", function() {
    			
    			// data-booking-id
    			let bookingId = $(this).data("booking-id");
    			
    			$.ajax({
    				type="get"
    				, url="/ajax/booking/delete"
    				, data={"id":bookingId}
    				, success:function(data) {
    					if(data.result == "success") {
    						// 새로 고침
    						location.reload();
    					} else {
    						alert("삭제 실패");
    					}
    				}
    				, error:function() {
    					alert("삭제 에러");
    				}
    			});
    		});
    		
    	});
    
    </script>
    
</body>
</html>