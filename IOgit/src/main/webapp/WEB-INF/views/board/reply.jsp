<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.BufferedReader"%>

<%
    BufferedReader reader = null;
    String bno = request.getParameter("bno"); // URL 파라미터에서 bno 값을 가져옴
    try {
        String filePath = application.getRealPath("/resources/js/reply.js"); 
        reader = new BufferedReader(new FileReader(filePath));
        out.print("<script>\n");
        out.print("var bnoValue = '" + bno + "';\n"); // bnoValue 변수 설정
        String line;
        while ((line = reader.readLine()) != null) {
            out.print(line + "\n");
        }
        out.print("</script>");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (reader != null) {
                reader.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
