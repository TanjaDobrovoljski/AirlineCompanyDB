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

public class PassengerDao {
    private static String SQL_GET_PASSENGERS = "select * from passenger";


    public static ObservableList<Passenger> getPassengers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Passenger> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_PASSENGERS);
            rs = ps.executeQuery();

            while (rs.next()) {
                long id=rs.getLong(1);
                String name = rs.getString(2);
                String surname = rs.getString(3);
                Date date=rs.getDate(4);
                String address=rs.getString(5);
                String passport_number = rs.getString(6);
                int zip_code = rs.getInt(7);



                rezultati.add(new Passenger(id,name,surname,date,address,passport_number,StateDao.getState(zip_code)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PassengerDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PassengerDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PassengerDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static long getID(String name,String surname){
        ObservableList<Passenger> list=  getPassengers();
        long id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getName().equals(name) && list.get(i).getSurname().equals(surname))
                id=list.get(i).getPassengerID();
        }

        return  id;
    }


    public static Passenger getPassenger(long id){
        ObservableList<Passenger> list=  getPassengers();
        Passenger e=new Passenger();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getPassengerID()==id)
            {
                e.setPassengerID(id);
                e.setName(list.get(i).getName());
                e.setSurname(list.get(i).getSurname());
                e.setDateOfBirth(list.get(i).getDateOfBirth());
                e.setAddress(list.get(i).getAddress());
                e.setPassportNumber(list.get(i).getPassportNumber());
                e.setZipCode(list.get(i).getZipCode());


            }
        }

        return  e;
    }


}



