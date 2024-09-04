<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <title>My Page</title>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-rounded/css/uicons-regular-rounded.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Sevillana&display=swap"
	rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/logo" rel="stylesheet">
</head>
<body>
 <%@ include file="/resources/heater/header.jsp" %>
    <h1>My page</h1>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Title</th>
                <th>Date</th>
                <th>Content</th>
                <th>Category</th>
                <th>Department</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="post" items="${myPosts}">
                <tr>
                    <td>${post.tno}</td>
                    <td>${post.tmptitle}</td>
                    <td>${post.tmpregdate}</td>
                    <td>${post.tmpcontent}</td>
                    <td>${post.category}</td>
                    <td>${post.dname}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <%@ include file="/resources/heater/footer.jsp" %>
</body>
</html>
