<%@ page import="java.util.ArrayList" %>
<%@ page import="src.Task" %>

<%
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>
    <h1>Liste des Tâches</h1>

    <% if (tasks != null && !tasks.isEmpty()) { %>
        <ul>
            <% for (Task task : tasks) { %>
                <li>
                    <strong><%= task.getTitle() %></strong> - 
                    <%= task.getDescription() %> 
                    (Échéance : <%= task.getDueDate() %>) 
                    <% if (task.isCompleted()) { %>
                        ✅ Terminé
                    <% } else { %>
                        ❌ En cours
                    <% } %>
                </li>
            <% } %>
        </ul>
    <% } else { %>
        <p>Aucune tâche trouvée.</p>
    <% } %>

    <a href="ajouter.jsp">Ajouter une nouvelle tâche</a><br>
    <a href="index.jsp">Retour à l'accueil</a>
</body>
</html>
