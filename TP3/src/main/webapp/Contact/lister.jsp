<%@ page language="java" %>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des contacts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   
    <style>
        body {
            background-color: #3366cc;
            font-family: Arial, sans-serif;
        }
        
        . card h2{
        color: #e91e63;
        }


        .container {
            margin-top: 50px;
        }

        .card {
            background-color: #d6e0f5;
            margin-top: 20px;
        }

        table {
            width: 100%;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        .btn-action {
            margin: 5px;
        }

        .user-img {
            max-width: 50px;
            max-height: 50px;
            border-radius: 50%;
        }
        
        .img_cont img{
        width:50px;
        height:50px;
        }
    </style>
</head>
<body>
   <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                    <% 
   String successParam = request.getParameter("success");
   String errorParam = request.getParameter("error");

   if (successParam != null && successParam.equals("1")) {
       out.println("<p style='color: green;'>Le contact a été supprimé avec succès.</p>");
   } else if (errorParam != null && errorParam.equals("1")) {
       out.println("<p style='color: red;'>La suppression du contact a échoué.</p>");
   }
%>
                        <h2 class="card-title text-center">
                        
                        Liste des contacts
                        
                        </h2>
                        <table id="myTable" class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 5%;"></th>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Adresse</th>
                                    
                                    <th>Email</th>
                                    <th>Téléphone</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Insérez ici votre boucle pour afficher les données de la base de données -->
                                 <!-- Vous pouvez boucler à travers les enregistrements de la table contact ici -->
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestioncontact", "root", "");
                                    PreparedStatement pst = con.prepareStatement("SELECT id, nom, prenom, adresse, photo, email, tel FROM contact");
                                    ResultSet rs = pst.executeQuery();
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td style="width:30px;">
                                    <div class="img_cont">
                                        <img src="Contact/images/<%= rs.getString("photo") %>" class="rounded-circle user_img">
                                    </div>
                                </td>
                                <td><%= rs.getString("nom") %></td>
                                <td><%= rs.getString("prenom") %></td>
                                <td><%= rs.getString("adresse") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("tel") %></td>
                               <td>
									<a href="supprimer?id=<%=rs.getString(1)%>">Supprimer</a>
                        

								    <a href="edits?id=<%= rs.getInt("id") %>" class="btn btn-primary">Edit</a>
								    <a href="details?id=<%= rs.getInt("id") %>" class="btn btn-success">Show</a>
								</td>

                            </tr>
                            <%
                                    }
                                    rs.close();
                                    pst.close();
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

    <!-- Autres scripts ici -->

</body>
</html>