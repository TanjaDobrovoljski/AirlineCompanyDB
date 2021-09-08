package DTO;

public class FlightHasPassenger {
    private Passenger passengerID;
    private Flight flightID;

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

    public FlightHasPassenger(Passenger passengerID, Flight flightID) {
        this.passengerID = passengerID;
        this.flightID = flightID;
    }
}
