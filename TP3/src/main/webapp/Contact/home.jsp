<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewreport" content="width=device-width, initial-scale=1.0">
	<title>
		HomePage
	</title>
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet" />
	
	<style type="text/css">
	@charset "UTF-8";

body{
	margin:0;
	padding:0;
	color:white;
	font-family: 'Raleway',sans-serif;
	
}



.banner{
	height: 100vh;
	width: 100%;
	background-image:url('Contact/images/b2.png');
	
	background-size:cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.banner .info{
	margin-top:5%;
	transform: translateY(-15%);
}
.banner h1{
	font-size: 3.5em;
	font-weight: 700;
	color: #ff99cc;
	letter-spacing: 2px;
	margin-top: 10%;
}
.banner .info p{
	font-size: 2em;
	font-weight: 500;
	color: #f0e6ff;
	letter-spacing: 2px;
}

.banner .info a{
	/*margin-left:50%;
	margin-right: 10px;
	transform: translateX(-50%);*/
	color: #ff339c;
	background: #ffd6eb;
	border-color: #e91e63;
	padding:10px 20px; 
	font-size: 16px;
	font-weight: 800;
	display: inline-block;
    margin-right: 10px;
}
.banner .info a:hover{
	background: #ff339c;
	color:#ffd6eb;
	border-color: #ffd6eb;
}




	</style>
</head>
<body>

	<div class="container-fluid banner">
		<div class="row">
		
<h1 class="text-center">Home</h1>
			<div class="col-md-8 offset-md-2 info">
				
				<p class="text-center">
					Bienvenue dans le site de gestion des contacts
				</p>
				<br>
				<center>
				  <a href="lister" class="btn btn-md text-center">Liste des contacts</a>
                  <a href="AjouterContact" class="btn btn-md text-center">Ajouter des contacts</a>
				</center>
				
				
                 
                

				
			</div>
			
		</div>
	</div>
	
	
</body>
</html>