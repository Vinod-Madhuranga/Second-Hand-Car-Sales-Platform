package com.model;

public class Car {
    private int id;
    private String brand;
    private String model;
    private int year;
    private double price;
    private String imageUrl;

    public Car(int id, String brand, String model, int year, double price, String imageUrl) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    @Override
    public String toString() {
        return id + "|" + brand + "|" + model + "|" + year + "|" + price + "|" + imageUrl;
    }

    public static Car fromString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length != 6) return null;
        return new Car(
            Integer.parseInt(parts[0]),
            parts[1],
            parts[2],
            Integer.parseInt(parts[3]),
            Double.parseDouble(parts[4]),
            parts[5]
        );
    }
} 