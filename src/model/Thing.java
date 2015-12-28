package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Thing {
    private String name;
    private String type;
    private boolean enable;

    public Thing() {

    }

    public Thing(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public void getThing() {
        Database db = new Database();
        String sql = "SELECT * FROM IFTTT.Thing WHERE Name = '" + name + "';";
        ResultSet resultSet = db.query(sql);
        try {
            type = resultSet.getString("Type");
            enable = resultSet.getBoolean("Stat");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public boolean updateEnable() {
        Database db = new Database();
        String sql = "UPDATE IFTTT.Thing SET `Stat` = " + enable + " WHERE Name = '" + name + "';";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public static ArrayList<Thing> getAllThings() {
        Database db = new Database();
        ArrayList<Thing> result = new ArrayList<>();
        String sql = "SELECT * FROM IFTTT.Thing;";
        ResultSet resultSet = db.query(sql);
        try {
            while (!resultSet.isAfterLast()) {
                Thing thing = new Thing();
                thing.setName(resultSet.getString("Name"));
                thing.setType(resultSet.getString("Type"));
                thing.setEnable(resultSet.getBoolean("Stat"));
                result.add(thing);
                resultSet.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        db.closeConnection();
        return result;
    }
}
