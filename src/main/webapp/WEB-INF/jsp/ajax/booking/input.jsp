<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class="container">
	
		<h2>예약하기</h2>
		
		<label class="mt-3">이름</label>
		<input type="text" class="form-control" id="nameInput">
		<label class="mt-3">예약날짜</label>
		<input type="text" class="form-control" id="dateInput">
		<label class="mt-3">숙박일수</label>
		<input type="text" class="form-control" id="dayInput">
		<label class="mt-3">숙박인원</label>
		<input type="text" class="form-control" id="headcountInput">
		<label class="mt-3">전화번호</label>
		<input type="text" class="form-control" id="phoneNumberInput">
		<button type="button" class="btn btn-warning btn-block mt-4" id="addBtn">예약하기</button>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
	
		$(document).ready(function() {
			
			$("#addBtn").on("click", function() {
				
				let name = $("#nameInput").val();
				let date = $("#dateInput").val();
				let day = $("#dayInput").val();
				let headcount = $("#headcountInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				
				if(name == "") {
					alert("이름을 입력하세요");
					return;
				}
				if(date == "") {
					alert("예약날짜를 입력하세요");
					return;
				}
				if(day == "") {
					alert("숙박일수를 입력하세요");
					return;
				}
				if(headcount == "") {
					alert("숙박인원을 입력하세요");
					return;
				}
				if(phoneNumber == "") {
					alert("전화번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/ajax/booking/creat"
					, data:{"name":name}
					, success
					, error
					
				});

				
			});	
	
			});
			
			
		});
	
	</script>
	

</body>
</html>