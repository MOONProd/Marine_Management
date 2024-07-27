<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/list_all_styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>Animal List</title>
</head>
<%-- 
   list.jsp 

   List<marine> list = (List<marine>)request.getAttribute("list");

   if(list.size()>1){ 테이블 출력 
      for(marine marine:list){
           marine.getName();
      }
   }
   else {등록된 marine이 없습니다.}
--%>
<body>
	<header>
		<div class="container">
			<div class="logo">
				<a href="/">MOONPOOL</a>
			</div>
			<nav>
				<ul class="hover_effect">
					<li><a href="/">Home</a></li>
					<li><a href="/form">Register</a></li>
					<li><a href="/list_protect">Protect</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="section">
		<h2><a href="/list_all">생물 친구들</a></h2>
		<hr>
		<form class="search-form">
			<input type="search" value="" placeholder="Search"
				class="search-input">
			<button type="submit" class="search-button">
				<i class="fas fa-search"></i>
			</button>
			<div class="search-option">
				<div>
					<input name="type" type="radio" value="type-number"
						id="type-number"> <label for="type-number"> <i
						class="fas fa-hashtag"></i> <span>번호</span>
					</label>
				</div>

				<div>
					<input name="type" type="radio" value="type-type" id="type-type">
					<label for="type-type"> <i class="fas fa-tags"></i> <span>분류</span>
					</label>
				</div>
				<div>
					<input name="type" type="radio" value="type-name" id="type-name">
					<label for="type-name"> <i class="fas fa-fish"></i> <span>이름</span>
					</label>
				</div>
				<div>
					<input name="type" type="radio" value="type-admission-date"
						id="type-admission-date"> <label for="type-admission-date">
						<i class="fas fa-calendar-day"></i> <span>입사일</span>
					</label>
				</div>
				<div>
					<input name="type" type="radio" value="type-notes"
						id="type-notes"> <label for="type-notes">
						<i class="fas fa-sticky-note"></i> <span>특이사항</span>
					</label>
				</div>
			</div>
		</form>
		<%-- 영역에 "list" key로 저장된 값이 있고 null이 아니라면
       영역에 "list" key로 저장된 값이 있고 List의 경우 size()가 1이상이라면   --%>
		<c:if test="${ !empty list }">
		  <div class = "tbl-header">
			<table>
			  <thead>
				<tr>
					<th class="number-column">번호</th>
					<th>분류</th>
					<th>이름(어명)</th>
					<th>입사일</th>
					<th class="info-column">특이사항 유무</th>
					<th class="info-column">정보확인</th>
				</tr>
				</thead>
		    </table>
		  </div>
		  <div class="tbl-content">
		  	<table>
				<tbody id="animalTable">
					<c:forEach items="${list}" var="marine">
						<tr>
							<td class="number-column">${marine.no}</td>
							<td>${marine.type}</td>
							<td>${marine.name}</td>
							<td><fmt:formatDate value="${marine.admissionDate}"
									pattern="yyyy-MM-dd" /></td>
							<c:if test="${!empty marine.notes}">
								<td class="info-column">O</td>
							</c:if>
							<c:if test="${empty marine.notes}">
								<td class="info-column">X</td>
							</c:if>
							<td class="info-column"><a href="detail?no=${marine.no}"><i class="fas fa-info-circle"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	      </div>
		</c:if>
	</div>
	<c:if test="${empty list}">  
      등록된 Animal이 없습니다.
   </c:if>
	<br>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		
		$(document).ready(function() {
			$('.search-input').focus(function() {
				$(this).parent().addClass('focus');
			}).blur(function() {
				$(this).parent().removeClass('focus');
				});
			$('.search-form').submit(function(e) {
				e.preventDefault();
				searchTable();
			});
			$('input[name="type"]').click( function() {
				if ($(this).is(':checked')) {
					if ($(this).data('waschecked') === true) {
						$(this).prop('checked', false);
						$(this).data('waschecked', false);
						} 
					else {
						$('input[name="type"]').data('waschecked', false);
						$(this).data('waschecked', true);
						}
					}
				});

			function searchTable() {
				const input = $('.search-input').val().toLowerCase();
				const searchType = $('input[name="type"]:checked').val();
				const table = document.getElementById("animalTable");
				const rows = table.getElementsByTagName("tr");

				for (let i = 0; i < rows.length; i++) {
					const cells = rows[i].getElementsByTagName("td");
					let found = false;

					for (let j = 0; j < cells.length; j++) {
						const cellValue = cells[j].textContent || cells[j].innerText;

						if (searchType === undefined) {
							if (cellValue.toLowerCase().indexOf(input) > -1) {
								found = true;
								break;
								}
							} 
						else {
							if ((searchType === "type-number" && j === 0) ||
									(searchType === "type-type" && j === 1) ||
									(searchType === "type-name" && j === 2) ||
									(searchType === "type-admission-date" && j === 3) ||
									(searchType === "type-notes" && j === 4)) {
									if (cellValue.toLowerCase().indexOf(input) > -1) {
										found = true;
										break;
									}
								}
							}
						}
					rows[i].style.display = found ? "" : "none";
					}
				}
			});
	</script>
</body>
</html>





