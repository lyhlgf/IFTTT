package model;

import java.sql.*;

public class Database {
    private static String dbUrl;
    private static String dbUserName;
    private static String dbPassword;
    private Connection connection;
    private Statement statement;

    public static void init(String driver, String dbUrl, String dbUserName, String dbPassword) {
        try {
            Class.forName(driver);
        }catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        Database.dbUrl = dbUrl;
        Database.dbUserName = dbUserName;
        Database.dbPassword = dbPassword;
    }

    public Database() {
        try {
            connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
            statement = connection.createStatement();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public Statement getStatement() {
        return statement;
    }
}
