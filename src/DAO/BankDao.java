package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BankDao {
    private static String SQL_GET_BANK = "SELECT * FROM airline_company.bank";

    public static ObservableList<Bank> getBank() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Bank> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_BANK);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                String name = rs.getString(2);
                String address = rs.getString(3);


                rezultati.add(new Bank(id,name,address));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BankDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BankDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BankDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static int getID(String name){
        ObservableList<Bank> list= getBank();
        int id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getName()==name)
                id=list.get(i).getId();
        }

        return  id;
    }

    public static Bank getBank(int id){
        ObservableList<Bank> list=  getBank();
        Bank e=new Bank();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getId()==id)
            {
                e.setId(id);
                e.setName(list.get(i).getName());
                e.setAddress(list.get(i).getAddress());

            }
        }

        return  e;
    }

}
