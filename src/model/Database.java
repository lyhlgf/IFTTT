package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 数据库类
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

    public int getNumberOfTasks(String userEmail) throws SQLException {
        Database db = new Database();
        String sql = "select count(*) as number from IFTTT.Task where userEmail=\""+userEmail+"\";";
        int result=0;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            result=0;
        } else {
            result=resultSet.getInt("number");
        }
        db.closeConnection();
        return result;
    }

    public int[] getIndex(String userEmail) throws SQLException {
        Database database=new Database();

        String sql ="select taskName from IFTTT.Task where userEmail=\""+userEmail+"\";";
        ResultSet resultSet = database.query(sql);
        int[] result=null;
        if(resultSet==null) {
            return result;
        }
        try {
            List<String> results = new ArrayList<String>();
            resultSet.beforeFirst();
            while(resultSet.next()) {
                results.add(resultSet.getString("taskName"));
            }
            result=new int[results.size()];
            int k=0;
            for(String i:results) {
                result[k++]=Integer.parseInt(i);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.closeConnection();

        return result;
    }
}
