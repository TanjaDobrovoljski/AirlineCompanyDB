package DTO;

public class FlightHasEmployee {
    private Employee employeeID;
    private Flight flightID;

    public FlightHasEmployee(Employee employeeID, Flight flightID) {
        this.employeeID = employeeID;
        this.flightID = flightID;
    }

    public Employee getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(Employee employeeID) {
        this.employeeID = employeeID;
    }

    public Flight getFlightID() {
        return flightID;
    }

    public void setFlightID(Flight flightID) {
        this.flightID = flightID;
    }
}
