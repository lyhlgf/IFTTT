package model;

import java.lang.Exception;
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

    public boolean executeSQL(String sql) {
        boolean success = false;
        try {
            success = statement.execute(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public ResultSet query(String sql) {
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(sql);
            if (!resultSet.next()) {
                resultSet = null;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        /* TODO: Throw Exception not null */

        return resultSet;
    }

    public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
