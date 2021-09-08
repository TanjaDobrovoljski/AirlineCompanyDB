package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BranchBankAccountDao {
    private static String SQL_GET_BANK_ACCOUNT = "SELECT * FROM airline_company.branch_bank_account";

    public static ObservableList<BranchBankAccount> getBranchBankAccount() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<BranchBankAccount> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_BANK_ACCOUNT);
            rs = ps.executeQuery();

            while (rs.next()) {
                long id=rs.getLong(1);
                double account_balance = rs.getDouble(2);
                String currency = rs.getString(3);
                int bank_id = rs.getInt(4);



                rezultati.add(new BranchBankAccount(id,account_balance,currency,BankDao.getBank(bank_id)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BranchBankAccountDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BranchBankAccountDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BranchBankAccountDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }



    public static BranchBankAccount getBranchBankAccount(long id){
        ObservableList<BranchBankAccount> list=  getBranchBankAccount();
        BranchBankAccount e=new BranchBankAccount();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getAccount_number()==id)
            {
                e.setAccount_number(id);
                e.setBalance(list.get(i).getBalance());
                e.setCurrency(list.get(i).getCurrency());
                e.setBank_id(list.get(i).getBank_id());

            }
        }

        return  e;
    }

}
