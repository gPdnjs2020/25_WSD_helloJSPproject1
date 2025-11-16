<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.net.*,java.io.*,java.nio.charset.StandardCharsets" %>
<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    String regdate = java.time.Instant.now().toString();

    try {
        URL url = new URL("https://6918c6d821a96359487125a2.mockapi.io/crudjspproject/" + id);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("PUT");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/json; utf-8");

        String jsonInput = "{\"title\":\"" + title + "\","
                + "\"author\":\"" + author + "\","
                + "\"content\":\"" + content + "\","
                + "\"regdate\":\"" + regdate + "\"}";

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInput.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        int code = conn.getResponseCode();

        if (code >= 200 && code < 300) {
            response.sendRedirect("list.jsp");
        } else {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8));
            StringBuilder errorRes = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                errorRes.append(line.trim());
            }
            br.close();

        }
    } catch (Exception e) {
        e.getMessage();
    }
%>
