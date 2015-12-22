package common;

import weibo4j.Timeline;

import weibo4j.model.Status;
import weibo4j.model.WeiboException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class SendWeiBo {

    public SendWeiBo(String id,String password,String text){
        // TODO Auto-generated method stub
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

        }
        String access_token = line;
        System.out.println(id+" "+password+" "+line);
        String statuses = text;// "Test weibo by java";
        Timeline tm = new Timeline(access_token);
        try {
            Status status = tm.updateStatus(statuses);

        } catch (WeiboException e) {
            e.printStackTrace();
        }
    }

    // 测试
    public static void main(String[] args) {

    }

}
