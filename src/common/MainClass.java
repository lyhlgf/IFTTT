package common;

import model.Task;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

/**
 * Created by user on 2015/12/21.
 */
public class MainClass {
    public static ArrayList<Task> tasks;

    public  static void main(String[] args) {

        Calendar date = Calendar.getInstance();
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy hh:mm");            // 格式
        try {
            System.out.println(date.getTime());
            date.setTime(sf.parse("23/12/2015 16:05"));
            System.out.println(date.getTime());
            date.setTime(sf.parse("28/12/2015 15:30"));
            System.out.println(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

}
