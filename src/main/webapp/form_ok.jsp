<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 11. 10.
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>작성 완료</title>
</head>
<body>
<h2>게시글 작성 결과</h2>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

%>
<p><b>제목:</b> <%= title %></p>
<p><b>작성자:</b> <%= author %></p>
<p><b>내용:</b> <pre><%= content %></pre></p>
<p><b>이메일:</b> <%= email != null ? email : "없음" %></p>
<p>게시글이 정상적으로 등록되었습니다.</p>

<a href="form.html">새 글 작성</a> | <a href="list.jsp">목록 보기</a>
</body>
</html>

