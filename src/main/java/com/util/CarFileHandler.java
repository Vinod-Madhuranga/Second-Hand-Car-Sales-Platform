package com.util;

import com.model.Car;

import java.io.*;
import java.util.LinkedList;

public class CarFileHandler {
    private static final String FILE_PATH = "E:/Personal Projects/Second-Hand Car Sales System/src/main/webapp/WEB-INF/resources/cars.txt";

    public static LinkedList<Car> readCars() {
        LinkedList<Car> cars = new LinkedList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                Car car = Car.fromString(line);
                if (car != null) cars.add(car);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public static void writeCars(LinkedList<Car> cars) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Car car : cars) {
                bw.write(car.toString());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
} 