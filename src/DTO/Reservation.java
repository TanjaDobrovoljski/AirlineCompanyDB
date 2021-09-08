package DTO;

import java.time.LocalDateTime;

public class Reservation {
    private int id;
    private LocalDateTime date;
    private boolean type;
    private Passenger passengerID;
    private Flight fLightID;
    private Ticket id2;

    public Reservation(int id,LocalDateTime date, boolean type, Passenger passengerID, Flight fLightID, Ticket id2) {
        this.date = date;
        this.type = type;
        this.passengerID = passengerID;
        this.fLightID = fLightID;
        this.id=id;
        this.id2=id2;
    }
    public Reservation() {

    }

    public Ticket getId2() {
        return id2;
    }

    public void setId2(Ticket id2) {
        this.id2 = id2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public Passenger getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(Passenger passengerID) {
        this.passengerID = passengerID;
    }

    public Flight getfLightID() {
        return fLightID;
    }

    public void setfLightID(Flight fLightID) {
        this.fLightID = fLightID;
    }
}
