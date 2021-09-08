package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PassengerBankAccountDao {
    private static String SQL_GET_PBA = "select * from passenger_bank_account";


    public static ObservableList<PassengerBankAccount> getPassengerBankAccounts() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<PassengerBankAccount> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_PBA);
            rs = ps.executeQuery();

            while (rs.next()) {
                long id=rs.getLong(1);
                double acc_balance = rs.getDouble(2);
                String currency = rs.getString(3);
                long passenger=rs.getInt(4);
                int address=rs.getInt(5);

                rezultati.add(new PassengerBankAccount(id,acc_balance,currency,PassengerDao.getPassenger(passenger),BankDao.getBank(address)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PassengerBankAccountDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PassengerBankAccountDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PassengerBankAccountDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static long getPassengeriD(long account_number){
        ObservableList<PassengerBankAccount> list=  getPassengerBankAccounts();
        long id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getBankAccount()==account_number)
                id=list.get(i).getPassengerID().getPassengerID();
        }

        return  id;
    }


    public static long getBankAccountID(long passenger_id){
        ObservableList<PassengerBankAccount> list=  getPassengerBankAccounts();
        long id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getBankAccount()==passenger_id)
                id=list.get(i).getBankAccount();
        }

        return  id;
    }


}



