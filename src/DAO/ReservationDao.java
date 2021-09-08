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

public class ReservationDao {
    private static String SQL_GET_RESERVATION = "select * from reservation";


    public static ObservableList<Reservation> getReservation() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Reservation> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_RESERVATION);
            rs = ps.executeQuery();

            while (rs.next()) {

                int id = rs.getInt(1);
                Timestamp date=rs.getTimestamp(2);
                boolean type = rs.getBoolean(3);
                long passenger=rs.getLong(4);
                int flight=rs.getInt(5);
                int ticket=rs.getInt(6);

                rezultati.add(new Reservation(id,date.toLocalDateTime(),type,PassengerDao.getPassenger(passenger),FlightsDao.getFlight(flight),TicketDao.getTicket(ticket)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }


}



