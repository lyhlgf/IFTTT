package common;

import weibo4j.Timeline;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;

import java.util.Date;
import java.util.List;

/**
 * Created by user on 2015/12/23.
 */
public class ListenWeibo {
    private Date d;
    private String t;
    public ListenWeibo(Date date, String text) {
        d=date;
        t=text;
    }
    public boolean hasThisWeibo(){
        String access_token="2.00bOcjMDSvnyfBb1afb703086jX15B";
        Timeline tm = new Timeline(access_token);
        try {
            List<Status> status=tm.getUserTimeline().getStatuses();
            for(Status i : status) {
               if(i.getCreatedAt().after(d) && i.getText()==t) {
                    return true;
               }
            }
        } catch (WeiboException e) {
            e.printStackTrace();
        }

    return false;
    }
    public static  void main(String []args) {
        System.out.println(new ListenWeibo(new Date(),"").hasThisWeibo());
    }
}
