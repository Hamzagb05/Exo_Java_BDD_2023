<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>Taches</title>
</head><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Films de 2000 à 2015</title>
</head>
<body bgcolor="white">

    <h1>Liste des films entre 2000 et 2015</h1>

    <%
        // Définir la connexion à la base de données
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "cnam";
        String password = "cnam";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Charger le driver
            Class.forName("org.mariadb.jdbc.Driver");

            // Se connecter
            conn = DriverManager.getConnection(url, user, password);

            // Requête SQL pour sélectionner les films entre 2000 et 2015
            String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee > 2000 AND annee < 2015";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // Affichage des films
            while (rs.next()) {
                String idFilm = rs.getString("idFilm");
                String titre = rs.getString("titre");
                String annee = rs.getString("annee");

                out.println("ID : " + idFilm + " | Titre : " + titre + " | Année : " + annee + "<br>");
            }
        } catch (Exception e) {
            out.println("Erreur : " + e.getMessage());
        } finally {
            // Toujours fermer proprement
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    %>

    <p><a href="index.html">Retour au menu</a></p>

</body>
</html>

<body bgcolor=white>
<h1>Saisir une tache</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nom d'une tache : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Enregistrer">
</form>

<%! 
    class MyClass {
        String nameTache;

        public MyClass(String name) {
            nameTache = name;
        }
    }
%>

<%
    String valeur = request.getParameter("valeur");

    if (valeur != null && !valeur.isEmpty()) {
        MyClass tache = new MyClass(valeur);
%>
        <p>Nom de la tâche : <%= tache.nameTache %></p>
<%
    }
%>

</body>
</html>
