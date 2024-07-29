<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/form_styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>Update Animal Info</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
			injuryContent.value = ""; // 부상 내용 초기화
			injuryDate.value = ""; // 부상 날짜 초기화
			recoveryDate.value = ""; // 복귀 날짜 초기화
		}
	}

	// 페이지 로드 시 toggleInjuryDetails 함수를 호출
	document.addEventListener('DOMContentLoaded', function() {
		/* console.log('In DOMContentLoaded:');
	    console.log('Injury Date:', document.getElementById('injuryDate').value);
	    console.log('Recovery Date:', document.getElementById('recoveryDate').value);
 */
		toggleInjuryDetails();
	});
	
	function confirmDelete() {
        var modal = document.getElementById("deleteModal");
        modal.style.display = "block";
    }

    function closeModal() {
        var modal = document.getElementById("deleteModal");
        modal.style.display = "none";
    }

    function deleteRecord() {
        $.ajax({
            url: '/delete',
            type: 'GET',
            data: { no: '${marine.no}', injuryType: '${marine.injuryType}' },
            success: function(response) {
                var modal = document.getElementById("deleteModal");
                modal.style.display = "block";
                $('.confirm-button').click(function() {
                    modal.style.display = "none";
                    if ('${marine.injuryType}' === '유') {
                        window.location.href = 'list_protect';
                    } else {
                        window.location.href = 'list_all';
                    }
                });
            }
        });
    }
	
</script>
</head>
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
					<li><a href="/list_all">All</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="content">
		<div class="section">
			<h2>생물 정보 수정</h2>
			<form method="post">
				<div class="form-card">
					<input type="hidden" name="no" value="${marine.no}">
					<div class="form-group">
						<label for="animalName" class="icon-label"><i
							class="fas fa-fish"></i></label> <input type="text" id="animalName"
							name="name" value="${marine.name}" placeholder="생물 이름 (학명)"
							readonly>
					</div>
					<div class="form-group">
						<label for="animalType" class="icon-label"><i
							class="fas fa-tags"></i></label> <select id="animalType" name="type"
							onchange="toggleTypeDetails()">
							<option value="해수어"
								${'해수어'.equals(marine.type) ? 'selected' : ''}>해수어</option>
							<option value="담수어"
								${'담수어'.equals(marine.type) ? 'selected' : ''}>담수어</option>
							<option value="포유류"
								${'포유류'.equals(marine.type) ? 'selected' : ''}>포유류</option>
							<option value="파충류"
								${'파충류'.equals(marine.type) ? 'selected' : ''}>파충류</option>
							<option value="기타" ${'기타'.equals(marine.type) ? 'selected' : ''}>기타</option>
						</select>
					</div>
					<div class="form-group">
						<label class="icon-label"><i class="fas fa-venus-mars"></i></label>
						<div class="radio-wrapper-20">
							<label for="male"> <input type="radio" id="male"
								name="gender" value="수컷"
								${'수컷'.equals(marine.gender) ? 'checked' : ''} required>
								<span class="name">수컷</span>
							</label> <label for="female"> <input type="radio" id="female"
								name="gender" value="암컷"
								${'암컷'.equals(marine.gender) ? 'checked' : ''}> <span
								class="name">암컷</span>
							</label> <label for="unknown"> <input type="radio" id="unknown"
								name="gender" value="알 수 없음"
								${'알 수 없음'.equals(marine.gender) ? 'checked' : ''}> <span
								class="name">알 수 없음</span>
							</label>
						</div>
					</div>
					<div
						class="form-group ${not empty admissionDateError ? 'invalid' : ''}">
						<label for="admissionDate" class="icon-label"><i
							class="fas fa-calendar-alt"></i></label> <input type="date"
							id="admissionDate" name="admissionDate"
							value="${admissionDateStr}" readonly>
						<c:if test="${not empty admissionDateError}">
							<div class="error-message">${admissionDateError}</div>
						</c:if>
					</div>
					<div class="form-group ${not empty error ? 'invalid' : ''}">
						<label for="birthYear" class="icon-label"><i
							class="fas fa-birthday-cake"></i></label> <input type="text"
							id="birthYear" name="birthYear"
							value="${marine.birthYear != null ? marine.birthYear : ''}"
							maxlength="4" class="${not empty error ? 'error-input' : ''}"
							placeholder="태어난 해" readonly>
						<c:if test="${not empty error}">
							<div class="error-message">${error}</div>
						</c:if>
					</div>
					<div class="form-group ${not empty injuryContentError ? 'invalid' : ''}">
						<label for="injuryType"class="icon-label"><i class="fas fa-band-aid"></i></label>
						<select id="injuryType" name="injuryType" onchange="toggleInjuryDetails()" required>
							<option value="무"
								${'무'.equals(marine.injuryType) ? 'selected' : ''}>무</option>
							<option value="유"
								${'유'.equals(marine.injuryType) ? 'selected' : ''}>유</option>
						</select>
					</div>
					<div class="form-group">
						<label for="notes" class="icon-label"><i class="fas fa-sticky-note"></i></label>
						<textarea id="notes" name="notes" rows="4" placeholder="특이 사항">${marine.notes}</textarea>
					</div>
					<div class="form-group ${not empty injuryContentError ? 'invalid' : ''}" id="injuryDetails" style="display: none;">
						<label for="injuryDetails" class="injury-icon-label"><i class="fas fa-file-medical"></i></label>
						<textarea id="injuryContent" name="injuryContent" rows="4"
							class="${not empty injuryContentError ? 'error-input' : ''}" placeholder="부상 내용">${marine.injuryContent}</textarea>
						<c:if test="${not empty injuryContentError}">
							<div class="error-message">${injuryContentError}</div>
						</c:if>
						<div class="form-group ${not empty injuryDateError ? 'invalid' : ''}">
							<label for="injuryDate" class="injury-icon-label"><i class="fas fa-calendar-day"></i></label>
							<input type="date" id="injuryDate" name="injuryDate" value="${injuryDateStr}"
								class="${not empty injuryDateError ? 'error-input' : ''}">
							<c:if test="${not empty injuryDateError}">
								<div class="error-message">${injuryDateError}</div>
							</c:if>
						</div>
						<div class="form-group ${not empty recoveryDateError ? 'invalid' : ''}">
							<label for="recoveryDate" class="injury-icon-label"><i class="fas fa-calendar-check"></i></label>
							<input type="date" id="recoveryDate" name="recoveryDate" value="${recoveryDateStr}"
								class="${not empty recoveryDateError ? 'error-input' : ''}">
							<c:if test="${not empty recoveryDateError}">
								<div class="error-message">${recoveryDateError} </div>
							</c:if>
						</div>
						<c:if test="${not empty dateError}">
                            <div class="error-message">${dateError}</div>
                        </c:if>
                      </div>
					<div class="form-actions">
						<button type="submit" class="button button--aylen">수정 등록</button>
						<button type="button" class="delete-button button button--aylen" onclick="confirmDelete()">삭제</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="deleteModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p>삭제되었습니다.</p>
            <button class="confirm-button" onclick="deleteRecord()">확인</button>
        </div>
    </div>
</body>
</html>
