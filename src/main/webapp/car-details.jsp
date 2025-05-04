<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Car" %>
<html>
<head>
    <title>Car Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .details-container {
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            margin-bottom: 2rem;
            background: rgba(255, 255, 255, 0.7);
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
        .car-card {
            border: none;
            border-radius: 1.2rem;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        .car-card:hover {
            transform: translateY(-5px);
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
        }
        .car-image {
            border-radius: 1.2rem 1.2rem 0 0;
            object-fit: cover;
            height: 240px;
            width: 100%;
            transition: transform 0.3s ease;
        }
        .car-image:hover {
            transform: scale(1.02);
        }
        .car-info {
            padding: 1.2rem;
        }
        .car-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #2c3e50;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 0.8rem;
            margin-top: 1.2rem;
        }
        .info-item {
            background: rgba(255, 255, 255, 0.8);
            padding: 0.8rem;
            border-radius: 0.8rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: transform 0.2s ease;
        }
        .info-item:hover {
            transform: translateY(-3px);
        }
        .info-label {
            font-size: 0.8rem;
            color: #6c757d;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.2rem;
        }
        .info-value {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2c3e50;
        }
        .price-tag {
            background: #0d6efd;
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 50px;
            font-size: 1.3rem;
            font-weight: 700;
            display: inline-block;
            margin-top: 0.6rem;
            box-shadow: 0 4px 15px rgba(13, 110, 253, 0.2);
        }
        .back-btn {
            background: rgba(13, 110, 253, 0.9);
            border: none;
            border-radius: 50px;
            padding: 0.6rem 1.5rem;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1.2rem;
        }
        .back-btn:hover {
            background: #0d6efd;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
            color: white;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>
<div class="container py-4">
    <a href="cars" class="back-btn">
        <i class="bi bi-arrow-left"></i> Back to Home
    </a>
    <%
        Car car = (Car) request.getAttribute("car");
        if (car != null) {
    %>
    <div class="details-container">
        <div class="car-card">
            <img src="images/<%= car.getImageUrl() %>" class="car-image" alt="<%= car.getBrand() %> <%= car.getModel() %>">
            <div class="car-info">
                <h1 class="car-title"><%= car.getBrand() %> <%= car.getModel() %></h1>
                <div class="price-tag">$<%= car.getPrice() %></div>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Year</div>
                        <div class="info-value"><%= car.getYear() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Brand</div>
                        <div class="info-value"><%= car.getBrand() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Model</div>
                        <div class="info-value"><%= car.getModel() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">ID</div>
                        <div class="info-value"><%= car.getId() %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } else { %>
    <div class="alert alert-danger text-center" style="border-radius: 1rem; padding: 2rem;">
        <i class="bi bi-exclamation-circle me-2"></i>Car not found.
    </div>
    <% } %>
</div>
</body>
</html> 