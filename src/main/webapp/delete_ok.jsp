<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.net.*,java.io.*"%>
<%
  String id = request.getParameter("id");

  try {
    URL url = new URL("https://6918c6d821a96359487125a2.mockapi.io/crudjspproject/" + id);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("DELETE");

    int code = conn.getResponseCode();
    if (code >= 200 && code < 300) {
      response.sendRedirect("list.jsp");
    }
  } catch (Exception e) {
    e.getMessage();
  }
%>
