<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="src.Task" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDateStr = request.getParameter("dueDate");
        LocalDate dueDate = LocalDate.parse(dueDateStr);

        Task newTask = new Task(title, description, dueDate);

        ArrayList<Task> taskList = (ArrayList<Task>) session.getAttribute("taskList");
        if (taskList == null) {
            taskList = new ArrayList<Task>();
            session.setAttribute("taskList", taskList);
        }

        taskList.add(newTask);

        response.sendRedirect("afficher.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Tâche</title>
</head>
<body>
    <h1>Ajouter une nouvelle tâche</h1>
    <form method="post">
        Titre : <input type="text" name="title" required><br><br>
        Description : <textarea name="description" required></textarea><br><br>
        Date d'échéance : <input type="date" name="dueDate" required><br><br>
        <input type="submit" value="Ajouter">
    </form>
    <br>
    <a href="index.jsp">Retour à l'accueil</a>
</body>
</html>
