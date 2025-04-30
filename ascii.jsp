<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASCII Art</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            text-align: center;
            padding-top: 30px;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 8px;
            font-size: 16px;
            width: 300px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        pre {
            font-family: monospace;
            font-size: 16px;
            text-align: left;
            display: inline-block;
            background-color: #ffffff;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <h1>🅰️ ASCII ART CONVERTER</h1>

    <form method="post">
        <label>Entrez un mot ou un chiffre :</label>
        <input type="text" name="text" />
        <input type="submit" value="Afficher" />
    </form>

<%
    int L = 4;
    int H = 5;

    String input = request.getParameter("text"); 
    if (input != null && !input.isEmpty()) {
        input = input.toUpperCase();

        String[] rows = {
            " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # # # ### ### ### ##  ### ### # # # # # # # # # # ### ###  #  ##  ## # # ### ###  #  ##  ",
            "# # # # #   # # #   #   #   # #  #    # ##  #   ### # # # # # # # # # # #    #  # # # # # # # #  #    #  # # # # #   # # # #   # # # # #  ",
            "### ##  #   # # ##  ##  # # ###  #    # #   #   # # ### # # ### # # ##  ###  #  # # # # # #  #   #   ##  ### ##  # # ### ##  #   ### ##   ",
            "# # # # #   # # #   #   # # # #  #    # ##  #   # # ### # # #   # # # #   #  #  # # # # ### # #  #  #    # # #   #   # # # # #     # # #  ",
            "# # ##   ## ##  ### #   ### # # ### ### # # ### # # # # ### #     # # # ###  #  ###  #  # # # #  #  ### ##   #  ##  ### ### ### ### ###  "
        };

        String validChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder[] asciiLines = new StringBuilder[H];
        for (int i = 0; i < H; i++) {
            asciiLines[i] = new StringBuilder();
        }

        for (int j = 0; j < input.length(); j++) {
            char c = input.charAt(j);
            int index = validChars.indexOf(c);
            if (index == -1) {
                continue; // ignorer les caractères non valides
            }

            for (int i = 0; i < H; i++) {
                int start = index * L;
                int end = start + L;
                if (end <= rows[i].length()) {
                    asciiLines[i].append(rows[i], start, end);
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
