<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facelet Title</title>
    <style>
        .btn {
            padding: 5px 10px;
        }
        .error {
            color: red;
            margin-top: 10px;
            font-size: 19px;
        }
    </style>
</head>
<body>
    <h3>Converter</h3>
    <form action="convert" method="post">
        Enter Base 10 Number <input type="text" name="number" required><br><br>
        <button type="submit" class="btn" name="type" value="binary">Binary</button>
        <button type="submit" class="btn" name="type" value="hexa">Hexa</button>
        <button type="submit" class="btn" name="type" value="octal">Octal</button>
        <button type="reset" class="btn">Clear</button>
    </form>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <% if(request.getAttribute("result") != null) { %>
        <h3>Result</h3>
        <p>Number: <%= request.getAttribute("number") %></p>
        <p>Result: <%= request.getAttribute("result") %></p>
        <% 
            String type = (String) request.getAttribute("type");
            if (type != null) {
                switch (type) {
                    case "binary":
                        out.println("<li style='margin-left: 5px; color: blue;'>Decimal number converted to binary</li>");
                        break;
                    case "hexa":
                        out.println("<li style='margin-left: 5px; color: blue;'>Decimal number converted to hexadecimal</li>");
                        break;
                    case "octal":
                        out.println("<li style='margin-left: 5px; color: blue;'>Decimal number converted to octal</li>");
                        break;
                    default:
                        break;
                }
            }
        %>
    <% } %>
</body>
</html>
