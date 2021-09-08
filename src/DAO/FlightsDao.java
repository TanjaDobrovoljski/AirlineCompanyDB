package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;


public class FlightsDao {
    private static String SQL_GET_FLIGHTS = "select * from flight";




    public static ObservableList<Flight> getFlights() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Flight> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_FLIGHTS);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                int duration = rs.getInt(2);
                Date date = rs.getDate(3);
                Timestamp departure_moment=rs.getTimestamp(4);
                Timestamp arrival_moment=rs.getTimestamp(5);
                String dep_gate = rs.getString(6);
                String arr_gate = rs.getString(7);
                int airplane = rs.getInt(8);
                int airport1 = rs.getInt(9);
                int airport2 = rs.getInt(10);
                int status = rs.getInt(11);


                rezultati.add(new Flight(id,duration,date,departure_moment.toLocalDateTime(),arrival_moment.toLocalDateTime(),dep_gate,arr_gate,AirplaneDao.getAirplane(airplane),AirportDAO.getAirport(airport1),AirportDAO.getAirport(airport2),status));

            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }


    public static ObservableList<String> getFlightsCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_FLIGHTS);
            rs = ps.executeQuery();

            while (rs.next()) {

                int airport1 = rs.getInt(9);
                int airport2 = rs.getInt(10);



                rezultati.add(AirportDAO.getAirport(airport1).getName()+"-"+AirportDAO.getAirport(airport2).getName());
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static ObservableList<LocalDateTime> getFlightsDepartureCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<LocalDateTime> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_FLIGHTS);
            rs = ps.executeQuery();

            while (rs.next()) {

                Timestamp departure_moment=rs.getTimestamp(4);



                rezultati.add(departure_moment.toLocalDateTime());
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static ObservableList<Integer> getFlightsIDCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Integer> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_FLIGHTS);
            rs = ps.executeQuery();

            while (rs.next()) {

                int departure_moment=rs.getInt(1);



                rezultati.add(departure_moment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static Flight getFlight(int id){
        ObservableList<Flight> list=  getFlights();
        Flight e=new Flight();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getId()==id)
            {
                e.setId(id);
                e.setDuration(list.get(i).getDuration());
                e.setDate(list.get(i).getDate());
                e.setDeparture_moment(list.get(i).getDeparture_moment());
                e.setArrival_moment(list.get(i).getArrival_moment());
                e.setDeparture_gate(list.get(i).getDeparture_gate());
                e.setArrival_gate(list.get(i).getArrival_gate());
                e.setAirplaneID(list.get(i).getAirplaneID());
                e.setDepartureID(list.get(i).getDepartureID());
                e.setArrivalID(list.get(i).getArrivalID());
                e.setStatus(list.get(i).getStatus());

            }
        }

        return  e;
    }

    public static Flight getFlight(int a1,int a2){
        ObservableList<Flight> list=  getFlights();
        Flight e=new Flight();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getDepartureID().getId()==a1 && list.get(i).getArrivalID().getId()==a2)
            {
                return list.get(i);
            }
        }

        return  null;
    }

    public static int getLastID()
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int temp=0;
        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement("select * from flight order by FlightID desc limit 1");

            rs = ps.executeQuery();

            while (rs.next()) {
                int idLeta = rs.getInt(1);

                temp=idLeta;
                  }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return temp;
    }

    public static boolean insertFLight(int duration, LocalDate date, Timestamp departure_moment, Airplane airplaneID, Airport departureID, Airport arrivalID, int status)
    {
       /* DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

        Random rand = new Random();

         Generate random integers in range 0 to 99


        String datos="";
        String atos="";
        for (int i=0;i<20;i++) {
            int rand_int1 = rand.nextInt(100);
            char C = (char)(rand.nextInt(26) + 'A');
            String seat = String.valueOf(rand_int1) + String.valueOf(C);
            datos=seat;
            if(i==5)
                atos=String.valueOf(C) + String.valueOf(rand_int1);
        }

        Connection con = null;
        CallableStatement myStatement = null;
        try {
            con = ConnectionPool.getInstance().checkOut();
            myStatement = con.prepareCall("{call insert_flight(?,?,?,?,?,?,?,?,?,?,?)}");


            LocalDate datek = LocalDate.of();
            LocalDateTime datetime = datek.atTime(1,50,9);


            String myTime = departure_moment.toString();
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
            Date d = df.parse(myTime);
            Calendar cal = Calendar.getInstance();
            cal.setTime(d);
            cal.add(Calendar.MINUTE, duration);
            String newTime = df.format(cal.getTime());

            System.out.println(departure_moment);


            myStatement.setInt(1, getLastID()+1);
            myStatement.setInt(2, duration);
            myStatement.setDate(3, java.sql.Date.valueOf(date));
           myStatement.setDate(4, date+departure_moment);
            myStatement.setDate(5, java.sql.Date.valueOf(date+newTime));
            myStatement.setString(6, datos);
            myStatement.setString(7, atos);
            myStatement.setInt(8,airplaneID.getId());
            myStatement.setInt(9,departureID.getId());
            myStatement.setInt(10,arrivalID.getId());
            myStatement.setInt(11,status);


            System.out.println(date+" "+depart+" "+date+newTime);

            myStatement.execute();
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (myStatement != null) {
                try {
                    myStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return true;
    }

*/return  true;
}}
