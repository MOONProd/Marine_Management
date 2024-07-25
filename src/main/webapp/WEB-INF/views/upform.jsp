<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>생물 정보 수정</title>
    <style>
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
        .section h2 {
            margin-top: 0;
        }
        form {
            display: flex;
            flex-wrap: wrap;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group {
            flex: 1 1 45%;
            margin-right: 20px;
        }
        .form-group:last-child {
            margin-right: 0;
        }
        .form-actions {
            flex-basis: 100%;
            text-align: center;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .delete-button {
            background-color: #FF0000;
        }
        .delete-button:hover {
            background-color: #cc0000;
        }
    </style>
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
                injuryContent.value = "";  // 부상 내용 초기화
                injuryDate.value = "";     // 부상 날짜 초기화
                recoveryDate.value = "";   // 복귀 날짜 초기화
            }
        }

        // 페이지 로드 시 toggleInjuryDetails 함수를 호출
        document.addEventListener('DOMContentLoaded', function() {
            toggleInjuryDetails();
        });
    </script>
</head>
<body>
    <div class="section">
        <h2>생물 정보 수정</h2>
        <form action="/update" method="post">
            <div class="form-group">
                <label for="animalName">생물 이름 (어명)</label>
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
                <input type="date" id="admissionDate" name="admissionDate" value="${marine.admissionDate}" required>
            </div>
            <div class="form-group">
                <label for="birthYear">탄생 년도</label>
                <input type="text" id="birthYear" name="birthYear" value="${marine.birthYear}" required>
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
                <label for="injuryDetails">부상 내용</label>
                <textarea id="injuryContent" name="injuryContent" rows="4">${marine.injuryContent}</textarea>
                <label for="injuryDate">부상 날짜</label>
                <input type="date" id="injuryDate" name="injuryDate" value="${marine.injuryDate}">
                <label for="recoveryDate">복귀 날짜</label>
                <input type="date" id="recoveryDate" name="recoveryDate" value="${marine.recoveryDate}">
            </div>
            <div class="form-actions">
                <button type="submit">수정 등록</button>
                <button type="button" class="delete-button" onclick="location.href='/delete?no=${marine.no}'">삭제</button>
            </div>
        </form>
    </div>
</body>
</html>
