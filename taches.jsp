<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Tâches</title>
</head>
<body bgcolor=white>

<h1>Ajouter une tâche</h1>

<form action="#" method="post">
    <label for="inputValeur">Saisir le nom d'une tâche :</label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Enregistrer">
</form>

<%! 
  
    public class Tache {
        private String nomTache;

        public Tache(String nom) {
            this.nomTache = nom;
        }

        public String getNomTache() {
            return nomTache;
        }
    }
%>

<%
  
    String valeur = request.getParameter("valeur");

    if (valeur != null && !valeur.trim().isEmpty()) {
        // Création d'une tâche
        Tache maTache = new Tache(valeur.trim());
%>
        <h2>Résultat :</h2>
        <p>Nom de la tâche enregistrée : <strong><%= maTache.getNomTache() %></strong></p>
<%
    }
%>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
