<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>동물 프로필</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 40px;
            color: #333;
        }
        .profile-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 20px;
            margin: 10px auto;
            max-width: 300px;
            text-align: center;
        }
        .profile-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }
        .profile-card h1 {
            font-size: 24px;
            margin: 10px 0;
        }
        .profile-card p {
            font-size: 16px;
            line-height: 1.5;
        }
        .profile-info {
            margin: 15px 0;
        }
        .edit-button {
            position: fixed;
            right: 20px;
            bottom: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <!-- <img src="https://example.com/path/to/image.jpg" alt="동물 이미지"> -->
        <h1>${marine.name}</h1>
        <p><strong>분류:</strong> ${marine.type}</p>
        <p><strong>성별:</strong> ${marine.gender}</p>
        <p><strong>입사 날짜:</strong> ${marine.admissionDate}</p>
        <p><strong>부상 유무:</strong> ${marine.injuryType}</p>
        <div class="profile-info">
            <p><strong>부상 내용:</strong> ${marine.injuryContent}</p>
            <p><strong>부상 날짜:</strong> ${marine.injuryDate}</p>
            <p><strong>복귀 날짜:</strong> ${marine.recoveryDate}</p>
        </div>
    </div>
    <button class="edit-button" onclick="location.href='upform?no=${marine.no}'">수정하기</button>
</body>
</html>
