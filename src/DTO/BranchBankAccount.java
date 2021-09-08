package DTO;

public class BranchBankAccount {
    private long account_number;
    private double balance;
    private String currency;
    private Bank bank_id;

    public BranchBankAccount(long account_number, double balance, String currency, Bank bank_id) {
        this.account_number = account_number;
        this.balance = balance;
        this.currency = currency;
        this.bank_id = bank_id;
    }
    public BranchBankAccount() {

    }

    public long getAccount_number() {
        return account_number;
    }

    public void setAccount_number(long account_number) {
        this.account_number = account_number;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Bank getBank_id() {
        return bank_id;
    }

    public void setBank_id(Bank bank_id) {
        this.bank_id = bank_id;
    }
}
