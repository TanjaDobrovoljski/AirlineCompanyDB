package DTO;

import java.util.Date;

public class Airplane {
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    protected int id;
    protected String number;
    protected String manufacturer;
    protected String model;
    protected Date manufactured_date;

    public Airplane() {

    }

    public Airplane(int id,String number, String manufacturer, String model, Date manufactured_date) {
        this.number = number;
        this.manufacturer = manufacturer;
        this.model = model;
        this.manufactured_date = manufactured_date;
        this.id=id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Date getManufactured_date() {
        return manufactured_date;
    }

    public void setManufactured_date(Date manufactured_date) {
        this.manufactured_date = manufactured_date;
    }
}
