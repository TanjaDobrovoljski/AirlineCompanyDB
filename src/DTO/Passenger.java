package DTO;

import java.util.Date;

public class Passenger {
    private long passengerID;
    private String name;
    private String surname;

    public long getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(long passengerID) {
        this.passengerID = passengerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public State getZipCode() {
        return zipCode;
    }

    public void setZipCode(State zipCode) {
        this.zipCode = zipCode;
    }

    private Date dateOfBirth;
    private String address;
    private String passportNumber;

    public Passenger(long passengerID, String name, String surname, Date dateOfBirth, String address, String passportNumber, State zipCode) {
        this.passengerID = passengerID;
        this.name = name;
        this.surname = surname;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.passportNumber = passportNumber;
        this.zipCode = zipCode;
    }

    public Passenger(){

    }

    private State zipCode;

}
