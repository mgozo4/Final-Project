<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실시간 채팅</title>
    <script>
        // WebSocket 초기화 (가정: WebSocket 서버가 '/chat'에서 서비스 중)
        const socket = new WebSocket("ws://localhost:8080/chat");

        // 서버로부터 메시지를 받으면 화면에 표시
        socket.onmessage = function(event) {
            const message = event.data;
            document.getElementById("chatLog").innerHTML += "<p><strong>상담원:</strong> " + message + "</p>";
        };

        // 메시지 서버로 전송
        function sendMessage() {
            const messageInput = document.getElementById("messageInput").value;
            if (messageInput.trim() !== "") {
                socket.send(messageInput);
                document.getElementById("chatLog").innerHTML += "<p><strong>나:</strong> " + messageInput + "</p>";
                document.getElementById("messageInput").value = ""; // 메시지 전송 후 입력 초기화
            }
        }
    </script>
</head>
<body>
    <h1>실시간 채팅</h1>

    <!-- 채팅 로그 -->
    <div id="chatLog" style="border: 1px solid #000; width: 100%; height: 400px; overflow-y: scroll;">
        <!-- 채팅 메시지 표시 -->
    </div>

    <!-- 메시지 입력 -->
    <input type="text" id="messageInput" placeholder="메시지를 입력하세요" style="width: 80%;">
    <button type="button" onclick="sendMessage()">전송</button>

</body>
</html>
