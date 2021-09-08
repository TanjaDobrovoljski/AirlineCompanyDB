package DTO;

public class State {
    private int zip_code;
    private String city;
    private String country;

    public int getZip_code() {
        return zip_code;
    }

    public void setZip_code(int zip_code) {
        this.zip_code = zip_code;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public State() {

    }

    public State(int zip_code, String city, String country) {
        this.zip_code = zip_code;
        this.city = city;
        this.country = country;
    }
}
