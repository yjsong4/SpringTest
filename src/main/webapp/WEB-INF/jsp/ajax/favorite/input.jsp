<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h2>즐겨찾기 추가하기</h2>
		
		<label class="mt-3">제목</label>
		<input type="text" id="nameInput" class="form-control">
		<label class="mt-3">주소</label>
		<div class="d-flex">
			<input type="text" class="form-control col-10" id="urlInput" >
			<button type="button" class="btn btn-success ml-3" id="duplicateBtn">중복 확인</button>
		</div>
		<div class="text-danger small d-none" id="urlWarning">중복된 url 입니다.</div>
		<div class="text-info small d-none" id="urlInfo">저장 가능한 url 입니다.</div>
		<button type="button" class="btn btn-success btn-block mt-4" id="addBtn">추가</button>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
	
		$(document).ready(function() {
			
			$("#duplicateBtn").on("click", function() {
				
				let url = $("#urlInput").val();
				
				if(url == "") {
					alert("주소를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/ajax/favorite/duplicate-url"
					, data:{"url":url}
					, success:function(data) {
						
						if(data.isDuplicate) {
							$("#urlWarning").removeClass("d-none");
							$("#urlInfo").addClass("d-none");
							
						} else {
							$("#urlInfo").removeClass("d-none");
							$("#urlWarning").addClass("d-none");
						}
						
					}
					, error:function() {
						alert("에러");
					}
				});		
			});
			
			$("#addBtn").on("click", function() {
				
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				if(name == "") {
					alert("사이트를 입력하세요");
					return;
				}
				if(url == "") {
					alert("주소를 입력하세요");
					return;
				}
				if(!url.startsWith("http://") && !url.startsWith("https://")) {
					alert("주소를 확인하세요");
					return;
				}

				$.ajax({
					type:"get"
					, url:"/ajax/favorite/create"
					, data:{"name":name, "url":url}
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/ajax/favorite/list";
						} else {
							alert("실패");
						}
					}
					, error:function() {
						alert("에러");
					}
				});
			});	
		});
	
	</script>
	
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>