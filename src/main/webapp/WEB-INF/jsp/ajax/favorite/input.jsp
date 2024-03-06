<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
</head>
<body>

	<h2>즐겨찾기 추가하기</h2>
	
	<label>제목</label> <input type="text" id="nameInput"> <br>
	<label>주소</label> <input type="text" id="urlInput"> <br>
	<button type="button" id="addBtn">추가</button>
	
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
	
	
	
</body>
</html>