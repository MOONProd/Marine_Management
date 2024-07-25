<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal List</title>
  <style type="text/css">
      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-container input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 300px;
        }
        .search-container button {
            padding: 10px 20px;
            font-size: 16px;
            margin-left: 10px;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-container button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f9f9f9;
        }
        .status-red {
            color: red;
        }
        .status-green {
            color: green;
        }
        .status-yellow {
            color: yellow;
        }
  </style>
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
	<div class="section">

  		<h3>Animal List</h3>
  		<hr>
  		<div class="search-container">
            <input type="text" id="searchInput" placeholder="Value">
            <button onclick="searchTable()">Search</button>
        </div>
  <%-- 영역에 "list" key로 저장된 값이 있고 null이 아니라면
       영역에 "list" key로 저장된 값이 있고 List의 경우 size()가 1이상이라면   --%>
  <c:if test="${ !empty list }">
	  <table>
	    <tr>
	      <th>번호</th>
	      <th>분류</th>
	      <th>이름(어명)</th>
	      <th>입사날짜</th>
	      <th>특이사항 유무</th>
	    </tr>	
	    <tbody id="animalTable">  
	    <%-- 
	     items="${배열명}"  ==> 배열의 수만큼 반복
	     items="${list}"  ==> 영역에 "list" key로 저장된 값은 new ArrayList<marine>()
	           
	     var = "marine"   ==> forEach를 통해 반복되면서 얻어오는 marine객체 한개를 저장하는 변수
	     --%>
	    <c:forEach items="${list}" var="marine">
		    <tr>
		      <td>${marine.no}</td>
		      <%-- <td><a href="upform?no=4">나지수</a></td> --%>
		      <td>${marine.type}</td>
		      <td><a href="upform?no=${marine.no}">${marine.name}</a></td>
		      <td>${marine.admissionDate}</td>
		      <c:if test="${!empty marine.notes}">
		      	<td>O</td>
		      </c:if>
		      <c:if test="${empty marine.notes}">
		      	<td>X</td>
		      </c:if>
		    </tr>
        </c:forEach>
        </tbody> 		    
	  </table>  
   </c:if>
   </div>	  
   <%-- 
     영역에 "list" key로 저장된 값이 있고 null이라면
     영역에 "list" key로 저장된 값이 있고 List의 경우 size()가 0이라면
   --%>
   <c:if test="${empty list}">  
      등록된 Animal이 없습니다.
   </c:if>
  <br>
  <script>
        function searchTable() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const table = document.getElementById("animalTable");
            const rows = table.getElementsByTagName("tr");

            for (let i = 0; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName("td");
                let found = false;
                for (let j = 0; j < cells.length; j++) {
                    if (cells[j]) {
                        const cellValue = cells[j].textContent || cells[j].innerText;
                        if (cellValue.toLowerCase().indexOf(input) > -1) {
                            found = true;
                            break;
                        }
                    }
                }
                rows[i].style.display = found ? "" : "none";
            }
        }
    </script>
</body>
</html>





