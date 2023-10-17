package Gestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@MultipartConfig

public class AjouterContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AjouterContact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Contact/ajouter.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String adress= request.getParameter("adresse");
        String photoFileName = "";
        InputStream photoInputStream = null;
		System.out.println(nom+" pre : "+prenom+" email : "+email);

        if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
            Part filePart = request.getPart("photo");
            if (filePart != null) {
                photoFileName = getSubmittedFileName(filePart);
                photoInputStream = filePart.getInputStream();
            }
        }

        
        String jdbcUrl = "jdbc:mysql://localhost:3306/gestioncontact";
        String dbUser = "root";
        String dbPassword = "";

        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            
            String insertQuery = "INSERT INTO contact (nom, prenom, email, tel, photo, adresse) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, prenom);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, tel);
            

            preparedStatement.setString(5, photoFileName);
            
            preparedStatement.setString(6,adress);

            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database error", e);
        }

       
        if (!photoFileName.isEmpty()) {
        	String uploadPath ="C:/Users/dell 7470/eclipse-workspace/TP3/src/main/webapp/Contact/images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            System.out.println(uploadPath);
            
            String filePath = uploadPath + File.separator + photoFileName;
            try (FileOutputStream outputStream = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = photoInputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
        }


        response.sendRedirect("lister");
    }
    
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }

}
