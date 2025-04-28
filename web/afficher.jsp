<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="src.Task" %>

<%
    ArrayList<Task> taskList = (ArrayList<Task>) session.getAttribute("taskList");
    if (taskList == null) {
        taskList = new ArrayList<Task>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Tâches</title>
</head>
<body>
    <h1>Liste de vos Tâches</h1>
    <ul>
        <% for (Task task : taskList) { %>
            <li>
                <strong><%= task.getTitle() %></strong><br>
                <%= task.getDescription() %><br>
                Date d'échéance : <%= task.getDueDate() %><br>
                Statut : <%= task.isCompleted() ? "Terminée" : "En cours" %><br><br>
            </li>
        <% } %>
    </ul>
    <br>
    <a href="index.jsp">Retour à l'accueil</a>
</body>
</html>
