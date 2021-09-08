package DTO;
import DTO.Airport;

public class AirportHasAirplane {
    private Airport airport;
    private Airplane airplane;
    private int airport_id;
    private int airplane_id;

    public AirportHasAirplane(int airport_id, int airplane_id) {
        this.airport_id = airport_id;
        this.airplane_id = airplane_id;
    }

    public AirportHasAirplane(Airport airport, Airplane airplane) {
        this.airport = airport;
        this.airplane = airplane;
    }

    public Airport getAirport() {
        return airport;
    }

    public void setAirport(Airport airport) {
        this.airport = airport;
    }



    public Airplane getAirplane() {
        return airplane;
    }

    public void setAirplane(Airplane airplane) {
        this.airplane = airplane;
    }
}
