package DTO;

public class AirportHasHangar {
    private Airport airportID;
    private Hangar hangarID;

    public AirportHasHangar(Airport airportID, Hangar hangarID) {
        this.airportID = airportID;
        this.hangarID = hangarID;
    }

    public Airport getAirportID() {
        return airportID;
    }

    public void setAirportID(Airport airportID) {
        this.airportID = airportID;
    }

    public Hangar getHangarID() {
        return hangarID;
    }

    public void setHangarID(Hangar hangarID) {
        this.hangarID = hangarID;
    }
}
