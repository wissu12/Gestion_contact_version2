<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@page import= "java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page  import="java.util.ArrayList"%>


<%@page import= "BD.MySQLDatabase" %>






<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <title>Document</title>
        <link rel="stylesheet" href="Contact/css/edit.css">
        <style>
        
        @charset "ISO-8859-1";

@import url("https://fonts.googleapis.com/css2?family=Bai+Jamjuree:wght@400;600&family=Open+Sans:wght@400;700&family=Poppins:wght@600&family=Rubik:ital,wght@0,500;0,700;1,400&display=swap");

:root {
  --green: #36e2ec;
}


.row {
	
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}




/*  */
.container2 {
  height: 120vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0px;
 
  margin-left:500px;
margin-top:20px;

}
.container2 form {
  flex: 0 1;
  min-height: 400px;
  min-width: 500px;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  column-gap: 10px;
  background-color: #111727;
  padding: 1rem;
  border-radius: 0.5rem;
  -webkit-border-radius: 0.5rem;
  -moz-border-radius: 0.5rem;
  -ms-border-radius: 0.5rem;
  -o-border-radius: 0.5rem;
  box-shadow: 1px 2px 13px -1px #332a52;
}
.container2 form h1 {
  font-size: 1.5rem;
  color: white;
  font-weight: 400;
  margin-bottom: 1rem;
}
.container2 form .t-input {
  position: relative;
 /* width: 100%; */

  display: inline-block;
  width: 48%; /* adjust as needed */
  margin-right: 2%; 
}
.container2 form .t-input input {
  width: 100%;
  min-height: 40px;
  color: white;
  background-color: transparent;
  outline: none;
  border: none;
  /* border-bottom: 2px solid; */
  font-size: 1rem;
  font-weight: lighter;
  position: relative;
  white-space: 0.5;
  caret-color: var(--green);
}
.container2 form .t-input input::placeholder {
  opacity: 0;
}
.container2 form .t-input .b-line {
  content: "";
  position: absolute;
  height: 2px;
  width: 35%;
  background: linear-gradient(90deg, var(--green) 0%, transparent 100%);
  bottom: 0;
  left: 0;
  transition-duration: 300ms;
}
.container2 form .t-input input:not(:placeholder-shown) ~ .b-line,
.container2 form .t-input:hover .b-line,
.container2 form .t-input:focus-within .b-line {
  background: linear-gradient(90deg, var(--green) 0%, transparent 100%);
  width: 100%;
}
.container2 form .t-input label {
  outline: none;
  font-size: 14px;
}
.container2 form .t-input:hover label {
  color: var(--green);
}
.container2 form .t-input input + label {
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  color: white;
  transition-duration: 150ms;
}
.container2 form .t-input input:not(:placeholder-shown) + label,
.container2 form .t-input input:focus + label {
  font-size: 0.75rem;
  transform: translateY(-180%);
  -webkit-transform: translateY(-180%);
  -moz-transform: translateY(-180%);
  -ms-transform: translateY(-180%);
  -o-transform: translateY(-180%);
  color: var(--green);
}
.container2 form .check {
  align-self: flex-start;
  height: 30px;
  position: relative;
}
.container2 form .check input {
  appearance: none;
}
.container2 form .check input + label {
  color: white;
  font-size: 12px;
  padding-left: 1.5rem;
  transition-duration: 100ms;
}
.container2 form .check input:focus + label,
.container2 form .check input:checked + label {
  color: var(--green);
}
.container2 form .check input:focus + label::before {
  border-color: var(--green);
}
.container2 form .check input + label::before {
  content: "";
  position: absolute;
  width: 1rem;
  height: 1rem;
  border: 2px solid white;
  top: 50%;
  transform: translateY(-60%);
  -webkit-transform: translateY(-60%);
  -moz-transform: translateY(-60%);
  -ms-transform: translateY(-60%);
  -o-transform: translateY(-60%);
  transition-duration: 100ms;
  left: 0;
  outline: none;
}
.container2 form .check input:checked + label::before {
  border: 2px solid var(--green);
  width: 6px;
  height: 0.9rem;
  transform: translate(75%, -85%) rotate(45deg);
  -webkit-transform: translate(75%, -85%) rotate(45deg);
  -moz-transform: translate(75%, -85%) rotate(45deg);
  -ms-transform: translate(75%, -85%) rotate(45deg);
  -o-transform: translate(75%, -85%) rotate(45deg);
  border-color: transparent var(--green) var(--green) transparent;
}
.container2 form .check input:checked + label:hover {
  color: var(--green);
  opacity: 0.5;
}
.container2 form .check input + label:hover::before {
  border-color: var(--green);
}
.container2 form .check input:checked + label:hover::before {
  border-color: transparent var(--green) var(--green) transparent;
  opacity: 0.5;
}
.container2 form .check input + label:hover {
  color: var(--green);
}
.container2 form button {
  align-self: flex-end;
  width: 100px;
  height: 30px;
  background: transparent;
  position: relative;
  font-size: 1rem;
  border: none;
  transition-duration: 300ms;
  font-weight: 700;
  border: 1px solid var(--green);
  color: white;
  z-index: 1;
  border-radius: 2rem;
  animation: neon 2s infinite linear;
  margin-bottom: 10px;
}


.container2 form button:focus,
.container2 form button:hover {
  background: var(--green);
  border: none;
  outline: 1px solid var(--green);
  color: white;
  animation: none;
  box-shadow: 0 0 20px 10px #36e2ec;
}
@keyframes neon {
  0% {
    background-color: var(--green);
    box-shadow: 0 0 20px 10px #36e2ec;
  }
  5% {
    background-color: transparent;
  }
  10% {
    background-color: var(--green);
  }
  15% {
    background-color: transparent;
  }
  20% {
    background-color: var(--green);
  }
  25% {
    background-color: transparent;
  }
}
        
        
        
        </style>
    <style type="text/css">
    @import url("https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap");




.profile-box{

                    text-align: center;
                    /* padding: 10px 90px; */
                    
                    margin-bottom: 20px;    
                    
                    
                    height:100px;
            width: 100px;
            position: relative;
            border-radius: 50%;
            overflow: hidden;
            border: 1px solid grey;  
                }

                .profile-pic{
                    height: 100%;
            width: 100%;

                }

                #profile{
                    display: none;

                }

                #uploadBtn{
                    height: 30px;
                    width: 100%;
                    position: absolute;
                    bottom: 0;
                    margin-bottom: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    text-align: top center;
                    background: rgba(0, 0, 0, 0.7);
                    color:#fff;
                    line-height: 30px;
                    font-family: sans-serif;
                    font-size: 10px;
                    cursor: pointer;
                    display: none;
                }





    </style>
</head>
<body style="margin-top:30px;">

 <header>
        <div class="song_side">
            <div class="content" style="margin-top:-130px;margin-left:-160px;">
                <!-- ... Votre contenu HTML ... -->
                <div class="wrapper">
                    <div class="profile-top">
                        <div class="profile-image"></div>
                    </div>
                    <div class="profile-bottom">
                        <div class="profile-infos">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-2 ml-6">
                                        <div class="container">
                                            <div class="container2">
                                                
                                                <form action="AjouterContact" method="POST"  enctype="multipart/form-data">
                                           
                                                    <div class="profile-box">
                                                        <img src="Contact/images/default.jpg" alt="" class="profile-pic">
                                                        <input type="file"  name="photo" id="profile">
                                                        <label for="profile" id="uploadBtn">Choose photo</label>
                                                    </div>
                                                    <div class="row">
                                                        <div class="t-input inline-input">
                                                            <input id="nom" type="text" name="nom" required autofocus placeholder=".">
                                                            <label for="nom">Nom</label>
                                                            <div class="b-line"></div>
                                                        </div>
                                                        
                                                        <div class="t-input inline-input">
                                                            <input id="prenom" type="text" name="prenom" required placeholder=".">
                                                            <label for="prenom">Prenom</label>
                                                            <div class="b-line"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="t-input inline-input">
                                                            <input id="email" type="email" name="email" required autofocus placeholder=".">
                                                            <label for="email">Email</label>
                                                            <div class="b-line"></div>
                                                        </div>
                                                        <div class="t-input inline-input">
                                                            <input id="tel" type="text" name="tel"  required placeholder=".">
                                                            <label for="tel">Numero de telephone</label>
                                                            <div class="b-line"></div>
                                                        </div>
                                                    </div>
                                                
                                                  
                                                    <div class="row" style="width:77%;" >
                                                        <div  class="t-input inline-input">
                                                            <input  id="adresse" type="text" name="adresse"  required placeholder=".">
                                                            <label for="adresse">Adresse</label>
                                                            <div class="b-line"></div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div>
                                                    
                                                         <button type="submit"  >Ajouter</button>
                                                    </div>
                                                    
                                                   
                                                </form>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
 
  
   
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js" ></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script>
        //declearing html elements
			
			const imgDiv = document.querySelector('.profile-box');
			const img = document.querySelector('.profile-pic');
			const file = document.querySelector('#profile');
			const uploadBtn = document.querySelector('#uploadBtn');
			
			//if user hover on img div 
			
			imgDiv.addEventListener('mouseenter', function(){
			    uploadBtn.style.display = "block";
			});
			
			//if we hover out from img div
			
			imgDiv.addEventListener('mouseleave', function(){
			    uploadBtn.style.display = "none";
			});
			
			//lets work for image showing functionality when we choose an image to upload
			
			//when we choose a foto to upload
			
			file.addEventListener('change', function(){
			    //this refers to file
			    const choosedFile = this.files[0];
			
			    if (choosedFile) {
			
			        const reader = new FileReader(); //FileReader is a predefined function of JS
			
			        reader.addEventListener('load', function(){
			            img.setAttribute('src', reader.result);
			        });
			
			        reader.readAsDataURL(choosedFile);
			
			    }
			});
    </script>
</body>
</html>