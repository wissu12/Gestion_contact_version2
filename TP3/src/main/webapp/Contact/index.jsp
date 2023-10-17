<%@ page language="java" %>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des contacts</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    <script type="text/javascript" src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="jquery-1.11.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#myTable').dataTable({
                lengthMenu: [5, 10, 20, 30, 40, 50, 100],
                language: {
                    "emptyTable": "Aucun enregistrement trouvé",
                    "info": "Affichage de _START_ à _END_ sur _TOTAL_ entrées",
                    "paginate": {
                        "next": "Suivant",
                        "previous": "Précédent",
                    },
                    search: "",
                    lengthMenu: "Afficher _MENU_ contacts",
                    searchPlaceholder: "Cherchez un contact spécifique"
                }
            });
        });
    </script>
    <!-- Autres styles et scripts ici -->
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-2 ml-6">
                <div class="card" style="background:#dfe9f5;width:700px;margin-top:50px;margin-left:300px;">
                    <table id="myTable" style="width:600px;">
                        <thead>
                            <th style="width:30px;"></th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Adresse</th>
                            <th>Photo</th>
                            <th>Email</th>
                            <th>Téléphone</th>
                        </thead>
                        <tbody>
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
                                        <!-- Insérez ici la photo du contact -->
                                        <img src="<%= rs.getString("photo") %>" class="rounded-circle user_img">
                                    </div>
                                </td>
                                <td><%= rs.getString("nom") %></td>
                                <td><%= rs.getString("prenom") %></td>
                                <td><%= rs.getString("adresse") %></td>
                                <td><%= rs.getString("photo") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("tel") %></td>
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
</body>
</html>
