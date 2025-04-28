<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body bgcolor="white">

    <h1>Exemple de connexion à MariaDB avec JSP</h1>

    <%
        // Paramètres de connexion
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "cnam";
        String password = "cnam";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Charger le pilote JDBC
            Class.forName("org.mariadb.jdbc.Driver");

            // Établir la connexion
            conn = DriverManager.getConnection(url, user, password);

            // Requête SQL
            String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // Affichage des résultats
            while (rs.next()) {
                String idFilm = rs.getString("idFilm");
                String titre = rs.getString("titre");
                String annee = rs.getString("annee");

                out.println("id : " + idFilm + ", titre : " + titre + ", année : " + annee + "<br>");
            }
        } catch (Exception e) {
            out.println("Erreur : " + e.getMessage());
        } finally {
            // Fermeture des ressources
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignorer */ }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* Ignorer */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignorer */ }
        }
    %>

    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <p>Extraire les films dont l'année est supérieure à 2000 et inférieure à 2015.</p>

    <h2>Exercice 2 : Année de recherche</h2>
    <p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

    <h2>Exercice 3 : Modification du titre du film</h2>
    <p>Créer un fichier permettant de modifier le titre d'un film à partir de son ID (ID choisi par l'utilisateur).</p>

    <h2>Exercice 4 : Insertion d'un nouveau film</h2>
    <p>Créer un formulaire pour saisir un nouveau film dans la base de données.</p>

    <hr>

    <h3>Projet Bibliothèque</h3>
    <p>Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres. Les fonctionnalités attendues dans le cadre de ce projet sont :</p>
    <ul>
        <li>L’enregistrement et la suppression de livres.</li>
        <li>La recherche de livres disponibles.</li>
        <li>L'emprunt possible d'un livre par un utilisateur.</li>
        <li>La gestion des utilisateurs.</li>
        <li>La gestion des stocks.</li>
    </ul>
    <p>Votre application exploitera le langage JSP (Java) pour interagir avec la base de données MariaDB.</p>
    <p>Elle pourra être enrichie avec des fonctionnalités supplémentaires comme des recommandations de livres, des notifications pour les retours en retard ou encore des statistiques sur l'utilisation des livres.</p>

    <p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>

