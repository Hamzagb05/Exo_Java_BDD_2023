<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASCII Art</title>
    <style>
        pre {
            font-family: monospace;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h1>ASCII ART</h1>

    <form method="post">
        Entrez un mot : <input type="text" name="text" />
        <input type="submit" value="Afficher" />
    </form>

<%
    int L = 4;
    int H = 5;

    String input = request.getParameter("text");
    if (input != null && !input.isEmpty()) {
        input = input.toUpperCase();

        String[] rows = new String[H];
        rows[0] = " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # # # ### ### ### ##  ### ### # # # # # # # # # # ### ";
        rows[1] = "# # # # #   # # #   #   #   # #  #    # ##  #   ### # # # # # # # # # # #    #  # # # # # # # #  #    #  ";
        rows[2] = "### ##  #   # # ##  ##  # # ###  #    # #   #   # # ### # # ### # # ##  ###  #  # # # # # #  #   #   #   ";
        rows[3] = "# # # # #   # # #   #   # # # #  #    # ##  #   # # ### # # #   # # # #   #  #  # # # # ### # #  #  #   ";
        rows[4] = "# # ##   ## ##  ### #   ### # # ### ### # # ### # # # # ### #     # # # ###  #  ###  #  # # # #  #  ###  ";

        StringBuilder[] asciiLines = new StringBuilder[H];
        for (int i = 0; i < H; i++) {
            asciiLines[i] = new StringBuilder();
        }

        for (int j = 0; j < input.length(); j++) {
            char c = input.charAt(j);
            int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;

            for (int i = 0; i < H; i++) {
                int start = index * L;
                int end = start + L;
                if (end <= rows[i].length()) {
                    asciiLines[i].append(rows[i], start, end);
                } else {
                    asciiLines[i].append("????");
                }
            }
        }

        out.println("<pre>");
        for (int i = 0; i < H; i++) {
            out.println(asciiLines[i].toString());
        }
        out.println("</pre>");
    }
%>

</body>
</html>
