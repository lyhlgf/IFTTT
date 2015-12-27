package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by user on 2015/12/27.
 */


// 消费记录类
public class Consume {
    private int index;
    private String thisDesp;
    private String thatDesp;
    private int consumeValue;
    private String userEmail;

    public int getIndex() {return index;}
    public String getThisDesp() { return thisDesp;}
    public String getThatDesp() {return thatDesp;}
    public int getConsumeValue() {return consumeValue;}
    public String getUserEmail() {return userEmail;}

    public void setIndex(int index) {this.index=index;}
    public void setThisDesp(String thisDesp) {this.thisDesp=thisDesp;}
    public void setThatDesp(String thatDesp) {this.thatDesp=thatDesp;}
    public void setConsumeValue(int consumeValue) {this.consumeValue=consumeValue;}
    public  void setUserEmail(String userEmail) {this.userEmail=userEmail;}


    public  Consume() {
    }
    public Consume(String userEmail) {
        this.userEmail=userEmail;
    }
    public Consume(String thisDesp,String thatDesp,int consumeValue,String userEmail) {
        this.thisDesp=thisDesp;
        this.thatDesp=thatDesp;
        this.consumeValue=consumeValue;
        this.userEmail=userEmail;
        index=getTotalcount();
    }

    // 向数据库中插入消费记录
    public boolean insert() {
        Database db = new Database();
        String sql = "INSERT INTO IFTTT.Consume (ID, ThisDesp, ThatDesp, ConsumeValue, userEmail) VALUE ('" + index + "'," +
                " '" + thisDesp + "', '" + thatDesp + "', '" + consumeValue + "', '" + userEmail + "');";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }

    // 从数据库中获取userEmail的所有消费记录
    public Consume[] getConsume() throws SQLException {
        Database db = new Database();
        String sql = "SELECT ID,ThisDesp,ThatDesp,ConsumeValue FROM IFTTT.Consume WHERE userEmail = '" + userEmail+"';";

        boolean success = true;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            success = false;
        } else {
            index = resultSet.getInt("ID");
            thisDesp = resultSet.getString("ThisDesp");
            thatDesp = resultSet.getString("ThatDesp");
            consumeValue=resultSet.getInt("ConsumeValue");
        }

        Consume[] result=null;
        if(resultSet==null) {
            return result;
        }
        try {
            List<Consume> results = new ArrayList<Consume>();
            resultSet.beforeFirst();
            while(resultSet.next()) {
                int a = resultSet.getInt("ID");
                String b = resultSet.getString("ThisDesp");
                String c = resultSet.getString("ThatDesp");
                int d = resultSet.getInt("ConsumeValue");
                Consume temp =new Consume(userEmail);
                temp.index=a;temp.thisDesp=b;temp.thatDesp=c;temp.consumeValue=d;
                results.add(temp);
            }
            result=new Consume[results.size()];
            int k=0;
            for(Consume i:results) {
                result[k++]=i;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        db.closeConnection();
        return result;

    }

    // 获取消费记录的总项数
    private int getTotalcount() {
        Database db = new Database();
        String sql = "SELECT count(*) as number from IFTTT.Consume WHERE userEmail = '" + userEmail+"';";
        ResultSet resultSet = db.query(sql);
        int count=0;
        try {
             count = resultSet.getInt("number");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        db.closeConnection();
        return count;
    }

}
