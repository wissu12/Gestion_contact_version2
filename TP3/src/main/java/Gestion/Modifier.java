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
import java.sql.ResultSet;
import java.sql.SQLException;

import BD.MySQLDatabase;
@WebServlet("/edits")
@MultipartConfig
public class Modifier extends HttpServlet {
    private static final long serialVersionUID = 1L;
   


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
                        	String contact_id = rs.getString("id");
                            String nom = rs.getString("nom");
                            String prenom = rs.getString("prenom");
                            String email = rs.getString("email");
                            String tel = rs.getString("tel");
                            String photo = rs.getString("photo");
                            String adresse = rs.getString("adresse");
                            

                        
                            request.setAttribute("contact_id", contact_id);
                            request.setAttribute("nom", nom);
                            request.setAttribute("prenom", prenom);
                            request.setAttribute("email", email);
                            request.setAttribute("tel", tel);
                            request.setAttribute("photo", photo);
                            request.setAttribute("adresse", adresse);
                           

                            
                            request.getRequestDispatcher("/Contact/modifier.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        System.out.println(nom);
        String prenom = request.getParameter("prenom");
        System.out.println(prenom);
        String idParam = request.getParameter("id_contact");
        int userId = Integer.parseInt(idParam);

        System.out.println("L'ID est : " + userId);
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String adresse = request.getParameter("adresse");
        String photoFileName = "";
        InputStream photoInputStream = null;

        if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
            Part filePart = request.getPart("photo");
            if (filePart != null && filePart.getSize() > 0) {
                photoFileName = getSubmittedFileName(filePart);
                System.out.println(photoFileName);
                photoInputStream = filePart.getInputStream();
            }
        }

        String jdbcUrl = "jdbc:mysql://localhost:3306/gestioncontact";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String updateQuery = "UPDATE contact SET nom=?, prenom=?, email=?, tel=?, adresse=?";

            if (!photoFileName.isEmpty()) {
                updateQuery += ", photo=?";
            }

            updateQuery += " WHERE id=?"; 
            PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, prenom);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, tel);
            preparedStatement.setString(5, adresse);

            if (!photoFileName.isEmpty()) {
                preparedStatement.setString(6, photoFileName);
                preparedStatement.setInt(7, userId);
            } else {
                preparedStatement.setInt(6, userId);
            }

            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database error", e);
        }

        if (!photoFileName.isEmpty()) {
            // Mettez à jour la photo uniquement si un nouveau fichier a été téléchargé
            String uploadPath = "C:/Users/dell 7470/eclipse-workspace/TP3/src/main/webapp/Contact/images";
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

        request.getRequestDispatcher("/Contact/lister.jsp").forward(request, response);
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