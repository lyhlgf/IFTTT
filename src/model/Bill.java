package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Bill {
    int id;
    String email;
    int consume;
    Timestamp time;
    int point;
    int balance;

    public Bill() {

    }

    public Bill(String email, int consume, int point, int balance) {
        this.email = email;
        this.consume = consume;
        this.point = point;
        this.balance = balance;
        time = new Timestamp(System.currentTimeMillis());
        id = time.hashCode();
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public void setConsume(int consume) {
        this.consume = consume;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getEmail() {
        return email;
    }

    public Timestamp getTime() {
        return time;
    }

    public int getConsume() {
        return consume;
    }

    public int getBalance() {
        return balance;
    }

    public int getPoint() {
        return point;
    }

    public boolean insert() {
        Database db = new Database();
        String sql = "INSERT INTO IFTTT.Bill (ID, Email, Consume, Time, Point, Balance) VALUE ('" + id + "', '" + email + "'," +
                " '" + consume + "', '" + time + "', '" + point + "', '" + balance + "');";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public static ArrayList<Bill> getAllBills(String email) {
        Database db = new Database();
        String sql = "SELECT * FROM IFTTT.Bill WHERE Email = '" + email + "' ORDER BY Time DESC;";
        ArrayList<Bill> bills = new ArrayList<>();
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            return bills;
        } else {
            try {
                while (!resultSet.isAfterLast()) {
                    Bill bill = new Bill();
                    bill.setEmail(resultSet.getString("Email"));
                    bill.setTime(resultSet.getTimestamp("Time"));
                    bill.setConsume(resultSet.getInt("Consume"));
                    bill.setBalance(resultSet.getInt("Balance"));
                    bill.setPoint(resultSet.getInt("Point"));
                    bills.add(bill);
                    resultSet.next();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        db.closeConnection();
        return bills;
    }
}

