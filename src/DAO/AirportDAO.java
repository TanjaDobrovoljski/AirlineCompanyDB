package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AirportDAO {

    private static String SQL_GET_AIRPORT = "SELECT airport.Name, state.City,state.Country\n" +
            "FROM airport\n" +
            "INNER JOIN state ON airport.State_Zip_code = state.Zip_code;";

    private static  String SQL_GET_AIRPORTS_ALONE="SELECT * FROM airport";

    public static ObservableList<String> getAirports() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_AIRPORT);
            rs = ps.executeQuery();

            while (rs.next()) {

                String airportName = rs.getString(1);



                rezultati.add(airportName);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AirportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AirportDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AirportDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static ObservableList<Airport> getAirportsList() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Airport> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_AIRPORTS_ALONE);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                String airportName = rs.getString(2);
                int airportZip_code = rs.getInt(3);



                rezultati.add(new Airport(id,airportName,StateDao.getState(airportZip_code)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AirportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AirportDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AirportDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static int getID(String name){
        ObservableList<Airport> list= getAirportsList();
        int id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getName().equals(name))
                id=list.get(i).getId();
        }

        return  id;
    }

    public static Airport getAirport(int id){
        ObservableList<Airport> list=  getAirportsList();
        Airport e=new Airport();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getId()== id)
            {
                e.setName(list.get(i).getName());
                e.setId(list.get(i).getId());
                e.setZip_code(list.get(i).getZip_code());

            }
        }

        return  e;
    }
}