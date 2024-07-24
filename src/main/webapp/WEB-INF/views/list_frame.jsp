<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animal List</title>
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
<body>
    <div class="section">
        <h2>Section 1</h2>
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Value">
            <button onclick="searchTable()">Search</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>분류</th>
                    <th>이름</th>
                    <th>부상시기</th>
                    <th>호전도</th>
                </tr>
            </thead>
            <tbody id="animalTable">
            <c:forEach items="${list }" var="person">
                <tr>
                    <td><a href="upform?no=${person.no}">${person.name }</a></td>
                    <td>해수어</td>
                    <td>상크스</td>
                    <td>2024.05.22</td>
                    <td><span class="status-red">●</span> 2024.09.21</td>
                </tr>
            </c:forEach>
                <tr>
                    <td>2</td>
                    <td>해수어</td>
                    <td>코식이</td>
                    <td>2024.06.18</td>
                    <td><span class="status-green">●</span> 2024.06.21</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>담수어</td>
                    <td>라본</td>
                    <td>2024.07.21</td>
                    <td><span class="status-yellow">●</span> 2024.07.31</td>
                </tr>
            </tbody>
        </table>
    </div>

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
