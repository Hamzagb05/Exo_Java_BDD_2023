<%@ page import="java.util.ArrayList" %>
<%@ page import="src.Task" %>
<%@ page import="java.time.LocalDate" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDate = request.getParameter("dueDate");

        Task task = new Task(title, description, LocalDate.parse(dueDate));

        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
        }
        tasks.add(task);
        session.setAttribute("tasks", tasks);

        response.sendRedirect("afficher.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une Tâche</title>
</head>
<body>
    <h1>Ajouter une Tâche</h1>
    <form method="post">
        Titre: <input type="text" name="title" required><br>
        Description: <textarea name="description" required></textarea><br>
        Date d'échéance: <input type="date" name="dueDate" required><br>
        <input type="submit" value="Ajouter">
    </form>
</body>
</html>
