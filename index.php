<!DOCTYPE html>
<html lang="html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HNG: SlackBot</title>
    <link href="style.css" rel="stylesheet">
    <link href="assets/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
    body {
                margin: 0;
                padding: 0;
                overflow-x: hidden;
                font-family: "Lato", sans-serif !important;
              }
              
              .sidebar {
                margin: 0;
                padding: 0;
                 min-height: 555px !important;
                background-color: #f1f1f1;
              }
            
              .convo-section{
                  padding: 20px;
                  margin: 30px auto;
                  background: white;
                  border-radius: 10px;
              }
              .convo-section .icon-pack i.yellow{
                  color: #ffe921;
              }
            .convo-section .icon-pack i{
                  font-size: 16px;
              }
            
              .sidebar a {
                display: block;
                color: black;
                padding: 16px;
                text-decoration: none;
              }
               
              .sidebar a.active {
                background-color: rgb(109, 111, 212);
                color: white;
              }
              
              .sidebar a:hover:not(.active) {
                background-color: #555;
                color: white;
              }
              
              div.content {
                margin-left: 200px;
                padding: 1px 16px;
                height: 1000px;
              }
              .page-content {
                margin: 0;
                background-color: #e5e3e3;
                  min-height: 555px !important;
              
            
            }
            .navbar-brand{
                padding: 0 ;
                float: none ;
            }
            .input-group{
                width: 500px !important;
                display: inline-block;
            }
            
              
              @media screen and (max-width: 700px) {
                .sidebar {
                  width: 100%;
                  height: auto;
                  position: relative;
                }
                .sidebar a {float: left;}
                div.content {margin-left: 0;}
              }
              
              @media screen and (max-width: 400px) {
                .sidebar a {
                  text-align: center;
                  float: none;
                }
              }
              
</style>

</head>
<body>
    <header class="top-header" role="banner">
        <div class="navbar navbar-expand-lg">
            <div class="navbar-brand">
                <h2>StartNg-Contacts</h2>
            </div>

    </header>

        <div class="row">
            <div class="sidebar col-lg-2">
                <a class="active" href="#home">Dashboard</a>
                <a href="Profile.html">Profile Settings</a>
                <a href="contact.html">Contact Settings</a>
                <a href="signin.html">Log Out</a>
            </div>
            
            <div class="page-content col-lg-10  d-flex justify-content-center">
                <div class="col-sm-9">
                    <div class="p-5">
                        
                    </div>
                        <div class="container">
                               
