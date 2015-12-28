

package model;

import common.ListenWeibo;
import common.ReadEmail;
import common.SendEmail;
import common.SendWeiBo;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;


public class Task extends java.util.TimerTask{
    public String userEmail;
    public String taskName;		// 任务名称
    public int TimeOrMail;		// 触发事件是时间或者邮件

    public String address;		// 接收邮箱
    public String password;		// 接受邮箱密码

    public String mailFromID;		// 发送邮箱ID
    public String mailPassword;		// 发送邮箱密码
    public String mailToID;			// 发送目的邮箱

    public Calendar currentTime;	// 事件触发的时间

    public String strDate;			// 日期
    public String strTime;			// 时间

    public int MailOrWeibo;		// 邮件或者微博

    public String weiboID;			// 微博登录名
    public String weiboPassword;	// 微博密码


    public String messageContent;	// 邮件或者微博内容

    public String detailInformation;	// 详细描述
    public boolean isRunning;
    public String listenWeiBoID;
    public String listenWeiBoPassword;
    public String listenWeiBoMessage;

    public Timer timer;

    private static Database db=new Database();
    public ListenWeibo listenWeibo;
    public Task(){					// 无参构造器
        super();
        taskName="";
        TimeOrMail=0;MailOrWeibo=0;

    }

    // 有参构造器
    public Task(String _userEmail, String _taskName, int _TimeOrMail,String _address,String _password,
                String _mailFromID,String _mailPassword,String _mailToID,String _strDate,String _strTime,
                int    _MailOrWeibo,String _weiboID,String _weiboPassword,String _messageContent,
                String _listenWeiBoID,String _listenWeiBoPassword,String _listenWeiBoMessage){
        userEmail=_userEmail;
        taskName=_taskName;
        address=_address;
        password=_password;
        TimeOrMail=_TimeOrMail;
        mailFromID = _mailFromID;
        mailPassword	=_mailPassword;
        mailToID 	=_mailToID;
        currentTime	 =StringToCalender(_strDate);
        strDate	=_strDate;
        strTime 	=_strTime;
        MailOrWeibo	=_MailOrWeibo;
        weiboID 	=_weiboID;
        weiboPassword 	=_weiboPassword;
        messageContent 	=_messageContent;
        detailInformation=toString();
        isRunning=false;
        listenWeiBoID=_listenWeiBoID;
        listenWeiBoPassword=_listenWeiBoPassword;
        listenWeiBoMessage=_listenWeiBoMessage;

    }

    public static Calendar StringToCalender(String _date){			// 从字符串到时间的转换

        Calendar date = Calendar.getInstance();
        if(_date==null) {
            return date;
        }
        SimpleDateFormat sf=new SimpleDateFormat("dd/MM/yyyy-hh:mm");			// 格式
        try {
            date.setTime(sf.parse(_date));
        } catch (ParseException e) {
            //e.printStackTrace();
        }
        return date;
    }
    public boolean insert() {
        Database db = new Database();

        String sql = "INSERT INTO IFTTT.Task (taskName,timeOrMail,receiveMail,receiveMailPassword,sendEmail," +
                "sendEmailPassword,sendToEmail,date,mailOrWeibo,weiboAccount,weiboPassword,message,isRunning," +
                "userEmail,ListenWeiBoID,ListenWeiBoPassword,listenWeiBoMessage) values (" + "\""+taskName+"\","
                + "\""+TimeOrMail+"\","  + "\""+address+"\","  + "\""+password+"\","  + "\""+mailFromID+"\","
                + "\""+mailPassword+"\","  + "\""+mailToID+"\","  + "\""+strDate+"\","  + "\""+MailOrWeibo+"\","
                + "\""+weiboID+"\","  + "\""+weiboPassword+"\","  + "\""+messageContent+"\",0,"+"\""+userEmail+"\","+
                "\""+listenWeiBoID+"\",\""+listenWeiBoPassword+"\",\""+listenWeiBoMessage+"\");";
        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }
    public  boolean update() {
        Database db = new Database();
        String sql = "update IFTTT.Task set timeOrMail=\""+TimeOrMail+"\",receiveMail=\""+address+
                "\",receiveMailPassword=\""+password+"\",sendEmail=\""+mailFromID+"\",sendEmailPassword=\""+
                mailPassword+"\",sendToEmail=\""+mailToID+"\"," + "date=\""+strDate+"\",mailOrWeibo=\""+MailOrWeibo+
                "\",weiboAccount=\""+weiboID+"\",weiboPassword=\""+weiboPassword+"\",message=\""+messageContent+
                "\",isRunning=0"+",userEmail=\""+userEmail+"\",listenWeiBoID=\""+listenWeiBoID+"\",listenWeiBoPassword=\""
                +listenWeiBoPassword +"\",listenWeiBoMessage=\""+listenWeiBoMessage+"\"  where taskName=\""+
                taskName+"\" and userEmail=\""+userEmail+"\";";
        boolean success = db.executeSQL(sql);
        db.closeConnection();

        return success;
    }
    public static boolean deleteTask(int index,String userEmail) {
        Database db = new Database();
        String sql = "delete from IFTTT.Task where taskName=\""+String.valueOf(index)+"\" and userEmail=\""+userEmail+"\";";

        boolean success = db.executeSQL(sql);
        db.closeConnection();
        return success;
    }
    public boolean getFromDatabase(int index,String userEmail) throws SQLException{

        String sql = "select taskName,timeOrMail,receiveMail,receiveMailPassword,sendEmail," +
        "sendEmailPassword,sendToEmail,date,mailOrWeibo,weiboAccount,weiboPassword,message,isRunning,userEmail," +
                "listenWeiBoID,listenWeiBoPassword,listenWeiBoMessage from IFTTT.Task where taskName=\""+
                index+"\" and userEmail=\""+userEmail+"\";";
        boolean success = true;
        ResultSet resultSet = db.query(sql);
        if (resultSet == null) {
            success = false;
        } else {
           this.taskName=resultSet.getString("taskName");
            this.TimeOrMail=resultSet.getInt("timeOrMail");
            this.address=resultSet.getString("receiveMail");
            this.password=resultSet.getString("receiveMailPassword");
            this.mailFromID=resultSet.getString("sendEmail");
            this.mailPassword=resultSet.getString("sendEmailPassword");
            this.mailToID=resultSet.getString("sendToEmail");
            this.strDate=resultSet.getString("date");
            this.currentTime=StringToCalender(this.strDate);
            this.MailOrWeibo=resultSet.getInt("mailOrWeibo");
            this.weiboID=resultSet.getString("weiboAccount");
            this.weiboPassword=resultSet.getString("weiboPassword");
            this.messageContent=resultSet.getString("message");
            this.isRunning=resultSet.getBoolean("isRunning");
            this.userEmail=resultSet.getString("userEmail");
            this.listenWeiBoID=resultSet.getString("listenWeiBoID");
            this.listenWeiBoPassword=resultSet.getString("listenWeiBoPassword");
            this.listenWeiBoMessage=resultSet.getString("listenWeiBoMessage");
        }
        return success;
    }

    public static Calendar GetCurrentTime(){					// 获取当前时间
        Calendar date=Calendar.getInstance();
        return date;
    }

    public boolean equal(Calendar date){						// 时间的相等判断
        System.out.println(strDate);
        System.out.println(currentTime);
        long a=currentTime.getTimeInMillis();               // 设定的时间
        long b = date.getTimeInMillis();                    // 当前时间
      // System.out.println(a+" "+b);
        if(Math.abs(a-b) < 1000) {
            return true;
        }
      /*  else
        }*/
        else  {
            return false;
        }
    }
    public void setTaskState(String index,String userEmail,int state) {
        Database database=new Database();
        String sql = "update `IFTTT`.`Task`\n" +
                "set isRunning ="+state+"\n" +
                "where taskName=\""+index+"\" and userEmail=\""+userEmail+"\";";
        database.executeSQL(sql);
        database.closeConnection();

    }


    public String toString() {													// 详细信息描述
        String s = new String(taskName + "\n");
        if(TimeOrMail==0) {
            s+= "If time equals to " + strDate+" " + strTime + "\n";
        }
        else if (TimeOrMail==1) {
            s+= "If receive email from " + address + "\n";
        }
        else if(TimeOrMail==2) {
            s+= "If listen message "+listenWeiBoMessage+" from weibo ID "+listenWeiBoID+"\n";
        }
        if(MailOrWeibo==0) {
            s+= "Then send email from " + mailFromID +" to " + mailToID + "\n" ;
        }
        else if(MailOrWeibo==1) {
            s+= "Then send weibo to " + weiboID+"\n";
        }
        s+= "contents is: \n" + messageContent;
        return s;
    }

    @Override
    public void run() {

        if (isRunning) {
            try {
                this.getFromDatabase(Integer.valueOf(this.taskName),this.userEmail);
                if(this.isRunning==false) {
                    this.timer.cancel();this.timer.purge();
                    this.timer=null;
                   return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (TimeOrMail == 0) {        // time
              //  System.out.println(currentTime);
                if (equal(GetCurrentTime())) {        //
                    if (MailOrWeibo == 0) {            // send email
                        new SendEmail(mailFromID, mailToID, mailPassword, messageContent);
                        setTaskState(taskName,userEmail,0);


                    } else if (MailOrWeibo == 1) {        // send weibo

                        new SendWeiBo(weiboID,weiboPassword,messageContent);
                        setTaskState(taskName,userEmail,0);


                    } else {
                        System.out.println("Not equal until now!");
                    }
                }
                else {
                    long a=currentTime.getTimeInMillis();
                    long b = GetCurrentTime().getTimeInMillis();
                    if(b>a)
                        setTaskState(taskName,userEmail,0);
                }

            } else if (TimeOrMail == 1) {    // receive mail
                try {
                    if (new ReadEmail(address, password).ReceiveMail()) {

                        if (MailOrWeibo == 0) {
                            new SendEmail(mailFromID, mailToID, mailPassword, messageContent);


                        } else if (MailOrWeibo == 1) {
                            new SendWeiBo(weiboID,weiboPassword,messageContent);


                        }
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
            else if (TimeOrMail == 2) {
                try {
                    if (listenWeibo.hasThisWeibo()) {
                        if (MailOrWeibo == 0) {
                            new SendEmail(mailFromID, mailToID, mailPassword, messageContent);

                            setTaskState(taskName,userEmail,0);
                        } else if (MailOrWeibo == 1) {
                            new SendWeiBo(weiboID,weiboPassword,messageContent); setTaskState(taskName,userEmail,0);
                        }
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
        }
        else {
            this.timer.cancel();this.timer.purge();
            this.timer=null;
        }

    }

}
