## 环境搭建

+ 安装IntelliJ IDEA Ultimate；
https://www.jetbrains.com/idea/#chooseYourEdition
+ 安装JDK 1.8.0
http://www.oracle.com/technetwork/cn/java/javase/downloads/index.html
+ 安装tomcat 9.0.0
http://tomcat.apache.org/download-90.cgi
+ 安装MySQL 以及 MySQL对应的jdbc驱动；
https://www.mysql.com/downloads/
https://www.mysql.com/products/connector/
+ 在IDEA 中 配置jdk 和 tomcat的目录；
> File - Project Structure - Project 设置jdk；
> Run - Edit configurations - 添加tomcat server 并选择其目录
+ 在MySQL当中建立数据库和表，详细的命令见  项目根目录/database.sql文件
+ 修改Web/WEB-INF/web.xml文件中地42行和第46行为本地数据库用户名和密码；
+ Run register.jsp 或者 login.jsp
