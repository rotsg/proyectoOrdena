<?php
$page_title = "Ordena";
include_once 'partials/headers.php';

?>

 
<div class="container">
     
    
<?php if(!isset($_SESSION['username'])): ?>
<P>No haz iniciado sesión <a href="login.php">Iniciar sesión</a> ¿Aún no te registras? <a href="register.php">Registrate</a> </P>
<?php else: ?>
<p>Haz iniciado sesión como <?php if(isset($_SESSION['username'])) echo $_SESSION['username']; ?> <a href="logout.php">Cerrar sesión</a> </p>
<?php endif ?>

</div>

<?php include_once 'partials/footers.php'; ?>

</body>
</html>

