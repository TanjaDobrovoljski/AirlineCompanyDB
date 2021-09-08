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

public class TicketPurchaseDao {
    private static String SQL_GET_TICKETS_PURCHASE = "select * from ticket_purchase";


    public static ObservableList<TicketPurchase> getTicketPurchase() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<TicketPurchase> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_TICKETS_PURCHASE);
            rs = ps.executeQuery();

            while (rs.next()) {
                Timestamp id=rs.getTimestamp(1);
                int passenger = rs.getInt(2);
                int flight = rs.getInt(3);
                long bank=rs.getLong(4);
                int ticket=rs.getInt(5);

                rezultati.add(new TicketPurchase(id.toLocalDateTime(),PassengerDao.getPassenger(passenger),FlightsDao.getFlight(flight),BranchBankAccountDao.getBranchBankAccount(bank),TicketDao.getTicket(ticket)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketPurchaseDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(TicketPurchaseDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(TicketPurchaseDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }


}



