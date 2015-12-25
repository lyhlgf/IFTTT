package common;

import weibo4j.Oauth;
import weibo4j.Timeline;

import weibo4j.Weibo;
import weibo4j.http.AccessToken;
import weibo4j.model.Status;
import weibo4j.model.StatusWapper;
import weibo4j.model.User;
import weibo4j.model.WeiboException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;


public class SendWeiBo {
    public  SendWeiBo() {
    }

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
            e.printStackTrace();
        }
        String access_token = line;

        String statuses = text;// "Test weibo by java";
        Timeline tm = new Timeline(access_token);
        try {
            Status status = tm.updateStatus(statuses);

        } catch (WeiboException e) {
            try {
                tm=new Timeline("2.00bOcjMDSvnyfBb1afb703086jX15B");
                Status status = tm.updateStatus(statuses);
            } catch (WeiboException e1) {
                e1.printStackTrace();
            }
        }
    }

    // 测试
    public static void main(String[] args) {

       // new SendWeiBo();

    }

}
