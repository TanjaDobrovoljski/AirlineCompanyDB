package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AirplaneDao {
    private static String SQL_GET_AIRPLANES = "select AirplaneID, Airplane_number, Manufacturer, Model, Manufactured_date from airplane";


        public static ObservableList<Airplane> getAirplanes() {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Airplane> rezultati = new ArrayList<>();

            try {
                con = ConnectionPool.getInstance().checkOut();
                ps = con.prepareStatement(SQL_GET_AIRPLANES);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int id=rs.getInt(1);
                    String number = rs.getString(2);
                    String manuf = rs.getString(3);
                    String model=rs.getString(4);
                    Date date = rs.getDate(5);

                    rezultati.add(new Airplane(id,number,manuf,model,date));

                }
            } catch (SQLException ex) {
                Logger.getLogger(AirplaneDao.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                if (con != null) {
                    ConnectionPool.getInstance().checkIn(con);
                }
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AirplaneDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AirplaneDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }

            return FXCollections.observableArrayList(rezultati);
        }

    public static ObservableList<String> getAirplanesCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_AIRPLANES);
            rs = ps.executeQuery();

            while (rs.next()) {

                String model=rs.getString(4);


                rezultati.add(model);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AirplaneDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AirplaneDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AirplaneDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

        public static int getID(String model){
            ObservableList<Airplane> list= getAirplanes();
            int id=0;
            int i=0;
            for(;i<list.size();i++)
            {
                if(list.get(i).getModel().equals(model))
                    id=list.get(i).getId();
            }

            return  id;
        }

        public static Airplane getAirplane(int id){
            ObservableList<Airplane> list=  getAirplanes();
            Airplane e=new Airplane();
            int i=0;
            for(;i<list.size();i++)
            {
                if(list.get(i).getId()==id)
                {
                    e.setId(id);
                    e.setManufacturer(list.get(i).getManufacturer());
                    e.setModel(list.get(i).getModel());
                    e.setNumber(list.get(i).getNumber());
                    e.setManufactured_date(list.get(i).getManufactured_date());


                }
            }

            return  e;
        }


    }



