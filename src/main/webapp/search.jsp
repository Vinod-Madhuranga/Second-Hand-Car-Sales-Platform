<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Car" %>
<%@ page import="java.util.LinkedList" %>
<html>
<head>
    <title>Search Cars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .search-container {
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .search-input-group {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
        }
        .search-input {
            background: rgba(255, 255, 255, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 50px;
            padding: 1rem 1.5rem;
            padding-left: 3.5rem;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
        }
        .search-input:focus {
            background: rgba(255, 255, 255, 0.6);
            border-color: rgba(13, 110, 253, 0.5);
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
        }
        .home-icon-link {
            position: absolute;
            left: 60px;
            top: 60%;
            transform: translateY(-50%);
            color: rgb(13 110 253);
            font-size: 30px;
        }
        .search-icon {
            position: absolute;
            left: 1.2rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            font-size: 1.2rem;
        }
        .search-btn {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            border-radius: 50px;
            padding: 0.8rem 2rem;
            background: rgba(13, 110, 253, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
        }
        .search-btn:hover {
            background: rgba(13, 110, 253, 1);
            transform: translateY(-50%) scale(1.05);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
        }
        .search-title {
            text-align: center;
            color: #2c3e50;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        .car-card {
            border: none;
            border-radius: 1.2rem;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            transition: transform 0.2s, box-shadow 0.2s;
            background: linear-gradient(135deg, #f8fafc 60%, #e3e9f3 100%);
            cursor: pointer;
        }
        .car-card:hover {
            transform: translateY(-8px) scale(1.03);
            box-shadow: 0 8px 32px rgba(0,0,0,0.18);
        }
        .car-img {
            border-radius: 1.2rem 1.2rem 0 0;
            object-fit: cover;
            height: 180px;
        }
        .car-title {
            font-weight: 700;
            font-size: 1.2rem;
        }
        .badge-year {
            background: #0d6efd;
            color: #fff;
            font-size: 0.9rem;
            margin-right: 0.5rem;
        }
        .badge-price {
            background: #ffc107;
            color: #212529;
            font-size: 0.9rem;
        }
        .favorite-icon {
            color: #e25555;
            float: right;
            font-size: 1.3rem;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>
<div class="container py-4">
    <div class="search-container">
        <h2 class="search-title">Find Your Dream Car</h2>
        <a href="cars" class="home-icon-link">
            <i class="bi bi-house-door"></i>
        </a>
        <form action="search" method="get">
            <div class="search-input-group">
                <i class="bi bi-search search-icon"></i>
                <input type="text" class="search-input" name="q" 
                       placeholder="Search by brand, model, or year..." 
                       value="<%= request.getAttribute("query") != null ? request.getAttribute("query") : "" %>">
                <button class="search-btn" type="submit">
                    <i class="bi bi-search me-2"></i>Search
                </button>
            </div>
        </form>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
            LinkedList<Car> results = (LinkedList<Car>) request.getAttribute("results");
            if (results != null && !results.isEmpty()) {
                for (Car car : results) {
        %>
        <div class="col">
            <a href="car-details?id=<%= car.getId() %>" style="text-decoration:none; color:inherit;">
                <div class="card car-card h-100">
                    <img src="images/<%= car.getImageUrl() %>" class="car-img card-img-top" alt="<%= car.getBrand() %> <%= car.getModel() %>">
                    <div class="card-body">
                        <div class="car-title mb-2"><%= car.getBrand() %> <%= car.getModel() %></div>
                        <span class="badge badge-year"><%= car.getYear() %></span>
                        <span class="badge badge-price">$<%= car.getPrice() %></span>
                    </div>
                </div>
            </a>
        </div>
        <%      }
            } else { %>
        <div class="col-12">
            <div class="alert alert-warning text-center" style="border-radius: 1rem; padding: 2rem;">
                <i class="bi bi-exclamation-circle me-2"></i>No cars found for your search.
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html> 