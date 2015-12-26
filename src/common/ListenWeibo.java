package common;

import weibo4j.Timeline;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by user on 2015/12/23.
 */
public class ListenWeibo {
    private Calendar d;
    private String t;
    private String access_token=null;
    public ListenWeibo(Calendar date, String text,String id,String password) {
        d=date;
        t=text;


       String s = getClass().getName();
        int i = s.lastIndexOf(".");
        if(i > -1) s = s.substring(i + 1);
        s = s + ".class";

        String testPath = this.getClass().getResource(s).toString();
        System.out.println(testPath);
        for(int k=0;k<7;k++) {
            i=testPath.lastIndexOf("/");
            testPath=testPath.substring(0,i);
        }
        testPath+="/src/1.py";
        testPath=testPath.substring(6);
        System.out.println(testPath);

        ProcessBuilder pp = new ProcessBuilder("python",testPath,id,password,text);
        pp.redirectErrorStream(true);
        String line=null;
        try {
            Process process=pp.start();
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));

            line=in.readLine();
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
         access_token = line;
    }
    public boolean hasThisWeibo(){

        if(access_token==null) {
            access_token = "2.00bOcjMDSvnyfBb1afb703086jX15B";
        }
        System.out.println(access_token);
        Timeline tm = new Timeline(access_token);
        try {
            List<Status> status=tm.getUserTimeline().getStatuses();
            for(Status i : status) {
                System.out.println("!"+i.getText() + "!  "+i.getCreatedAt()+" "+d.getTime());
                System.out.println(t);
                System.out.println(i.getCreatedAt().after(d.getTime()));
               if(i.getCreatedAt().after(d.getTime()) && i.getText().equals(t)) {
                   System.out.println("YES!!!!!!!!!");
                    return true;
               }
            }
        } catch (WeiboException e) {
          //  e.printStackTrace();
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e1) {
                e1.printStackTrace();
            }
        }

    return false;
    }
    public static  void main(String []args) {
       // System.out.println(new ListenWeibo(new Date(),"").hasThisWeibo());
    }
}
