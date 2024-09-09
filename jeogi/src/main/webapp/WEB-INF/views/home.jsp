<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 예약 관리자 대시보드</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>
    <div class="sidebar">
        <h2>Dashboard</h2>
        <ul>
            <li>홈페이지수정</li>
            <li>숙소관리</li>
            <li>회원관리</li>
            <li>문의관리</li>
            <li>리뷰관리</li>
        </ul>
    </div>
    
    <div class="main-content">
        <div class="header">
            <h1>숙소 예약 관리자 대시보드</h1>
            <div class="profile">
            	<div class="">
            		<button type="button">
            			<span>로그인</span>
            		</button>
            	</div>
            </div>
        </div>
        
        <div class="stats">
            <div class="stat-box">
                <h3>Traffic</h3>
                <p>350,897</p>
                <span>▲ 3.48% Since last month</span>
            </div>
            <div class="stat-box">
                <h3>New Users</h3>
                <p>2,356</p>
                <span>▼ 3.48% Since last week</span>
            </div>
            <div class="stat-box">
                <h3>Sales</h3>
                <p>924</p>
                <span>▼ 1.10% Since yesterday</span>
            </div>
            <div class="stat-box">
                <h3>Performance</h3>
                <p>49.65%</p>
                <span>▲ 12% Since last month</span>
            </div>
        </div>
        
        <div class="charts">
            <div class="chart-box">
                <h3>Sales Value</h3>
                <canvas id="salesChart"></canvas>
            </div>
            <div class="chart-box">
                <h3>Total Orders</h3>
                <canvas id="ordersChart"></canvas>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="script.js"></script>
</body>
</html>
