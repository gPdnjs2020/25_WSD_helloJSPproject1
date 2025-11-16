<%@page contentType="text/html;charset=UTF-8" language="java" import="java.net.*,java.io.*"%>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    String regdate = java.time.Instant.now().toString();

    try {
        URL url = new URL("https://6918c6d821a96359487125a2.mockapi.io/crudjspproject");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/json; utf-8");

        String jsonInputString = "{\"title\":\"" + title + "\","
                + "\"author\":\"" + author + "\","
                + "\"content\":\"" + content + "\","
                + "\"regdate\":\"" + regdate + "\"}";

        try(OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        int code = conn.getResponseCode();
        BufferedReader br;
        if (code >= 200 && code < 300) {
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8));
        }
        StringBuilder res = new StringBuilder();
        String responseLine;
        while ((responseLine = br.readLine()) != null) {
            res.append(responseLine.trim());
        }
        br.close();

        response.sendRedirect("list.jsp");

    } catch (Exception e) {
        e.getMessage();
    }
%>
