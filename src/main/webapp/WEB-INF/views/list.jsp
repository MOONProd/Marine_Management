<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal List</title>
  <style type="text/css">
     th,td{
        border: 1px solid black;
     }
     
     table{
        border-collapse: collapse;
     }
     
     th{
        background-color: skyblue;
     }
  </style>
</head>
<%-- 
   list.jsp 

   List<Person> list = (List<Person>)request.getAttribute("list");

   if(list.size()>1){ 테이블 출력 
      for(Person person:list){
           person.getName();
      }
   }
   else {등록된 Person이 없습니다.}
--%>
<body>
  <h3>Animal List</h3>
  <hr>
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
	    <%-- 
	     items="${배열명}"  ==> 배열의 수만큼 반복
	     items="${list}"  ==> 영역에 "list" key로 저장된 값은 new ArrayList<Person>()
	           
	     var = "person"   ==> forEach를 통해 반복되면서 얻어오는 Person객체 한개를 저장하는 변수
	     --%>
	    <c:forEach items="${list}" var="person">
		    <tr>
		      <td>${person.no }</td>
		      <%-- <td><a href="upform?no=4">나지수</a></td> --%>
		      <td>${person.type}</td>
		      <td><a href="upform?no=${person.no}">${person.name}</a></td>
		      <td>${person.admissionDate}</td>
		      <c:if test="${!empty person.notes}">
		      	<td>O</td>
		      </c:if>
		      <c:if test="${empty person.notes}">
		      	<td>X</td>
		      </c:if>
		    </tr>
        </c:forEach>		    
	  </table>  
   </c:if>	  
   <%-- 
     영역에 "list" key로 저장된 값이 있고 null이라면
     영역에 "list" key로 저장된 값이 있고 List의 경우 size()가 0이라면
   --%>
   <c:if test="${empty list}">  
      등록된 Person이 없습니다.
   </c:if>
  <br>
  <a href="form">Person입력하기</a>
</body>
</html>





