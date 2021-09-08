package DTO;

import java.time.LocalDateTime;

public class TicketPurchase {
    private LocalDateTime date;
    private Passenger passengerID;
    private Flight flightID;
    private BranchBankAccount bankAccount;
    private Ticket id;

    public TicketPurchase(LocalDateTime date, Passenger passengerID, Flight flightID, BranchBankAccount bankAccount,Ticket id) {
        this.date = date;
        this.passengerID = passengerID;
        this.flightID = flightID;
        this.bankAccount = bankAccount;
        this.id=id;
    }

    public TicketPurchase() {

    }
    public Ticket getId() {
        return id;
    }

    public void setId(Ticket id) {
        this.id = id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Passenger getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(Passenger passengerID) {
        this.passengerID = passengerID;
    }

    public Flight getFlightID() {
        return flightID;
    }

    public void setFlightID(Flight flightID) {
        this.flightID = flightID;
    }

    public BranchBankAccount getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(BranchBankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }
}
