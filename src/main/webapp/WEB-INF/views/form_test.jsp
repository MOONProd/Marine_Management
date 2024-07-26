<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/form_styles.css">
    <title>생물 등록</title>
    
    <script>
	    function toggleInjuryDetails() {
	        var injuryType = document.getElementById("injuryType").value;
	        var injuryDetails = document.getElementById("injuryDetails");
	        var injuryContent = document.getElementById("injuryContent");
	        var injuryDate = document.getElementById("injuryDate");
	        var recoveryDate = document.getElementById("recoveryDate");
	
	        if (injuryType === "유") {
	            injuryDetails.style.display = "block";
	        } else {
	            injuryDetails.style.display = "none";
	            // 부상 유무가 '무'로 변경될 때 필드를 초기화합니다.
	            injuryContent.value = "";  // 부상 내용 초기화
	            injuryDate.value = "";     // 부상 날짜 초기화
	            recoveryDate.value = "";   // 복귀 날짜 초기화
	        }
	    }
	
	    // 페이지 로드 시 toggleInjuryDetails 함수를 호출하여 적절한 섹션을 표시하거나 숨깁니다.
	    document.addEventListener('DOMContentLoaded', function() {
	        toggleInjuryDetails();
	    });
	</script>
</head>
<body>
    <header>
        <div class="container">
            <div class="logo"><a href="/">VELOCITY</a></div>
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/form">Register</a></li>
                    <li><a href="/list_protect">Protect</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="section">
        <h2>생물 등록</h2>
        <form action="/form" method="post">
            <div class="form-group">
                <label for="animalName">생물 이름 (학명)</label>
                <input type="text" id="animalName" name="name" value="${marine.name}" required>
            </div>
            <div class="form-group">
                <label for="animalType">생물 분류</label>
                <select id="animalType" name="type" onchange="toggleTypeDetails()" required>
                	<option value="해수어" ${'해수어'.equals(marine.type) ? 'selected' : ''}>해수어</option>
                	<option value="담수어" ${'담수어'.equals(marine.type) ? 'selected' : ''}>담수어</option>
                	<option value="포유류" ${'포유류'.equals(marine.type) ? 'selected' : ''}>포유류</option>
                	<option value="파충류" ${'파충류'.equals(marine.type) ? 'selected' : ''}>파충류</option>
                	<option value="기타" ${'기타'.equals(marine.type) ? 'selected' : ''}>기타</option>
                </select>
            </div>
            <div class="form-group">
                <label for="gender">성별</label>
                <input type="radio" id="male" name="gender" value="수컷" ${'수컷'.equals(marine.gender) ? 'checked' : ''} required> 수컷
                <input type="radio" id="female" name="gender" value="암컷" ${'암컷'.equals(marine.gender) ? 'checked' : ''}> 암컷
                <input type="radio" id="unknown" name="gender" value="알 수 없음" ${'알 수 없음'.equals(marine.gender) ? 'checked' : ''}> 알 수 없음
            </div>
            <div class="form-group">
                <label for="admissionDate">입사 날짜</label>
                <input type="date" id="admissionDate" name="admissionDate" value="${admissionDateStr}" required>
                <c:if test="${not empty admissionDateError}">
			        <div style="color: red;">${admissionDateError}</div>
			    </c:if>
            </div>
            <div class="form-group">
			    <label for="birthYear">태어난 해</label>
			    <input type="text" id="birthYear" name="birthYear" value="${marine.birthYear}" maxlength="4"
			           class="${not empty error ? 'error-input' : ''}" required>
			    <c:if test="${not empty error}">
			        <div style="color: red;">${error}</div>
			    </c:if>
			</div>
            <div class="form-group">
                <label for="injuryType">부상 유무</label>
                <select id="injuryType" name="injuryType" onchange="toggleInjuryDetails()" required>
                    <option value="무" ${'무'.equals(marine.injuryType) ? 'selected' : ''}>무</option>
                    <option value="유" ${'유'.equals(marine.injuryType) ? 'selected' : ''}>유</option>
                </select>
            </div>
            <div class="form-group">
                <label for="notes">특이 사항</label>
                <textarea id="notes" name="notes" rows="4">${marine.notes}</textarea>
            </div>
            <div class="form-group" id="injuryDetails" style="display: none;">
			    <label for="injuryContent">부상 내용</label>
			    <textarea id="injuryContent" name="injuryContent" rows="4" class="${not empty injuryContentError ? 'error-input' : ''}">${marine.injuryContent}</textarea>
			    <c:if test="${not empty injuryContentError}">
                    <div style="color: red;">${injuryContentError}</div>
                </c:if>
			    
			    <label for="injuryDate">부상 날짜</label>
			    <input type="date" id="injuryDate" name="injuryDate" value="${injuryDateStr}" class="${not empty injuryDateError ? 'error-input' : ''}">
			    <c:if test="${not empty injuryDateError}">
			        <div style="color: red;">${injuryDateError}</div>
			    </c:if>
			    
			    <label for="recoveryDate">복귀 날짜</label>
			    <input type="date" id="recoveryDate" name="recoveryDate" value="${recoveryDateStr}" class="${not empty recoveryDateError ? 'error-input' : ''}">
			    <c:if test="${not empty recoveryDateError}">
			        <div style="color: red;">${recoveryDateError}</div>
			    </c:if>
			    
			    <c:if test="${not empty dateError}">
			        <div style="color: red;">${dateError}</div>
			    </c:if>
			</div>
            <div class="form-actions">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
</body>
</html>
