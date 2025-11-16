<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.net.*,java.io.*,java.nio.charset.StandardCharsets" %>
<%
    String id = request.getParameter("id");
    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("list.jsp");
        return;
    }

    try {
        URL url = new URL("https://6918c6d821a96359487125a2.mockapi.io/crudjspproject/" + id);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");

        int code = conn.getResponseCode();
        BufferedReader br;
        if(code >= 200 && code < 300){
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8));
        }

        StringBuilder res = new StringBuilder();
        String line;
        while((line = br.readLine()) != null){
            res.append(line.trim());
        }
        br.close();

        String jsonString = res.toString();

        // 제목 추출
        String title = "";
        int idx = jsonString.indexOf("\"title\":\"");
        if(idx != -1){
            idx += "\"title\":\"".length();
            int endIdx = jsonString.indexOf("\"", idx);
            if(endIdx != -1){
                title = jsonString.substring(idx, endIdx);
            }
        }

        // 작성자 추출
        String author = "";
        idx = jsonString.indexOf("\"author\":\"");
        if(idx != -1){
            idx += "\"author\":\"".length();
            int endIdx = jsonString.indexOf("\"", idx);
            if(endIdx != -1){
                author = jsonString.substring(idx, endIdx);
            }
        }

        // 내용 추출
        String content = "";
        idx = jsonString.indexOf("\"content\":\"");
        if(idx != -1){
            idx += "\"content\":\"".length();
            int endIdx = jsonString.indexOf("\"", idx);
            if(endIdx != -1){
                content = jsonString.substring(idx, endIdx);
            }
        }

        // 날짜 추출
        String regdate = "";
        idx = jsonString.indexOf("\"regdate\":\"");
        if(idx != -1){
            idx += "\"regdate\":\"".length();
            int endIdx = jsonString.indexOf("\"", idx);
            if(endIdx != -1){
                regdate = jsonString.substring(idx, endIdx);
            }
        }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>글 상세보기</title>
</head>
<body>
<h2><%= title %></h2>
<p>작성자: <%= author %></p>
<p>날짜: <%= (regdate.length() > 10) ? regdate.substring(0, 10) : regdate %></p>
<p>내용:<br/><pre><%= content %></pre></p>
<a href="list.jsp">목록으로 돌아가기</a>
</body>
</html>
<%
} catch(Exception e){
%>
<h3>오류 발생: <%= e.getMessage() %></h3>
<a href="list.jsp">목록으로 돌아가기</a>
<%
    }
%>
