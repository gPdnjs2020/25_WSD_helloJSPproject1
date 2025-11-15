<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 11. 16.
  Time: 오전 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>목록</title>
</head>
<body>
<h2>목록 보기</h2>
<table id="listTable" border="1">
    <tr>
        <th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>관리</th>
    </tr>
</table>
<script>
    fetch('https://6918c6d821a96359487125a2.mockapi.io/crudjspproject')
        .then(res => res.json()).then(data => {
        let t = '';
        data.forEach((item, i) => {
            t += `<tr>
        <td>${i+1}</td>
        <td><a href="view.jsp?id=${item.id}">${item.title}</a></td>
        <td>${item.author}</td>
        <td>${item.regdate}</td>
        <td>
          <a href="edit.html?id=${item.id}">수정</a> |
          <a href="delete_ok.jsp?id=${item.id}">삭제</a>
        </td>
      </tr>`;
        });
        document.getElementById('listTable').innerHTML += t;
    });
</script>
<a href="write.html">새글 작성</a>
</body>
</html>