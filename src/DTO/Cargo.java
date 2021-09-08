package DTO;

import java.util.Date;

public class Cargo extends Airplane {
    private double capacity;

    public Cargo(int id, String number, String manufacturer, String model, Date manufactured_date, double capacity) {
        super(id, number, manufacturer, model, manufactured_date);
        this.capacity = capacity;
    }

    public double getCapacity() {
        return capacity;
    }

    public void setCapacity(double capacity) {
        this.capacity = capacity;
    }
}
