package com.servlet;

import com.model.Car;
import com.util.CarFileHandler;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Locale;

public class CarSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("q");
        LinkedList<Car> cars = CarFileHandler.readCars();
        LinkedList<Car> results = new LinkedList<>();
        if (query != null && !query.trim().isEmpty()) {
            String q = query.toLowerCase(Locale.ROOT);
            for (Car car : cars) {
                if (car.getBrand().toLowerCase(Locale.ROOT).contains(q) ||
                    car.getModel().toLowerCase(Locale.ROOT).contains(q) ||
                    String.valueOf(car.getYear()).contains(q)) {
                    results.add(car);
                }
            }
        }
        request.setAttribute("results", results);
        request.setAttribute("query", query);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }
} 