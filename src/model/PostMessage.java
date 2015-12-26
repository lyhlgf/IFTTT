package model;

/*
*   Use "public" as email to create or get a public post message
*   Use user's email as email to create or get a private post message
* */

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class PostMessage {
    private int id;
    private String email;
    private String subject;
    private String content;
    private Timestamp time;
    private boolean read;
    private boolean important;

    public PostMessage() {

    }

    public PostMessage(String email, String subject, String content) {
        this.email = email;
        this.subject = subject;
        this.content = content;
        time = new Timestamp(System.currentTimeMillis());
        id = time.hashCode();
        read = false;
        important = false;
    }

    public boolean insert() {
        Database db = new Database();
        String sql = "INSERT INTO IFTTT.PostMessage (ID, Email, Subject, Content, Time, Read, Important) VALUE ('" + id + "'," +
                " '" + email + "', '" + subject + "', '" + content + "', '" + time + "', '" + read + "', '" + important + "');";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public static boolean update(int id, String colunm, String text) {
        Database db = new Database();
        String sql = "UPDATE IFTTT.PostMessage SET `" + colunm + "` = '" + text + "' WHERE ID = '" + id + "';";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public static boolean mark(int id, String colunm, boolean stat) {
        Database db = new Database();
        String sql = "UPDATE IFTTT.PostMessage SET `" + colunm + "` = " + stat + " WHERE ID = '" + id + "';";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public static boolean delete(int id) {
        Database db = new Database();
        String sql = "DELETE FROM IFTTT.PostMessage WHERE ID = '" + id + "';";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    public static ArrayList<PostMessage> getPostMessage(String email) {
        Database db = new Database();
        String sql = "SELECT * FROM IFTTT.PostMessage WHERE Email = '" + email + "' ORDER BY Time DESC;";
        ResultSet resultSet = db.query(sql);
        ArrayList<PostMessage> result = new ArrayList<>();
        try {
            while (!resultSet.isAfterLast()) {
                PostMessage postMessage = new PostMessage();
                postMessage.setId(resultSet.getInt("ID"));
                postMessage.setSubject(resultSet.getString("Subject"));
                postMessage.setContent(resultSet.getString("Content"));
                postMessage.setTime(resultSet.getTimestamp("Time"));
                postMessage.setRead(resultSet.getBoolean("Read"));
                postMessage.setImportant(resultSet.getBoolean("Important"));
                result.add(postMessage);
                resultSet.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        db.closeConnection();
        return result;
    }

    public static PostMessage getPostMessage(int id) {
        Database db = new Database();
        PostMessage postMessage = new PostMessage();
        String sql = "SELECT * FROM IFTTT.PostMessage WHERE ID = '" + id + "';";
        ResultSet resultSet = db.query(sql);
        try {
            postMessage.setId(resultSet.getInt("ID"));
            postMessage.setEmail(resultSet.getString("Email"));
            postMessage.setSubject(resultSet.getString("Subject"));
            postMessage.setContent(resultSet.getString("Content"));
            postMessage.setTime(resultSet.getTimestamp("Time"));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        db.closeConnection();
        return postMessage;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public void setRead(boolean read) {
        this.read = read;
    }

    public void setImportant(boolean important) {
        this.important = important;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getSubject() {
        return subject;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getTime() {
        return time;
    }

    public boolean isRead() {
        return read;
    }

    public boolean isImportant() {
        return important;
    }
}
