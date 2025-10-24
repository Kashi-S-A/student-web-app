<%@page import="com.ksa.model.Student"%>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9fb;
            padding: 40px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .top-bar {
            width: 80%;
            margin: 0 auto 20px auto;
            display: flex;
            justify-content: flex-end;
        }
        a.button-link {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        a.button-link:hover {
            background-color: #0056b3;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<h2>All Registered Students</h2>

<%
    // Retrieve the list of students from the request
    List<Student> students = (List<Student>) request.getAttribute("studentList");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Action</th>
    </tr>

    <%
        if (students != null && !students.isEmpty()) {
            for (Student student : students) {
    %>
                <tr>
                    <td><%= student.getId() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><%= student.getPhone() %></td>
                    <td>
                        <a href="deleteStudent?id=<%= student.getId() %>" 
                           class="delete-link"
                           onclick="return confirm('Are you sure you want to delete this student?');">
                           Delete
                        </a>
                    </td>
                </tr>
    <%
            }
        } else {
    %>
            <tr>
                <td colspan="4">No students found</td>
            </tr>
    <%
        }
    %>
</table>
<div class="top-bar">
    <a href="/" class="button-link">Add New Student</a>
</div>

</body>
</html>
