package Gestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class Supprimer
 */
@WebServlet("/supprimer")
public class Supprimer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Supprimer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
			        if (idParam != null && !idParam.isEmpty()) {
			            try {
			                int id = Integer.parseInt(idParam);

			                try {
			                    Class.forName("com.mysql.cj.jdbc.Driver");
			                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestioncontact", "root", "");

			                    String sql = "DELETE FROM contact WHERE id=?";
			                    try (PreparedStatement pst = con.prepareStatement(sql)) {
			                        pst.setInt(1, id);
			                        int rowCount = pst.executeUpdate();
			                        
			                        if (rowCount > 0) {
			                            response.sendRedirect("lister?success=1");
			                        } else {
			                            response.sendRedirect("lister?error=1");
			                        }
			                    }
			                } catch (ClassNotFoundException | SQLException e) {
			                    e.printStackTrace();
			                }
			            } catch (NumberFormatException e) {
			                e.printStackTrace();
			            }
			        } else {
			            response.sendRedirect("lister");
			        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

}
