<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Inquiry</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function submitInquiry() {
            var inquiry = {
                user_id: $("#user_id").val(),
                title: $("#title").val(),
                content: $("#content").val(),
                status: "Pending"
            };
            
            $.ajax({
                url: '/inquiries',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(inquiry),
                success: function() {
                    alert("Inquiry submitted successfully.");
                    window.location.href = '/inquiries/list';
                },
                error: function() {
                    alert("Error submitting inquiry.");
                }
            });
        }
    </script>
</head>
<body>
    <h2>Submit a New Inquiry</h2>
    <form onsubmit="event.preventDefault(); submitInquiry();">
        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" required><br><br>

        <label for="title">Title:</label>
        <input type="text" id="title" required><br><br>

        <label for="content">Content:</label>
        <textarea id="content" required></textarea><br><br>

        <button type="submit">Submit Inquiry</button>
    </form>
</body>
</html>
