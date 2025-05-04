package com.servlet;

import com.model.Car;
import com.util.CarFileHandler;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.LinkedList;

public class CarDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            LinkedList<Car> cars = CarFileHandler.readCars();
            Car found = null;
            for (Car car : cars) {
                if (car.getId() == id) {
                    found = car;
                    break;
                }
            }
            request.setAttribute("car", found);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("car-details.jsp");
        dispatcher.forward(request, response);
    }
} 