<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>챗봇 상담</title>
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
        .chat-container {
            max-width: 600px;
            margin: 0 auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .chat-box {
            border: 1px solid #ddd;
            height: 400px;
            overflow-y: auto;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-bottom: 15px;
        }
        .chat-box p {
            margin: 0;
            padding: 5px;
        }
        .chat-box .bot-message {
            color: #007bff;
        }
        .chat-box .user-message {
            color: #333;
            text-align: right;
        }
        .chat-input-container {
            display: flex;
            align-items: center;
        }
        .chat-input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }
        .send-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .send-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>챗봇 상담</h1>
    <div class="chat-container">
        <div class="chat-box" id="chatBox">
            <p class="bot-message">챗봇: 안녕하세요! 어떻게 도와드릴까요?</p>
        </div>
        <div class="chat-input-container">
            <input type="text" class="chat-input" id="chatInput" placeholder="메시지를 입력하세요..." onkeydown="if(event.key === 'Enter') sendMessage()">
            <button class="send-button" onclick="sendMessage()">전송</button>
        </div>
    </div>

    <script>
        function sendMessage() {
            var input = document.getElementById('chatInput');
            var chatBox = document.getElementById('chatBox');
            var userMessage = input.value.trim();
            if (userMessage) {
                chatBox.innerHTML += `<p class="user-message">사용자: ${userMessage}</p>`;
                input.value = '';
                chatBox.innerHTML += `<p class="bot-message">챗봇: 이 기능은 아직 개발 중입니다.</p>`;
                chatBox.scrollTop = chatBox.scrollHeight;
            }
        }
    </script>
</body>
</html>
