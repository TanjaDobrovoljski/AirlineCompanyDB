package DTO;

import java.time.LocalDateTime;
import java.util.Date;

public class Flight {
    private int duration;
    private Date date;
    private int id;
    private LocalDateTime departure_moment;
    private LocalDateTime arrival_moment;
    private String departure_gate;
    private String arrival_gate;
    private Airplane airplaneID;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public LocalDateTime getDeparture_moment() {
        return departure_moment;
    }

    public void setDeparture_moment(LocalDateTime departure_moment) {
        this.departure_moment = departure_moment;
    }

    public LocalDateTime getArrival_moment() {
        return arrival_moment;
    }

    public void setArrival_moment(LocalDateTime arrival_moment) {
        this.arrival_moment = arrival_moment;
    }

    public String getDeparture_gate() {
        return departure_gate;
    }

    public void setDeparture_gate(String departure_gate) {
        this.departure_gate = departure_gate;
    }

    public String getArrival_gate() {
        return arrival_gate;
    }

    public void setArrival_gate(String arrival_gate) {
        this.arrival_gate = arrival_gate;
    }

    public Airplane getAirplaneID() {
        return airplaneID;
    }

    public void setAirplaneID(Airplane airplaneID) {
        this.airplaneID = airplaneID;
    }

    public Airport getDepartureID() {
        return departureID;
    }

    public void setDepartureID(Airport departureID) {
        this.departureID = departureID;
    }

    public Airport getArrivalID() {
        return arrivalID;
    }

    public void setArrivalID(Airport arrivalID) {
        this.arrivalID = arrivalID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private Airport departureID;
    private Airport arrivalID;
    private int status;

    public Flight(int id,int duration, Date date, LocalDateTime departure_moment, LocalDateTime arrival_moment, String departure_gate, String arrival_gate, Airplane airplaneID, Airport departureID, Airport arrivalID, int status) {
        this.duration = duration;
        this.date = date;
        this.departure_moment = departure_moment;
        this.arrival_moment = arrival_moment;
        this.departure_gate = departure_gate;
        this.arrival_gate = arrival_gate;
        this.airplaneID = airplaneID;
        this.departureID = departureID;
        this.arrivalID = arrivalID;
        this.status = status;
        this.id=id;
    }

    public Flight(int duration, Date date, LocalDateTime departure_moment, LocalDateTime arrival_moment, String departure_gate, String arrival_gate, Airplane airplaneID, Airport departureID, Airport arrivalID, int status) {
        this.duration = duration;
        this.date = date;
        this.departure_moment = departure_moment;
        this.arrival_moment = arrival_moment;
        this.departure_gate = departure_gate;
        this.arrival_gate = arrival_gate;
        this.airplaneID = airplaneID;
        this.departureID = departureID;
        this.arrivalID = arrivalID;
        this.status = status;

    }

    public Flight(){

    }
}
