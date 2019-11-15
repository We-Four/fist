<%@page import="java.sql.Connection,java.sql.Statement,java.util.Scanner,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
   table{
          border-collapse: collapse;
          border: none;
          width: 700px;
   }
   td,th{
          border: solid grey 1px;            
          margin: 0 0 0 0;
          padding: 5px 5px 5px 5px 
  }
  .c1 {
    width:100px
  }
  .c2 {
    width:200px
  }
  .c3 {
    width:100px
  }
  .c4 {
    width:100px
  }
  .c5 {
    width:100px
  }
  .c6 {
    width:100px
  }
  a:link,a:visited {
    color:blue
  }

  .container{  
    margin:0 auto;   
    width:700px;  
    text-align:center;  
  }  

</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">
      <h1>浏览学生名单</h1>  
      <table>
      <tr>
        <th class='c1'>学号</th>
        <th class='c2'>姓名</th>
        <th class='c3'>年龄</th>
        <th class='c4'>年级</th>
        <th class='c5'>爱好</th>
        <th class='c6'>-</th>
      </tr>

<%
String pgno = "";  //网址中传递的页面数据
String pgcnt = ""; //网址传递的每页最大显示数目
int RowAmount = 0; //数据库中总的行数
int PageAmount = 0; //数据库所有页面可以组成多少个页面
int PageSize; //每页最大显示数目
int PageNow;  //当前页面
ResultSet rs;
if(request.getParameter("pgno")!=null){  //获取网址从传递的数据
    pgno = request.getParameter("pgno");
}else{
    pgno = "1";  //赋给初始值防止没有传入数据时崩溃
}
PageNow = java.lang.Integer.parseInt(pgno);
if(PageNow <= 0){
    PageNow = 1;
}

if(request.getParameter("pgcnt")!=null){
    pgcnt = request.getParameter("pgcnt");
}else{
    pgcnt = "4";
}
PageSize = java.lang.Integer.parseInt(pgcnt); 

try{
    String connectString = "jdbc:mysql://localhost/test"
            + "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String user = "root";
    String pwd = "mysql";
    String sql = "select *from stu;";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(connectString, user, pwd);

    Statement state = conn.createStatement();
    rs = state.executeQuery(sql);
    rs.last();
    RowAmount = rs.getRow();
    PageAmount = (RowAmount + PageSize - 1 )/ PageSize;
    if(PageNow > PageAmount){
        PageNow = PageAmount;
    }
    if(PageAmount > 0){
        rs.absolute((PageNow - 1)*PageSize + 1); 
    }
    for(int i = 0 ; i < PageSize && !rs.isAfterLast(); i++){
        %>
        <tr>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("age") %></td>
        <td><%=rs.getString("grade") %></td>
        <td><%=rs.getString("hobby") %></td>
        <td><a href='updateStu.jsp?pid=<%=rs.getString("id") %>'>修改</a>&nbsp;<a href='deleteStu.jsp?pid=<%=rs.getString("id") %>'>删除</a></td>
         </tr>
        <%
        rs.next();
    }
    rs.close();
    state.close();
    conn.close();
    }catch (Exception e){
    e.printStackTrace();
}
%>    
      </table>
      <br><br>  
      <div style="float:left">
         <a href="addStu.jsp">新增</a>
      </div>
      <div style="float:right">
        <a href="browseStu.jsp?pgno=<%=PageNow-1 %>&pgcnt=4">
                        上一页</a>    &nbsp;               
        <a href="browseStu.jsp?pgno=<%=PageNow+1 %>&pgcnt=4">
                       下一页</a>
      </div>
      <br><br>
      <br><br>

      <p>PageAmount:<%=PageAmount %> RowAmount:<%=RowAmount %></p>  
      <p>PageNow:<%=PageNow%></p>

  </div>
  <pre>
   </pre> 

</body>
</html>
