package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private String email;
    private String password;
    private int rank;
    private int consumption;
    private int balance;

    public static int MAX_RANK=10;
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

    // 更新数据库中用户密码
    public void setPassword(String password) {
        this.password = password;
        Database db = new Database();
        String sql = "update IFTTT.User set password = '" + password + "' " +
               "where email = '"+email+"'";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
    }

    public  void setRank(int rank) { this.rank=rank; }

    // 更新数据库中的消费额
    public void setConsumption(int consumption) {
        this.consumption=consumption;
        if((int)(consumption / (double)10000) > rank-1) {
            rank=(int)(consumption / (double)10000)+1;
        }
        Database db = new Database();
        String sql = "update IFTTT.User set Consumption = '" + consumption + "', Rank='" + rank + "' " +
                "where email = '"+email+"'";
        boolean success = db.executeSQL(sql);

        db.closeConnection();
    }

    // 更新数据库中的用户余额
    public void setBalance(int balance) {
        this.balance=balance;
        Database db = new Database();
        String sql = "update IFTTT.User set Balance = '" + balance + "' " +
                "where email = '"+email+"'";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
    }

    // 该用户插入数据库
    public boolean insert() {
        Database db = new Database();
        String sql = "INSERT INTO IFTTT.User (Email, Password, Rank, Consumption, Balance) VALUE ('" + email + "'," +
                " '" + password + "', '" + rank + "', '" + consumption + "', '" + balance + "');";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    // 从数据库中获取User对象
    public boolean getUser() throws SQLException {
        Database db = new Database();
        String sql = "SELECT Email,Rank,Balance,Consumption FROM IFTTT.User WHERE Email = '" + email + "' AND Password = '" + password + "';";
        boolean success = true;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            success = false;
        } else {
            rank = resultSet.getInt("Rank");
            balance = resultSet.getInt("Balance");
            consumption = resultSet.getInt("Consumption");
        }
        db.closeConnection();
        return success;
    }

    public boolean delete() {
        return false;
    }
}
