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
        if (mot != null) {
            mot = mot.toUpperCase();
            int L = 4;
            int H = 5;

            String[] ascii = {
                " A  B  C  D  E  F  G  H  I  J  ? ",
                "#  ## ## ### ### ## ### ## ### # ",
                "#  #  # #   #   #  #   #  #  # # ",
                "### ### ##  ### ### ### ## ### # ",
                "#  #   # #     #   #   #  #  # # ",
                "#  ## ## ### ###   ## ### ## ###"
            };

            for (int i = 1; i <= H; i++) {
                for (char c : mot.toCharArray()) {
                    int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;
                    out.print(ascii[i].substring(index * L, (index + 1) * L));
                }
                out.println("<br>");
            }
        }
    %>
</body>
</html>
