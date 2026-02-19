import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApplyLeaveServlet")   // ✅ must match form action
public class ApplyLeaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String reason = request.getParameter("reason");

        out.println("<html>");
        out.println("<head><title>Success</title></head>");
        out.println("<body style='text-align:center; font-family:Arial;'>");
        out.println("<h2>Leave Application Submitted Successfully!</h2>");
        out.println("<p><b>From:</b> " + fromDate + "</p>");
        out.println("<p><b>To:</b> " + toDate + "</p>");
        out.println("<p><b>Reason:</b> " + reason + "</p>");
        out.println("<br>");
        out.println("<a href='employeeDashboard.jsp'>Go Back</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
