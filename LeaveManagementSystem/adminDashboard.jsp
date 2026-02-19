import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/apply")
public class ApplyLeaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String name = request.getParameter("name");
        String reason = request.getParameter("reason");

        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<h2>Leave Application Submitted Successfully</h2>");
        out.println("<p><b>Name:</b> " + name + "</p>");
        out.println("<p><b>Reason:</b> " + reason + "</p>");
        out.println("</body></html>");
    }
}
