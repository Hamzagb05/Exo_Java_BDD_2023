<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>ASCII Art</title>
</head>
<body>
    <h1>Convertisseur ASCII Art</h1>

    <form method="post">
        <label>Mot à afficher :</label>
        <input type="text" name="mot">
        <button type="submit">Afficher</button>
    </form>

    <%
        String mot = request.getParameter("mot");
        if (mot != null && !mot.isEmpty()) {
            mot = mot.toUpperCase();
            int L = 4; // Largeur d'une lettre
            int H = 5; // Hauteur

            String[] ascii = {
                " A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  ? ",
                "#  ## ## ### ### ## ### ## ### #  ## #  # ## #  ## ### ### ## ### ## #  ## ### # ",
                "#  #  # #   #   #  #   #  #  # # #   # # # # ## #   #   # #  #  #  #  #  #   # # ",
                "### ### ##  ### ### ### ## ### #  ### ### # ## ### ### ## #  ### ### ### ### # ",
                "#  #   # #     #   #   #  #  # #   #   # # # # #   #   # #     #   #   #  #   # ",
                "#  ## ## ### ###   ## ### ## ### #  ## ### # # ## ### ## #  ### ###   #  ## ###"
            };

            for (int i = 1; i <= H; i++) {
                for (char c : mot.toCharArray()) {
                    int index;
                    if (c >= 'A' && c <= 'Z') {
                        index = c - 'A';
                    } else {
                        index = 26; // ? pour les caractères non alphabétiques
                    }
                    out.print(ascii[i].substring(index * L, (index + 1) * L));
                }
                out.println("<br>");
            }
        }
    %>
</body>
</html>
