package com.servlet;

import com.model.Car;
import com.util.CarFileHandler;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.LinkedList;

public class CarListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<Car> cars = CarFileHandler.readCars();
        request.setAttribute("cars", cars);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-cars.jsp");
        dispatcher.forward(request, response);
    }
} 