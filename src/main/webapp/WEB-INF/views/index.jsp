<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marine Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .section {
            background-color: #e0e0e0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .section1, .section3, .section4 {
            margin-bottom: 20px;
        }
        .section h2 {
            margin-top: 0;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .search-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .search-container input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="section section1">
        <h2>생물 등록</h2>
        <button class="button" onclick="location.href='form'">등록</button>
    </div>

    <div>
        <div class="section section3">
            <h2>관리동물 리스트</h2>
            <div class="search-container">
                <input type="text" placeholder="검색">
                <button class="button" onclick="location.href='list'">검색</button>
            </div>
        </div>

        <div class="section section4">
            <h2>생물 리스트</h2>
            <div class="search-container">
                <input type="text" placeholder="검색">
                <button class="button" onclick="location.href='list'">검색</button>
            </div>
        </div>
    </div>
</body>
</html>
