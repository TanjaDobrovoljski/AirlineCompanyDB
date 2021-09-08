package DTO;

public class Ticket {
    private int id;
    private double price;
    private char seatClass;
    private  String seat;
    private Flight flightID;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Ticket() {

    }

    public Ticket(int id,double price, char seatClass, String seat, Flight flightID) {
        this.price = price;
        this.seatClass = seatClass;
        this.seat = seat;
        this.flightID = flightID;

        this.id=id;
    }


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public char getSeatClass() {
        return seatClass;
    }

    public void setSeatClass(char seatClass) {
        this.seatClass = seatClass;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public Flight getFlightID() {
        return flightID;
    }

    public void setFlightID(Flight flightID) {
        this.flightID = flightID;
    }


}
