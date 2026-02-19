import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("email");  // form field name
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/leave_management?useSSL=false&serverTimezone=UTC",
                "root",
                "shrushti@15"
            );

            PreparedStatement ps = conn.prepareStatement(
                "SELECT role FROM users WHERE username=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String dbRole = rs.getString("role");

                if (dbRole.equals(selectedRole)) {

                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("role", dbRole);

                    if ("admin".equals(dbRole)) {
                        response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/employeeDashboard.jsp");
                    }

                } else {
                    response.getWriter().println("Role mismatch!");
                }

            } else {
                response.getWriter().println("Invalid Username or Password");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
