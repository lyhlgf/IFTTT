package model;

import java.sql.ResultSet;

public class User {
    private String email;
    private String password;

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean insert() {
        Database db = new Database();
        String sql = "INSERT INTO IFTTT.User (Email, Password) VALUE ('" + email + "', '" + password + "');";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public boolean getUser() {
        Database db = new Database();
        String sql = "SELECT Email FROM IFTTT.User WHERE Email = '" + email + "' AND Password = '" + password + "';";
        boolean success = true;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            success = false;
        }
        db.closeConnection();
        return success;
    }

    public boolean delete() {
        return false;
    }
}
