<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>목록</title>
</head>
<body>
<h2>목록 보기</h2>
<table border="1">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>관리</th>
    </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>

<script>
    fetch('https://6918c6d821a96359487125a2.mockapi.io/crudjspproject')
        .then(res => res.json())
        .then(data => {
            let t = '';
            for (let i = 0; i < data.length; i++) {
                let item = data[i];
                t += '<tr>'
                    + '<td>' + (i + 1) + '</td>'
                    + '<td>' + item.title + '</td>'
                    + '<td>' + item.author + '</td>'
                    + '<td>' + (item.regdate ? item.regdate.slice(0, 10) : '[날짜없음]') + '</td>'
                    + '<td>'
                    + '<a href="view.jsp?id=' + item.id + '">상세보기</a>'
                    + '</td></tr>';
            }
            document.getElementById('tbody').innerHTML = t;
        });
</script>

<a href="write.html">새글 작성</a>
</body>
</html>
