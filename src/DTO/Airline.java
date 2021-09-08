package DTO;


import java.util.Date;

public class Airline extends Airplane {
    private int capacity;

    public Airline(int id, String number, String manufacturer, String model, Date manufactured_date, int capacity) {
        super(id, number, manufacturer, model, manufactured_date);
        this.capacity = capacity;
    }



    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
}
