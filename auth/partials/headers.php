<?php include_once 'db/session.php' ?>
<?php include_once 'db/utilities.php';?>
<?php include_once 'db/database.php'?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/custom.css" >
    <title><?php if(isset($page_title)) echo $page_title?></title>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark navbar-static-top bg-dark">
  <a class="navbar-brand" href="#">Ordena</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item "><a class="nav-link" href="index.php">Inicio </a></li>
      <?php if(isset($_SESSION['username'])): ?>
      <li class="nav-item "><a class="nav-link" href="logout.php">Cerrar sesión</a></li>
      <?php else: ?>
      <li class="nav-item "><a class="nav-link" href="login.php">Iniciar sesión</a></li>
      <li class="nav-item "><a class="nav-link" href="register.php">Registrarse</a></li>
      <?php endif ?>   
    </ul>
    
  </div>
</nav>