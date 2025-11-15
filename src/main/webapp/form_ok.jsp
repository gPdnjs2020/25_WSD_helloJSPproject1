<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 11. 10.
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>form_ok.jsp</title>
</head>
<body>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
%>
<h2>제목: <%= title %></h2>
<p>작성자:<%=author%></p>
<br />
<p>내용: <%=content%></p>
<p>이메일: <%=email%></p>
<p>비밀번호: <%=password%></p>

</body>
</html>

