package sample;

import DTO.Employee;
import DTO.Flight;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import DAO.*;
import javafx.scene.control.Button;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.ContextMenuEvent;
import javafx.scene.layout.Region;
import javafx.stage.WindowEvent;
import javafx.util.Callback;

import javax.swing.*;
import java.awt.*;
import java.net.URL;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Random;
import java.util.ResourceBundle;

public class airlineController implements Initializable {

    private static ObservableList<Flight> flightList;
    private static ObservableList<Employee> employeeList;
    @FXML
    private Tab flights;

    @FXML
    private TextField durationNew;

    @FXML
    private ComboBox<String> timeFlight;

    @FXML
    private ComboBox<String> departureAirport;

    @FXML
    private ComboBox<String> arrivalAirport;

    @FXML
    private DatePicker departureDate;

    @FXML
    private ComboBox<String> pilot;

    @FXML
    private ComboBox<String> stewart;

    @FXML
    private ComboBox<String> aircraft;

    @FXML
    private Button addFlightButton;

    @FXML
    private DatePicker departureDateModify;

    @FXML
    private TextField durationModify;

    @FXML
    private Button modifyFlightButton;

    @FXML
    private ComboBox<Integer> flightID;

    @FXML
    private TableView<?> flightTable;

    @FXML
    private TextField timeModify;

    @FXML
    private Tab employees;

    @FXML
    private TextField employeeIDModify;

    @FXML
    private TextField nameModify;

    @FXML
    private TextField telephoneModify;

    @FXML
    private TextField addressModify;

    @FXML
    private TextField emailModify;

    @FXML
    private TextField bankAccountModify;

    @FXML
    private ComboBox<String> branchModify;

    @FXML
    private Button modifyEmployeeButton1;

    @FXML
    private TextField birthPlaceModify;

    @FXML
    private ComboBox<String> dutyModify;

    @FXML
    private TextField salaryModify;

    @FXML
    private DatePicker birthDateModify;

    @FXML
    private TextField surnameModify;

    @FXML
    private TextField birthPlaceNew;

    @FXML
    private TextField emailNew;

    @FXML
    private TextField telephoneNew;

    @FXML
    private TextField addressNew;

    @FXML
    private TextField surnameNew;

    @FXML
    private TextField nameNew;

    @FXML
    private TextField employeeIDNew;

    @FXML
    private TextField bankAccountNew;

    @FXML
    private TableColumn id;

    @FXML
    private TableColumn name;

    @FXML
    private TableColumn surname;

    @FXML
    private TableColumn address;

    @FXML
    private TableColumn date;

    @FXML
    private TableColumn place;

    @FXML
    private TableColumn email;

    @FXML
    private TableColumn tel;

    @FXML
    private TableColumn duty;

    @FXML
    private TableColumn bank;

    @FXML
    private TableColumn salary;

    @FXML
    private TableColumn branch;

    @FXML
    private Region region;

    @FXML
    private TextField salaryNew;

    @FXML
    private ComboBox<String> dutyNew;

    @FXML
    private DatePicker birthDateNew;

    @FXML
    private ContextMenu deleteMenu;

    @FXML
    private Button addEmployeeButton;

    @FXML
    private ComboBox<String> branchNew;

    @FXML
    private TableView<Employee> employeesList;

    @FXML
    private Tab tickets;

    @FXML
    private TextField passIDNew;

    @FXML
    private TextField passengerSurnameNew;

    @FXML
    private TextField passengerNameNew;

    @FXML
    private TextField passPassportNumberNew;

    @FXML
    private TextField passBankAccountNew;

    @FXML
    private TextField passAddressNew;

    @FXML
    private DatePicker passDateOfBirthNew;

    @FXML
    private ComboBox<String> classNew;

    private Alert alert;

    @FXML
    private ComboBox<LocalDateTime> dateTimeDeparture;

    @FXML
    private Button buyTicketButoon;

    @FXML
    private ComboBox<String> branchTicketNew;

    @FXML
    private TextField passCountry;

    @FXML
    private ComboBox<String> seatNew;

    @FXML
    private ComboBox<String> flightTicketNew;

    @FXML
    private TextField passIDReservation;

    @FXML
    private TextField surnameReservation;

    @FXML
    private TextField nameReservation;

    @FXML
    private TextField passportNumberReservation;

    @FXML
    private TextField addressReservation;

    @FXML
    private DatePicker dateOfBirthReservation;

    @FXML
    private ComboBox<String> classReservation;

    @FXML
    private ComboBox<LocalDateTime> dateTimeReservation;

    @FXML
    private Button reservationButton;

    @FXML
    private TextField countryReservation;

    @FXML
    private ComboBox<String> seatReservation;

    @FXML
    private ComboBox<String> flightTicketReservation;

    @FXML
    private TableView<?> ticketsList;

    private Date arrival_moment;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        flightList=FlightsDao.getFlights();
        departureAirport.setItems(AirportDAO.getAirports());
        arrivalAirport.setItems(AirportDAO.getAirports());
        //timeFlight.setItems(FXCollections.observableArrayList("12:00:00","15:00:00","17:30:00"));
        employeeList=EmployeeDao.getEmployees();

        alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("DataBase informations");

        LocalDate date = LocalDate.now();
        LocalDate yesterday = date.minusDays(1);
        LocalDate tomorrow = yesterday.plusDays(2);

        DatePicker myDatePicker = new DatePicker(); // This DatePicker is shown to user
        DatePicker maxDate = new DatePicker(); // DatePicker, used to define max date available, you can also create another for minimum date
        maxDate.setValue(tomorrow); // Max date available will be 2015-01-01
        final Callback<DatePicker, DateCell> dayCellFactory;

        dayCellFactory = (final DatePicker datePicker) -> new DateCell() {
            @Override
            public void updateItem(LocalDate item, boolean empty) {
                super.updateItem(item, empty);
                if (item.isBefore(maxDate.getValue())) { //Disable all dates after required date
                    setDisable(true);
                    setStyle("-fx-background-color: #ffc0cb;"); //To set background on different color
                }
            }
        };

        DatePicker maxDate3 = new DatePicker(); // DatePicker, used to define max date available, you can also create another for minimum date
        maxDate3.setValue(date); // Max date available will be 2015-01-01
        final Callback<DatePicker, DateCell> dayCellFactory3;

        dayCellFactory3 = (final DatePicker datePicker) -> new DateCell() {
            @Override
            public void updateItem(LocalDate item, boolean empty) {
                super.updateItem(item, empty);
                if (item.isAfter(maxDate3.getValue())) { //Disable all dates after required date
                    setDisable(true);
                    setStyle("-fx-background-color: #ffc0cb;"); //To set background on different color
                }
            }
        };

        departureDate.setDayCellFactory(dayCellFactory);
        departureDateModify.setDayCellFactory(dayCellFactory);

        passDateOfBirthNew.setDayCellFactory(dayCellFactory3);
        dateOfBirthReservation.setDayCellFactory(dayCellFactory3);
        LocalDate date2 = LocalDate.now();




        DatePicker myDatePicker2 = new DatePicker(); // This DatePicker is shown to user
        DatePicker maxDate2 = new DatePicker(); // DatePicker, used to define max date available, you can also create another for minimum date
        maxDate2.setValue(LocalDate.of(1992, Month.JANUARY, 1)); // Max date available will be 2015-01-01
        final Callback<DatePicker, DateCell> dayCellFactory2;

        dayCellFactory2 = (final DatePicker datePicker) -> new DateCell() {
            @Override
            public void updateItem(LocalDate item, boolean empty) {
                super.updateItem(item, empty);
                if (item.isAfter(maxDate2.getValue())) { //Disable all dates after required date
                    setDisable(true);
                    setStyle("-fx-background-color: #ffc0cb;"); //To set background on different color
                }
            }
        };




        Random rand = new Random();

        // Generate random integers in range 0 to 99


        ObservableList<String> datos = FXCollections.observableArrayList();
        for (int i=0;i<20;i++) {
            int rand_int1 = rand.nextInt(100);
            char C = (char)(rand.nextInt(26) + 'A');
            String seat = String.valueOf(rand_int1) + String.valueOf(C);
            datos.add(new String(seat));
        }

        birthDateNew.setDayCellFactory(dayCellFactory2);
        birthDateModify.setDayCellFactory(dayCellFactory2);

        seatNew.setItems(datos);

        aircraft.setItems(AirplaneDao.getAirplanesCB());
        pilot.setItems(EmployeeDao.getPilotsCB());
        stewart.setItems(EmployeeDao.getStewartsCB());
        branchTicketNew.setItems(BranchDao.getBranchesCB());
        branchNew.setItems(BranchDao.getBranchesCB());
        branchModify.setItems(BranchDao.getBranchesCB());

        flightTicketNew.setItems(FlightsDao.getFlightsCB());
        flightTicketReservation.setItems(FlightsDao.getFlightsCB());
        flightID.setItems(FlightsDao.getFlightsIDCB());
        dutyNew.setItems(FXCollections.observableArrayList("pilot","stewart","seller"));
        classNew.setItems(FXCollections.observableArrayList("A","B","C","D","E"));
        seatReservation.setItems(datos);
        classReservation.setItems(FXCollections.observableArrayList("A","B","C","D","E"));

        employeeTable();


       MenuItem item=new MenuItem("Delete");
       deleteMenu.getItems().add(item);

       item.setOnAction(new EventHandler<ActionEvent>() {
           @Override
           public void handle(ActionEvent actionEvent) {


           }
       });

       EventHandler<WindowEvent> event=new EventHandler<WindowEvent>() {
           @Override
           public void handle(WindowEvent windowEvent) {
               if(deleteMenu.isShowing()) {

                   Employee e=employeesList.getSelectionModel().getSelectedItem();

                   nameModify.setText((String.valueOf(e.getName())));
                   surnameModify.setText(String.valueOf(e.getSurname()));
                   birthDateModify.setValue(LocalDate.parse(e.getBirth_date().toString()));
                   addressModify.setText(String.valueOf(e.getAddress()));
                   telephoneModify.setText(String.valueOf(e.getTelephone()));
                   bankAccountModify.setText(String.valueOf(e.getAccount_number()));
                   emailModify.setText(String.valueOf(e.getEmail()));
                   birthPlaceModify.setText(String.valueOf(e.getBirth_place()));
                   salaryModify.setText(String.valueOf(e.getSalary()));
                   branchModify.setValue(BranchDao.getBranch(e.getBranchID()).getName());

               }

           }
       };


       deleteMenu.setOnShowing(event);


       employeesList.setContextMenu(deleteMenu);

       /* Date dateOfFlight;
        String departure_date; //mozda ovo i ne treba?!
        if (departureDate.getValue()!=null) {
            departure_date = departureDate.getValue().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            SimpleDateFormat formatter2=new SimpleDateFormat("yyyy-MM-dd");
            try {
                dateOfFlight= (Date) formatter2.parse(departure_date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:MM:ss");
        timeFlight = date.format(formatter);
        LocalDate parsedDate = LocalDate.parse(timeFlight, formatter);
*/



    }


    boolean flightExist(String start, String end){

        return flightList.stream().anyMatch((i) -> (i.getDepartureID().getName().equals(start) && i.getArrivalID().getName().equals(end)));
    }

    public static boolean flightExist(int id){
        return flightList.stream().anyMatch((i) -> (i.getId()== id));
    }



    public static boolean employeeExist(int id){
        return employeeList.stream().anyMatch((i) -> (i.getId()== id));
    }

    @FXML
    void addEmployee(ActionEvent event) {

        if (employeeIDNew.getText()==""
                | nameNew.getText()==""
                | surnameNew.getText()==""
                | birthDateNew.getValue()==null
                | addressNew.getText()==""
                | telephoneNew.getText()==""
                | bankAccountNew.getText() ==""
                | emailNew.getText()==""
                | birthPlaceNew.getText()==""
                | salaryNew.getText()==""
                | dutyNew.getValue()== null
                | branchNew.getValue()== null)
        {

            alert.setHeaderText("Inserting employee in DB");
            alert.setContentText("Please, make sure all fileds are filled correctly!");
            alert.show(); }

        else if(employeeExist(Integer.parseInt(employeeIDNew.getText().toString())))
        {
            alert.setHeaderText("Inserting employee in DB");
            alert.setContentText("Employee already exist!");
            alert.show();
        }
        else
        {


            byte duty=0;
            if (dutyNew.getValue().equals("pilot"))
                duty=1;
            else if(dutyNew.getValue().equals("stewart"))
                duty=2;
                else if (dutyNew.getValue().equals("seeler"))
                    duty=3;



            if (EmployeeDao.insertEmployee(Long.valueOf(employeeIDNew.getText()),nameNew.getText(),surnameNew.getText(),addressNew.getText(),Date.valueOf(birthDateNew.getValue()),birthPlaceNew.getText(),emailNew.getText(),telephoneNew.getText(),duty,Long.valueOf(bankAccountNew.getText()),Double.valueOf(salaryNew.getText()),BranchDao.getBranch(BranchDao.getID(branchNew.getValue()))))
            {
            alert.setHeaderText("Inserting employee in DB");
            alert.setContentText("Employee have been inserted!");
            alert.show();
                employeeIDNew.setText("");
                nameNew.setText("");
                surnameNew.setText("");
                birthDateNew.setValue(null);
                addressNew.setText("");
                telephoneNew.setText("");
                bankAccountNew.setText("");
                emailNew.setText("");
                birthPlaceNew.setText("");
                salaryNew.setText("");
                dutyNew.setValue(null);
                branchNew.setValue(null);
                employeesList.refresh();
            employeeTable();
        }

    }
    }

    private void employeeTable()
    {
        employeesList.refresh();
        employeesList.getColumns().clear();
        employeesList.refresh();

        id.setCellValueFactory(
                new PropertyValueFactory<>("id"));
        name.setStyle("-fx-alignment: CENTER;");


        name.setCellValueFactory(
                new PropertyValueFactory<>("Name"));
        name.setStyle("-fx-alignment: CENTER-LEFT;");


        surname.setCellValueFactory(
                new PropertyValueFactory<>("Surname"));
        surname.setStyle("-fx-alignment: CENTER-LEFT;");


        address.setCellValueFactory(
                new PropertyValueFactory<>("Address"));
        address.setStyle("-fx-alignment: CENTER-LEFT;");


        date.setCellValueFactory(
                new PropertyValueFactory<>("Birth_date"));
        date.setStyle("-fx-alignment: CENTER;");


        place.setCellValueFactory(
                new PropertyValueFactory<>("Birth_place"));
        place.setStyle("-fx-alignment: CENTER-LEFT;");


        email.setCellValueFactory(
                new PropertyValueFactory<>("Email"));
        email.setStyle("-fx-alignment: CENTER;");


        tel.setCellValueFactory(
                new PropertyValueFactory<>("telephone"));
        tel.setStyle("-fx-alignment: CENTER-LEFT;");


        duty.setCellValueFactory(
                new PropertyValueFactory<>("Duty"));
        duty.setStyle("-fx-alignment: CENTER;");



        bank.setCellValueFactory(
                new PropertyValueFactory<>("account_number"));
        bank.setStyle("-fx-alignment: CENTER;");

        salary.setCellValueFactory(
                new PropertyValueFactory<>("Salary"));
        salary.setStyle("-fx-alignment: CENTER;");


        branch.setCellValueFactory(
                new PropertyValueFactory<>("BranchID"));
        branch.setStyle("-fx-alignment: CENTER;");




        employeesList.setItems(employeeList);
        employeesList.getColumns().addAll(id, name,surname,address,date,place,email,tel,duty,bank,salary,branch);



    }

    @FXML
    void addFlight(ActionEvent event) throws ParseException {
        /*if (departureAirport.getValue()==null
                || arrivalAirport.getValue()==null
                || departureAirport.getValue().equals(arrivalAirport.getValue())
                || departureDate.getValue()==null
                || timeFlight.getText().equals("") || timeFlight.getText().equals("hh:mm:ss")
                || durationNew.getText().equals("")
                || aircraft.getValue() == null
                || pilot.getValue()==null
                || stewart.getValue()== null)
        {

            alert.setHeaderText("Inserting flight in DB");
            alert.setContentText("Please, make sure all fileds are filled correctly!");
            alert.show(); }

        else if(flightExist(departureAirport.getValue(),arrivalAirport.getValue()))
        {
            alert.setHeaderText("Inserting flight in DB");
            alert.setContentText("Flight already exist!");
            alert.show();
        }
        else
        {





            if (FlightsDao.insertFLight(Integer.parseInt(durationNew.getText()) ,departureDate.getValue(), Timestamp.valueOf(timeFlight.getValue()) ,AirplaneDao.getAirplane(AirplaneDao.getID(aircraft.getValue())),AirportDAO.getAirport(AirportDAO.getID(departureAirport.getValue())),AirportDAO.getAirport(AirportDAO.getID(arrivalAirport.getValue())),1))
        {
            alert.setHeaderText("Upis novog leta u bazu");
            alert.setContentText("Upis u bazu je uspješan!");
            alert.show();
        }

    }
    */}



    @FXML
    void buyTicket(ActionEvent event) {

    }

    @FXML
    void modifyEmployee(ActionEvent event) {

    }

    @FXML
    void modifyFlight(ActionEvent event) {

    }

    @FXML
    void reservationTicket(ActionEvent event) {

    }

    @FXML
    void flightReservation(ActionEvent event) {

        dateTimeReservation.setItems(FlightsDao.getFlightsDepartureCB());

    }


    @FXML
    void flightTicketNew(ActionEvent event) {

        dateTimeDeparture.setItems(FlightsDao.getFlightsDepartureCB());

    }

    @FXML
    void rightClick(ActionEvent event) {

    }
}
