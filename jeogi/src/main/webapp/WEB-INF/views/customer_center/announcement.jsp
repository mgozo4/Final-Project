<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .announcement-list {
            list-style-type: none;
            padding: 0;
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .announcement-list li {
            border-bottom: 1px solid #ddd;
            padding: 15px 20px;
            transition: background-color 0.3s;
        }
        .announcement-list li:last-child {
            border-bottom: none;
        }
        .announcement-list a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            display: block;
        }
        .announcement-list a:hover {
            text-decoration: underline;
        }
        .announcement-list .date {
            font-size: 0.9em;
            color: #666;
            margin-left: 10px;
        }
        .announcement-list .description {
            margin-top: 10px;
            color: #555;
        }
        .announcement-list .view-more {
            display: inline-block;
            margin-top: 10px;
            font-size: 0.9em;
            color: #007BFF;
            text-decoration: none;
        }
        .announcement-list .view-more:hover {
            text-decoration: underline;
        }
        .announcement-list .read-more {
            color: #007BFF;
            font-size: 0.9em;
            text-decoration: none;
        }
        .announcement-list .read-more:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>공지사항</h1>
    <ul class="announcement-list">
        <li>
            <a href="#">공지사항 제목 1</a>
            <span class="date">- 2024-08-30</span>
            <p class="description">공지사항 내용 1의 간략한 설명입니다. 전체 내용을 보려면 제목을 클릭하세요.</p>
            <a href="#" class="view-more">자세히 보기</a>
        </li>
        <li>
            <a href="#">공지사항 제목 2</a>
            <span class="date">- 2024-08-29</span>
            <p class="description">공지사항 내용 2의 간략한 설명입니다. 전체 내용을 보려면 제목을 클릭하세요.</p>
            <a href="#" class="view-more">자세히 보기</a>
        </li>
        <li>
            <a href="#">공지사항 제목 3</a>
            <span class="date">- 2024-08-28</span>
            <p class="description">공지사항 내용 3의 간략한 설명입니다. 전체 내용을 보려면 제목을 클릭하세요.</p>
            <a href="#" class="view-more">자세히 보기</a>
        </li>
        <li>
            <a href="#">공지사항 제목 4</a>
            <span class="date">- 2024-08-27</span>
            <p class="description">공지사항 내용 4의 간략한 설명입니다. 전체 내용을 보려면 제목을 클릭하세요.</p>
            <a href="#" class="view-more">자세히 보기</a>
        </li>
        <li>
            <a href="#">공지사항 제목 5</a>
            <span class="date">- 2024-08-26</span>
            <p class="description">공지사항 내용 5의 간략한 설명입니다. 전체 내용을 보려면 제목을 클릭하세요.</p>
            <a href="#" class="view-more">자세히 보기</a>
        </li>
        <!-- 더 많은 공지사항 항목을 여기에 추가할 수 있습니다 -->
    </ul>
</body>
</html>
