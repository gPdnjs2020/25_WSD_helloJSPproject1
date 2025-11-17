<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>작성 완료</title>
    <title>form_ok.jsp</title>
</head>
<body>
<h2>게시글 작성 결과</h2>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    <form method="post" action="form.jsp"></form>

%>
<p><b>제목:</b> <%= title %></p>
<p><b>작성자:</b> <%= author %></p>
<p><b>내용:</b> <pre><%= content %></pre></p>
<p><b>이메일:</b> <%= email != null ? email : "없음" %></p>
<p>게시글이 정상적으로 등록되었습니다.</p>

<a href="form.html">새 글 작성</a>
</body>
</html>
