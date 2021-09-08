package DAO;
import DTO.*;
import connectionPool.ConnectionPool;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class EmployeeDao {
    private static String SQL_GET_PILOTS = "select * from employee where Duty=1";
    private static String SQL_GET_STEWARTS = "select * from employee where Duty=2";
    private static String SQL_GET_EMPLOYEES="select * from employee";



    public static ObservableList<Employee> getPilots() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Employee> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_PILOTS);
            rs = ps.executeQuery();

            while (rs.next()) {
                long id=rs.getLong(1);
                String ime = rs.getString(2);
                String prezime = rs.getString(3);
                String adresa = rs.getString(4);
                Date datumRodjenja = rs.getDate(5);
                String mjestoRodjenja = rs.getString(6);
                String email = rs.getString(7);
                String tel = rs.getString(8);
                long br_racuna= rs.getLong(10);
                double plata= rs.getDouble(11);
                int idPoslovnice = rs.getInt(12);


                rezultati.add(new Employee(id,ime,prezime,adresa,datumRodjenja,mjestoRodjenja,email,tel,1,br_racuna,plata,idPoslovnice));

            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static ObservableList<Employee> getEmployees() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Employee> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_EMPLOYEES);
            rs = ps.executeQuery();

            while (rs.next()) {
                long id=rs.getLong(1);
                String ime = rs.getString(2);
                String prezime = rs.getString(3);
                String adresa = rs.getString(4);
                Date datumRodjenja = rs.getDate(5);
                String mjestoRodjenja = rs.getString(6);
                String email = rs.getString(7);
                String tel = rs.getString(8);
                int duty=rs.getInt(9);
                Long br_racuna= rs.getLong(10);
                double plata= rs.getDouble(11);
                int idPoslovnice = rs.getInt(12);


                rezultati.add(new Employee(id,ime,prezime,adresa,datumRodjenja,mjestoRodjenja,email,tel,duty,br_racuna,plata,idPoslovnice));

            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }




    public static ObservableList<String> getStewartsCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_STEWARTS);
            rs = ps.executeQuery();

            while (rs.next()) {

                String ime = rs.getString(2);
                String prezime = rs.getString(3);



                rezultati.add(ime+" "+prezime);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static ObservableList<String> getPilotsCB() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> rezultati = new ArrayList<>();

        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement(SQL_GET_PILOTS);
            rs = ps.executeQuery();

            while (rs.next()) {

                String ime = rs.getString(2);
                String prezime = rs.getString(3);



                rezultati.add(ime+" "+prezime);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return FXCollections.observableArrayList(rezultati);
    }

    public static long getID(String name,String surname){
        ObservableList<Employee> list=  getPilots();
        long id=0;
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getName().equals(name) && list.get(i).getSurname().equals(surname))
                id=list.get(i).getId();
        }

        return  id;
    }

    public static Employee getEmployee(long id){
        ObservableList<Employee> list=  getPilots();
        Employee e=new Employee();
        int i=0;
        for(;i<list.size();i++)
        {
            if(list.get(i).getId()==id)
            {
                e.setId(id);
                e.setName(list.get(i).getName());
                e.setSurname(list.get(i).getSurname());
                e.setAddress(list.get(i).getAddress());
                e.setTelephone(list.get(i).getTelephone());
                e.setSalary(list.get(i).getSalary());
                e.setBirth_place(list.get(i).getBirth_place());
                e.setBirth_date(list.get(i).getBirth_date());
                e.setBranchID(list.get(i).getBranchID());
                e.setEmail(list.get(i).getEmail());
                e.setDuty(list.get(i).getDuty());
                e.setAccount_number((list.get(i).getAccount_number()));
            }
        }

        return  e;
    }

    public static boolean insertEmployee(long eid,String name, String surname, String address, Date birth, String birthplace, String email, String tel, byte duty, long bank,double salary,Branch id) {
        Connection con = null;
        CallableStatement myStatement = null;
        String upit="";
        try {
            con = ConnectionPool.getInstance().checkOut();
            upit="{call insert_employee(?,?,?,?,?,?,?,?,?,?,?,?)}";


            myStatement=con.prepareCall(upit);


            myStatement.setLong(1, eid);
            myStatement.setString(2, name);
            myStatement.setString(3,surname);
            myStatement.setString(4,address);

            myStatement.setDate(5, birth);
            myStatement.setString(6, birthplace);
            myStatement.setString(7, email);
            myStatement.setString(8,tel);
            myStatement.setByte(9,duty);
            myStatement.setLong(10,bank);
            myStatement.setDouble(11,salary);
            myStatement.setInt(12,id.getId());



            myStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (myStatement != null) {
                try {
                    myStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return true;
    }

    public static long getLastID()
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long temp=0;
        try {
            con = ConnectionPool.getInstance().checkOut();
            ps = con.prepareStatement("select * from employee order by EmpID desc limit 1");

            rs = ps.executeQuery();

            while (rs.next()) {
                long idLeta = rs.getLong(1);

                temp=idLeta;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            if (con != null) {
                ConnectionPool.getInstance().checkIn(con);
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return temp;
    }



}
