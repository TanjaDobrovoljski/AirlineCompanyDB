package DTO;

import java.util.Date;

public class Employee {
    private long id;
    private String name;
    private String surname;
    private String address;
    private Date birth_date;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    public String getBirth_place() {
        return birth_place;
    }

    public void setBirth_place(String birth_place) {
        this.birth_place = birth_place;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getDuty() {
        return duty;
    }

    public void setDuty(int duty) {
        this.duty = duty;
    }



    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public int getBranchID() {
        return branchID;
    }

    public void setBranchID(int branchID) {
        this.branchID = branchID;
    }

    private String birth_place;
    private String email;
    private String telephone;
    private int duty;
    private long account_number;
    private double salary;
    private int branchID;

    public long getAccount_number() {
        return account_number;
    }

    public void setAccount_number(long account_number) {
        this.account_number = account_number;
    }

    public Employee()
    {}
    public Employee( String name, String surname, String address, Date birth_date, String birth_place, String email, String telephone, int duty, long account_number, double salary, int branchID) {

        this.name = name;
        this.surname = surname;
        this.address = address;
        this.birth_date = birth_date;
        this.birth_place = birth_place;
        this.email = email;
        this.telephone = telephone;
        this.duty = duty;
        this.account_number = account_number;
        this.salary = salary;
        this.branchID = branchID;
    }

    public Employee(long id, String name, String surname, String address, Date birth_date, String birth_place, String email, String telephone, int duty, long account_number, double salary, int branchID) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.birth_date = birth_date;
        this.birth_place = birth_place;
        this.email = email;
        this.telephone = telephone;
        this.duty = duty;
        this.account_number = account_number;
        this.salary = salary;
        this.branchID = branchID;
    }
}
