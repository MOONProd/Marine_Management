<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/detail_styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Animal Profile</title>
</head>
<body>
	<header>
        <div class="container">
            <div class="logo"><a href="/">MOONPOOL</a></div>
            <nav>
                <ul class="hover_effect">
                    <li><a href="/">Home</a></li>
                    <li><a href="/form">Register</a></li>
                    <li><a href="/list_protect">Protect</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="profile-card">
        <i class="fas fa-fish profile-icon"></i>
        <h1>${marine.name}</h1>
        <p><i class="fas fa-tags"></i><strong> 분류:</strong> ${marine.type}</p>
        <p><i class="fas fa-venus-mars"></i><strong> 성별:</strong> ${marine.gender}</p>
        <p><i class="fas fa-calendar-alt"></i><strong> 입사 날짜:</strong> ${admissionDateStr} (D+${marine.daysSinceAdmission})</p>
        <p><i class="fas fa-birthday-cake"></i><strong> 나이:</strong> ${marine.age}세</p>
        <p><i class="fas fa-band-aid"></i><strong> 부상 유무:</strong> ${marine.injuryType}</p>
        <c:if test="${marine.injuryType == '유'}">
            <div class="profile-info">
                <p><i class="fas fa-file-medical"></i><strong> 부상 내용:</strong> ${marine.injuryContent}</p>
                <p><i class="fas fa-calendar-day"></i><strong> 부상 날짜:</strong> ${injuryDateStr}</p>
                <p><i class="fas fa-calendar-check"></i><strong> 복귀 날짜:</strong> ${recoveryDateStr}</p>
            </div>
        </c:if>
        <c:if test="${not empty marine.notes}">
            <div class="profile-info">
                <p><i class="fas fa-sticky-note"></i><strong> 특이 사항:</strong> ${marine.notes}</p>
            </div>
        </c:if>
    </div>
    <div class="form-actions">
    	<button class="button button--aylen" onclick="location.href='upform?no=${marine.no}'">수정하기</button>
    </div>
</body>
</html>
