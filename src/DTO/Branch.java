package DTO;



public class Branch {
    private int id;
    private String name;
    private String address;
    private State zip_code;
    private Airport airport_id;
    private BranchBankAccount account_number;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Branch() {

    }

    public Branch(int id, String name, String address, State zip_code, Airport airport_id, BranchBankAccount account_number) {
        this.name = name;
        this.address = address;
        this.zip_code = zip_code;
        this.airport_id = airport_id;
        this.account_number = account_number;
        this.id=id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public State getZip_code() {
        return zip_code;
    }

    public void setZip_code(State zip_code) {
        this.zip_code = zip_code;
    }

    public Airport getAirport_id() {
        return airport_id;
    }

    public void setAirport_id(Airport airport_id) {
        this.airport_id = airport_id;
    }

    public BranchBankAccount getAccount_number() {
        return account_number;
    }

    public void setAccount_number(BranchBankAccount account_number) {
        this.account_number = account_number;
    }
}
