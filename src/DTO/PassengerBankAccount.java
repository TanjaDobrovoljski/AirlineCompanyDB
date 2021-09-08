package DTO;

public class PassengerBankAccount {
    private long bankAccount;
    private double accountBalance;
    private String currency;
    private Passenger passengerID;
    private Bank bankID;

    public long getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(long bankAccount) {
        this.bankAccount = bankAccount;
    }

    public double getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance(double accountBalance) {
        this.accountBalance = accountBalance;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Passenger getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(Passenger passengerID) {
        this.passengerID = passengerID;
    }

    public Bank getBankID() {
        return bankID;
    }

    public void setBankID(Bank bankID) {
        this.bankID = bankID;
    }

    public PassengerBankAccount(long bankAccount, double accountBalance, String currency, Passenger passengerID, Bank bankID) {
        this.bankAccount = bankAccount;
        this.accountBalance = accountBalance;
        this.currency = currency;
        this.passengerID = passengerID;
        this.bankID = bankID;
    }

    public PassengerBankAccount() {

    }
}
