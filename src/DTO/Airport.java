package DTO;

public class Airport {
    private String name;
    private State zip_code;
    private int id;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public State getZip_code() {
        return zip_code;
    }

    public void setZip_code(State zip_code) {
        this.zip_code = zip_code;
    }

    public Airport() {

    }

    public Airport(int id,String name, State zip_code) {
        this.id=id;
        this.name = name;
        this.zip_code = zip_code;
    }
}
