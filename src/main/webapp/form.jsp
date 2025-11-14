<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성 폼</title>
</head>
<body>
<h2>게시글 작성</h2>
<form action="form_ok.jsp" method="post">
    <label for="title">제목:</label><br>
    <input type="text" id="title" name="title" required><br><br>

    <label for="author">작성자:</label><br>
    <input type="text" id="author" name="author" required><br><br>

    <label for="content">내용:</label><br>
    <textarea id="content" name="content" rows="5" cols="40" required></textarea><br><br>

    <label for="email">이메일:</label><br>
    <input type="email" id="email" name="email"><br><br>

    <label for="password">비밀번호:</label><br>
    <input type="password" id="password" name="password" required><br><br>

    <input type="submit" value="작성 완료">
</form>
</body>
</html>
