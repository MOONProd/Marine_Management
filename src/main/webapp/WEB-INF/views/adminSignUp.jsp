 <%@ page contentType="text/html;charset=UTF-8" language="java"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/signup_styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<header>
        <div class="container">
            <div class="logo"><a href="/">MOONPOOL</a></div>
            <nav>
                <ul class="hover_effect">
                    <li><a href="/">Home</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="content">
      <div class="section">
        <h2>관리자 승인</h2>
        <form method="post">
          <div class="form-card">
            <div class="form-group">
                <label for="adminCode">관리자 코드:</label>
                <input type="text" id="adminCode" name="adminCode" required autocomplete="off">
            </div>
            <div class="form-actions">
            	<button type="submit" class="button button--aylen">확인</button>
            </div>
           </div>
        </form>
        <c:if test="${not empty error}">
            <div class="error-message visible">
            	<i class="fas fa-ban"></i>${error}
            </div>
        </c:if>
        </div>
    </div>
</body>
</html>
 