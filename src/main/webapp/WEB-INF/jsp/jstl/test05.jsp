<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="jstl/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
	
		<nav class="main-menu">
			<img src="https://i.namu.wiki/i/M75ahxEwhGfxoStCg6Hl072Ks_3sN_olxw7RUXM1v4_6X2b_98_XR7hOQDUZBK75BHC926iYV_bF5Owf-fO8mpgP3e92KsF6Pp5cOAR1WJrflFk24ldR2i0WDb1mce7hLnparQsxZbqHWPBtSpLrxQ.svg">
			<ul class="nav flex-column">
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">날씨</a></li>
			</ul>
		</nav>
		
		<section>
			<h1>과거 날씨</h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2015년 7월 1일</td>
						<td><img src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg"></td>
						<td>21</td>
						<td>836</td>
						<td>보통</td>
						<td>2.9</td>
					</tr>
				</tbody>
			
			</table>
		</section>
		<footer>
			<div>
				<img src="https://www.weather.go.kr/w/resources/image/foot_logo2.png">
				<div>
					서울 (07062) 서울특별시 동작구 여의대방로16길 61<br>
					Copyright@2022 KMA. All Rights RESERVED.
				</div>
			</div>
		</footer>
		
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>