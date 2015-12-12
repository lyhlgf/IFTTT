package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private String email;
    private String password;
    private int rank;
    private int consumption;
    private int balance;

    public User(String email, String password) {
        this.email = email;
        this.password = password;
        this.balance=1000;
        this.consumption=0;
        this.rank=1;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public  int getRank() {return rank;}

    public  int getConsumption() {return consumption;}

    public int getBalance() {return balance;}

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public  void setRank(int rank) { this.rank=rank; }

    public void setConsumption(int consumption) { this.consumption=consumption;}

    public void setBalance(int balance) {this.balance=balance;}


    public boolean insert() {
        Database db = new Database();
        String sql = "INSERT INTO IFTTT.User (Email, Password, Rank, Consumption, Balance) VALUE ('" + email + "'," +
                " '" + password + "','"+ rank +"',,'"+ consumption +"',,'"+ balance +"');";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public boolean getUser() throws SQLException {
        Database db = new Database();
        String sql = "SELECT Email,Rank,Balance,Consumption FROM IFTTT.User WHERE Email = '" + email + "' AND Password = '" + password + "';";
        boolean success = true;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            success = false;
        }
        rank=resultSet.getInt("Rank");
        balance= resultSet.getInt("Balance");
        consumption=resultSet.getInt("Consumption");
        db.closeConnection();
        return success;
    }

    public boolean delete() {
        return false;
    }
}
