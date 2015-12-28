package common;

/**
 * Created by user on 2015/12/21.
 */

import java.util.Properties;
import javax.mail.*;

import javax.mail.search.*;

// This 事件： 监听邮箱是否收到邮件
public class ReadEmail {

    // 成员，存放信件
    private Message messages[];

    // 用来作为触发器条件：是否有新的邮件
    public boolean ReceiveMail() throws Exception {
        if(messages.length==0) {
            return false;
        }
        else {
            return true;
        }
    }

    public ReadEmail(String user,String password) throws Exception {

        // qq邮箱服务器
        String host = "pop.qq.com";

        Properties properties = System.getProperties();

        Session session = Session.getInstance(properties);
        Store store = session.getStore("imaps");
        store.connect(host, user, password);
        Folder inbox = store.getFolder("inbox");
        inbox.open(Folder.READ_ONLY);

        // 查看所有标签为UNSEEN的信件
        Flags seen = new Flags(Flags.Flag.SEEN);
        FlagTerm unseenFlagTerm = new FlagTerm(seen, false);
        messages = inbox.search(unseenFlagTerm);


        if (messages.length == 0)
            System.out.println("No messages found.");

        for (int i = 0; i < messages.length; i++) {								// 控制台输出收到的邮件信息
            messages[i].setFlag(Flags.Flag.SEEN, true);
            System.out.println("Message " + (i + 1));
            System.out.println("From : " + messages[i].getFrom()[0]);
            System.out.println("Subject : " + messages[i].getSubject());
            System.out.println("Sent Date : " + messages[i].getSentDate());
            System.out.println();
        }

        inbox.close(true);
        store.close();
    }

    // 测试
    public static void main(String[] args) throws Exception{

    }
}