import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NumberConvert extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numberParam = request.getParameter("number");
        String type = request.getParameter("type");
        
        int number;
        try {
            number = Integer.parseInt(numberParam);
        } catch (NumberFormatException e) {
            
            request.setAttribute("error", "Invalid number format. Please enter a valid integer.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        String result = "";

        switch (type) {
            case "binary":
                result = Integer.toBinaryString(number);
                break;
            case "hexa":
                result = Integer.toHexString(number);
                break;
            case "octal":
                result = Integer.toOctalString(number);
                break;
            default:
                result = null;
                break;
        }

        request.setAttribute("type", type);
        request.setAttribute("result", result);
        request.setAttribute("number", number);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

}
