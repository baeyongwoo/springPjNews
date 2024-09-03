<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1>My Posts</h1>
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
</body>
</html>
