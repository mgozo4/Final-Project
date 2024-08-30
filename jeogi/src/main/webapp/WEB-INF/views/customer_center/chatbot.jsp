<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>자주 묻는 질문</title>
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
        }
        .faq-list {
            list-style-type: none;
            padding: 0;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .faq-list li {
            margin-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        .faq-list li:last-child {
            border-bottom: none;
        }
        .faq-list h2 {
            margin: 0;
            cursor: pointer;
            color: #007BFF;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 8px 8px 0 0;
            transition: background-color 0.3s;
        }
        .faq-list h2:hover {
            background-color: #e9ecef;
            text-decoration: underline;
        }
        .faq-list p {
            margin: 0;
            display: none;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 0 0 8px 8px;
        }
    </style>
    <script>
        function toggleAnswer(index) {
            var answers = document.querySelectorAll('.faq-list p');
            var answer = answers[index];
            var isVisible = answer.style.display === 'block';
            
            // Hide all answers
            answers.forEach(function(p) {
                p.style.display = 'none';
            });
            
            // Toggle the clicked answer
            answer.style.display = isVisible ? 'none' : 'block';
        }
    </script>
</head>
<body>
    <h1>자주 묻는 질문</h1>
    <ul class="faq-list">
        <li>
            <h2 onclick="toggleAnswer(0)" aria-expanded="false">예약을 취소하고 싶어요.</h2>
            <p>예약을 취소하려면 고객 센터로 연락하시거나, 온라인 계정에서 취소 절차를 진행하시면 됩니다.</p>
        </li>
        <li>
            <h2 onclick="toggleAnswer(1)" aria-expanded="false">천재지변/감염병으로 인한 예약 취소는 어떻게 하나요?</h2>
            <p>천재지변이나 감염병으로 인한 예약 취소는 해당 사항을 증명할 수 있는 서류를 제출하신 후, 고객 센터를 통해 진행하실 수 있습니다.</p>
        </li>
        <li>
            <h2 onclick="toggleAnswer(2)" aria-expanded="false">환불은 어떻게 받을 수 있나요?</h2>
            <p>환불은 구매하신 제품 또는 서비스의 정책에 따라 다르며, 고객 센터에 문의하시거나 온라인 계정에서 환불 절차를 확인하실 수 있습니다.</p>
        </li>
        <li>
            <h2 onclick="toggleAnswer(3)" aria-expanded="false">제품이나 서비스에 대한 문의는 어떻게 하나요?</h2>
            <p>제품이나 서비스에 대한 문의는 고객 센터로 전화하거나, 이메일을 통해 연락하실 수 있습니다. 자세한 연락처는 웹사이트의 '문의하기' 페이지에서 확인할 수 있습니다.</p>
        </li>
        <li>
            <h2 onclick="toggleAnswer(4)" aria-expanded="false">배송 기간은 얼마나 걸리나요?</h2>
            <p>배송 기간은 주문하신 상품의 종류와 배송지에 따라 다르며, 일반적으로 3~7일 이내에 배송됩니다. 정확한 배송 기간은 주문 확인 시 안내됩니다.</p>
        </li>
        <li>
            <h2 onclick="toggleAnswer(5)" aria-expanded="false">회원 가입은 어떻게 하나요?</h2>
            <p>회원 가입은 웹사이트의 '회원 가입' 페이지에서 진행하실 수 있으며, 이메일 주소와 비밀번호를 입력하여 계정을 생성하시면 됩니다.</p>
        </li>
        <!-- 추가 FAQ 항목을 여기에 추가할 수 있습니다 -->
    </ul>
</body>
</html>
