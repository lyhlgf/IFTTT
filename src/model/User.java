package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class User {
    private String email;
    private String password;
    private int rank;
    private int consumption;
    private int balance;
    private int point;
    private double discount;
    private boolean isAdmin;

    public static int MAX_RANK=10;

    public User() {

    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
        this.balance = 1000;
        this.consumption = 0;
        this.rank = 1;
        this.point = 0;
        this.discount = 1;
        this.isAdmin = false;
    }

    public User(String email) {
        this.email = email;
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

    public double getDiscount() {
        return discount;
    }

    public int getPoint() {
        return point;
    }

    public void setEmail(String email) {
        this.email = email;
    }

<<<<<<< HEAD
    // 更新数据库中用户密码
=======
    public void setPoint(int point) {
        this.point = point;
        Database db = new Database();
        String sql = "update IFTTT.User set Point = '" + point + "' " +
                "where email = '"+email+"'";
        db.executeSQL(sql);
        db.closeConnection();
    }

    public void setDiscount(double discount) {
        this.discount = discount;
        Database db = new Database();
        String sql = "update IFTTT.User set Discount = '" + discount + "' " +
                "where email = '"+email+"'";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
    }

>>>>>>> upstream/master
    public void setPassword(String password) {
        this.password = password;
        Database db = new Database();
        String sql = "update IFTTT.User set Password = '" + password + "' " +
               "where email = '"+email+"'";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
    }

    public void setRank(int rank) {
        if (rank > MAX_RANK) {
            rank = MAX_RANK;
        }
        if (rank < 1) {
            rank = 1;
        }
        this.rank=rank;
        if (rank > point/1000 + 1) {
            setPoint(point + (rank - point/1000 - 1) * 1000);
        } else if (rank < point/1000 + 1) {
            setPoint(point - (point/1000 + 1 - rank) * 1000);
        }
        setDiscount((MAX_RANK-(double)rank+1)/MAX_RANK);
        Database db = new Database();
        String sql = "update IFTTT.User set Rank = '" + rank + "' " +
                "where email = '" + email + "'";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
    }

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

<<<<<<< HEAD
    // 该用户插入数据库
=======
    public boolean isAdmin() {
        return isAdmin;
    }

>>>>>>> upstream/master
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
        String sql = "SELECT * FROM IFTTT.User WHERE Email = '" + email + "' AND Password = '" + password + "';";
        boolean success = true;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            success = false;
        } else {
            rank = resultSet.getInt("Rank");
            balance = resultSet.getInt("Balance");
            consumption = resultSet.getInt("Consumption");
            point = resultSet.getInt("Point");
            discount = resultSet.getDouble("Discount");
            isAdmin = resultSet.getBoolean("isAdmin");
        }
        db.closeConnection();
        return success;
    }

    public boolean delete() {
        return false;
    }

    public boolean getUserDetail() {
        Database db = new Database();
        String sql = "SELECT * FROM IFTTT.User WHERE Email = '" + email + "';";
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            return false;
        } else {
            try {
                rank = resultSet.getInt("Rank");
                balance = resultSet.getInt("Balance");
                consumption = resultSet.getInt("Consumption");
                point = resultSet.getInt("Point");
                discount = resultSet.getDouble("Discount");
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        db.closeConnection();
        return true;
    }

    public static ArrayList<User> getAllUser() {
        Database db = new Database();
        String sql = "SELECT * FROM IFTTT.User;";
        ArrayList<User> users = new ArrayList<>();
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            return users;
        } else {
            try {
                while (!resultSet.isAfterLast()) {
                    User user = new User();
                    user.setEmail(resultSet.getString("Email"));
                    user.setRank(resultSet.getInt("Rank"));
                    user.setBalance(resultSet.getInt("Balance"));
                    users.add(user);
                    resultSet.next();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        db.closeConnection();
        return users;
    }
}
