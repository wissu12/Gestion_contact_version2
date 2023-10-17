package Gestion;

import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Details
 */
@WebServlet("/details")
public class Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Details() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestioncontact", "root", "");

            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);

                    String sql = "SELECT * FROM contact WHERE id=?";
                    try (PreparedStatement pst = con.prepareStatement(sql)) {
                        pst.setInt(1, id);
                        ResultSet rs = pst.executeQuery();

                        if (rs.next()) {
                            String nom = rs.getString("nom");
                            String prenom = rs.getString("prenom");
                            String email = rs.getString("email");
                            String tel = rs.getString("tel");
                            String photo = rs.getString("photo");
                            String adresse = rs.getString("adresse");
                            

                        
                            request.setAttribute("nom", nom);
                            request.setAttribute("prenom", prenom);
                            request.setAttribute("email", email);
                            request.setAttribute("tel", tel);
                            request.setAttribute("photo", photo);
                            request.setAttribute("adresse", adresse);
                            request.setAttribute("id", id);
                           

                            
                            request.getRequestDispatcher("/Contact/details.jsp").forward(request, response);
                        } else {
                        	request.getRequestDispatcher("/Contact/lister.jsp").forward(request, response);
                        }
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace(); 
                }
            } else {
            	request.getRequestDispatcher("/Contact/lister.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
