import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

class myProj {
    public static void main(String[] args) throws ParseException {
        Connection conn = null;

        // String myConnectionString = "jdbc:mysql://127.0.0.1:3306/project_vasutiwari";

        // "jdbc:sqlserver://127.0.0.1:3306;DatabaseName=project_vasutiwari";

        try {
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/project_vasutiwari?"
                    + "user=root&password=11223344");

            // Execute database operations...
            // CallableStatement mycall = conn.prepareCall("{call get_patients()}");

            // ResultSet rs = mycall.executeQuery();
            Scanner scnr = new Scanner(System.in);

            while (true) {

                System.out.println("Please enter your choice");
                System.out.println("1. For printing all patient details");
                System.out.println("2. For Adding new patient and insurance details");
                System.out.println("3. For Adding updating clinicalcare details of agiven patient id");
                System.out.println("4. For exit");
                int choice = scnr.nextInt();

                switch (choice) {
                    case 1:
                        print_patients(conn);
                        break;
                    case 2:
                        add_new_patient(conn);
                        break;
                    case 3:
                        update_clinicalcare(conn);
                        break;
                    case 4:
                    default:
                        System.out.println("Exit");
                        conn.close();
                        System.exit(1);
                }
            }

            // add_new_patient(conn);

            // update_clinicalcare(conn);

            // print_patients(conn);
            // conn.close();
            // System.out.println(rs);
        } catch (SQLException e) {
            System.out.println("Cannot connect to database:"
                    + e.getMessage());
        }
    }

    // a. Enter a new patient (all relevant patient demographics and insurance data)

    public static void add_new_patient(Connection conn) throws SQLException, ParseException {
        Scanner scnr = new Scanner(System.in);
        System.out.println("---------------Add new patient API----------------");
        System.out.println("Please enter the fname");
        String fname = scnr.next();
        System.out.println("Please enter the lname");
        String lname = scnr.next();
        System.out.println("Please enter phonenumber");
        int phoneNum = scnr.nextInt();
        System.out.println("Please enter email");
        String email = scnr.next();
        scnr.nextLine();
        System.out.println("Please enter address");
        String address = scnr.nextLine();
        System.out.println("Please enter dob in format yyyy-mm-dd");
        String dob = scnr.next();
        System.out.println("Please enter blood group");
        String bloodGroup = scnr.next();
        System.out.println("Please enter gender M/F");
        String gender = scnr.next();
        System.out.println("Please enter height");
        int height = scnr.nextInt();
        System.out.println("Please enter weight");
        int weight = scnr.nextInt();

        int insuranceId = add_new_insurance(conn);

        CallableStatement add_pat = conn.prepareCall("{call add_patient(?,?,?,?,?,?,?,?,?,?,?)}");

        add_pat.setString(1, fname);
        add_pat.setString(2, lname);
        add_pat.setInt(3, phoneNum);
        add_pat.setString(4, email);
        add_pat.setString(5, address);
        add_pat.setString(6, dob);
        add_pat.setString(7, bloodGroup);
        add_pat.setString(8, gender);
        add_pat.setInt(9, height);
        add_pat.setInt(10, weight);
        add_pat.setInt(11, insuranceId);

        ResultSet rs = add_pat.executeQuery();
    }

    public static int add_new_insurance(Connection conn) throws SQLException, ParseException {
        Scanner scnr = new Scanner(System.in);
        System.out.println("---------------Add insurance API----------------");
        System.out.println("Please enter healthInsuranceNumber");
        int healthInsuranceNumber = scnr.nextInt();
        System.out.println("Please enter insuranceGroupNumber");
        int insuranceGroupNumber = scnr.nextInt();
        scnr.nextLine();
        System.out.println("Please enter insuranceName");
        String insuranceName = scnr.nextLine();
        //scnr.nextLine();
        System.out.println("Please enter address");
        String address = scnr.nextLine();
        System.out.println("Please enter validity in format yyyy-mm-dd");
        String validity = scnr.next();

        // Date date=new SimpleDateFormat("yyyy/MM/dd").parse(validity);

        CallableStatement add_ins = conn.prepareCall("{call add_insurance(?,?,?,?,?)}");

        add_ins.setInt(1, healthInsuranceNumber);
        add_ins.setInt(2, insuranceGroupNumber);
        add_ins.setString(3, insuranceName);
        add_ins.setString(4, address);
        add_ins.setString(5, validity);

        ResultSet rs = add_ins.executeQuery();

        add_ins = conn.prepareCall("{call get_insurance_last_id()}");

        rs = add_ins.executeQuery();
        String id = "";

        while (rs.next()) {
            id += rs.getString(1);
        }

        // System.out.println(id);

        return Integer.parseInt(id);
    }

    /*
     * Change one of the clinical fields for a particular visit of a particular
     * patient (e.g.
     * change the diagnosis code, medication name, or the weight entered for a given
     * patient and given visit date)
     */
    public static void update_clinicalcare(Connection conn) throws SQLException {
        Scanner scnr = new Scanner(System.in);
        System.out.println("---------------Update clinical care API----------------");
        System.out.print("Please enter patient id: ");
        int pid = scnr.nextInt();
        scnr.nextLine();
        System.out.print("Please enter dateOfVisit in yyyy-mm-dd hh:mm:ss: ");
        String dateOfVisit = scnr.nextLine();
        // scnr.nextLine();
        System.out.print("Please enter illness to be updated: ");
        String illness = scnr.nextLine();

        CallableStatement upd_cc = conn.prepareCall("{call update_clinicalcare(?,?,?)}");

        upd_cc.setString(1, illness);
        upd_cc.setString(2, dateOfVisit);
        upd_cc.setInt(3, pid);

        ResultSet rs = upd_cc.executeQuery();

        System.out.println("Done");
    }

    public static void print_patients(Connection conn) throws SQLException {
        System.out.println("---------------Print Patients API----------------");

        CallableStatement get_pat = conn.prepareCall("{call get_patients()}");

        ResultSet rs = get_pat.executeQuery();

        ResultSetMetaData rsmd = rs.getMetaData();

        int columnsNumber = rsmd.getColumnCount();

        while (rs.next()) {
            // Print one row
            for (int i = 1; i <= columnsNumber; i++) {
                System.out.print(rs.getString(i) + " "); // Print one element of a row
            }
            System.out.println();// Move to the next line to print the next row.
        }
    }
}