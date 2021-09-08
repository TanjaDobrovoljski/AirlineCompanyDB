package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StateDao {
    private static String SQL_GET_STATE = "SELECT * FROM airline_company.state";

    public static ObservableList<State> getState() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<State> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_STATE);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                String city = rs.getString(2);
                String country = rs.getString(3);


                rezultati.add(new State(id,city,country));

            }
        } catch (SQLException ex) {
            Logger.getLogger(StateDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StateDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StateDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static int getID(String city){
        ArrayList<State> list= (ArrayList<State>) getState();
        int id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getCity().equals(city))
                id=list.get(i).getZip_code();
        }

        return  id;
    }

    public static State getState(int id){
        ObservableList<State> list=  getState();
        State e=new State();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getZip_code()==id)
            {
                e.setZip_code(id);
                e.setCity(list.get(i).getCity());
                e.setCountry(list.get(i).getCountry());

            }
        }

        return  e;
    }

}
