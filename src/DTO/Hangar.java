package DTO;

public class Hangar {
    private String code;
    private Airplane airplaneID;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Airplane getAirplaneID() {
        return airplaneID;
    }

    public void setAirplaneID(Airplane airplaneID) {
        this.airplaneID = airplaneID;
    }

    public Hangar(String code, Airplane airplaneID) {
        this.code = code;
        this.airplaneID = airplaneID;
    }
}
