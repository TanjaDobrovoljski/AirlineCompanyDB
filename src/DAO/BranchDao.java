package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BranchDao {
    private static String SQL_GET_BRANCH = "SELECT * FROM airline_company.branch";



    public static ObservableList<Branch> getBranches() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Branch> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_BRANCH);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                String name = rs.getString(2);
                String address = rs.getString(3);
                int zip_code=rs.getInt(4);
                int airportID = rs.getInt(5);
                long Bank_number = rs.getLong(6);



                rezultati.add(new Branch(id,name,address,StateDao.getState(zip_code),AirportDAO.getAirport(airportID),BranchBankAccountDao.getBranchBankAccount(Bank_number)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BranchDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BranchDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BranchDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static ObservableList<String> getBranchesCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_BRANCH);
            rs = ps.executeQuery();

            while (rs.next()) {

                String name = rs.getString(2);




                rezultati.add(name);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BranchDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BranchDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BranchDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static int getID(String name){
        ObservableList<Branch> list= getBranches();
        int id=0;
        int i=0;
        for(;i<list.size();i++)
        {

            if(list.get(i).getName().equals(name))
            {

                id=list.get(i).getId();
                return  id;}
        }

        return  0;
    }

    public static Branch getBranch(int id){
        ObservableList<Branch> list=  getBranches();
        Branch e=new Branch();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getId()==id)
            {
                e.setId(id);
                e.setName(list.get(i).getName());
                e.setAddress(list.get(i).getAddress());
                e.setZip_code(list.get(i).getZip_code());
                e.setAirport_id(list.get(i).getAirport_id());
                e.setAccount_number(list.get(i).getAccount_number());

            }
        }

        return  e;
    }


}
