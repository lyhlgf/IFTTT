package common;

import weibo4j.Timeline;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.List;

/**
 * Created by user on 2015/12/23.
 */

// This事件: 监听微博在某个日期后有无发布指定内容的微博
public class ListenWeibo {
    private Calendar d;                             // 日期
    private String t;                               // 文本
    private String access_token=null;               // 微博账户的access token

    public Calendar startTime;                      // 任务开始时间

    // 使用Python脚本，根据账户和密码获取code
    public ListenWeibo(Calendar date, String text,String id,String password) {

        d=date;
        t=text;
        startTime=Calendar.getInstance();
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
            Process p=pp.start();
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
            line=in.readLine();
            in.close();
        } catch (IOException e) {
            //e.printStackTrace();
        }
         access_token = line;
    }

    // 监听当前微博账户发送的微博
    public boolean hasThisWeibo(){

        if(access_token==null) {
            access_token = "2.00bOcjMDSvnyfBb1afb703086jX15B";
        }
        System.out.println(access_token);
        Timeline tm = new Timeline(access_token);
        try {
            List<Status> status=tm.getUserTimeline().getStatuses();
            for(Status i : status) {

               if(i.getCreatedAt().after(d.getTime()) && i.getText().equals(t)) {
                    System.out.println("监听到指定微博！");
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


    // 测试
    public static  void main(String []args) {
       // System.out.println(new ListenWeibo(new Date(),"").hasThisWeibo());
    }
}
