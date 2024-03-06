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
		<input type="text" id="urlInput" class="form-control">
		<button type="button" class="btn btn-success btn-block mt-4" id="addBtn">추가</button>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			
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
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
</body>
</html>