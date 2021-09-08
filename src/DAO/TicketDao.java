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

public class TicketDao {
    private static String SQL_GET_TICKETS = "select * from ticket";


    public static ObservableList<Ticket> getTicket() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Ticket> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_TICKETS);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                double price = rs.getDouble(2);
                char clasa = rs.getString(3).charAt(0);
                String seat=rs.getString(4);
                int flightID=rs.getInt(5);




                rezultati.add(new Ticket(id,price,clasa,seat,FlightsDao.getFlight(flightID)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(TicketDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(TicketDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static Ticket getTicket(int id){
        ObservableList<Ticket> list=  getTicket();
        Ticket e=new Ticket();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getId()==id)
            {
                e.setId(id);

                e.setSeat(list.get(i).getSeat());
                e.setSeatClass(list.get(i).getSeatClass());
                e.setPrice(list.get(i).getPrice());
                e.setFlightID(list.get(i).getFlightID());


            }
        }

        return  e;
    }

}



