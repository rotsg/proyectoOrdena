<?php
$page_title = "Iniciar sesión";
include_once 'partials/headers.php';

?>
<?php
if(isset($_POST['loginBtn'])){
    //array to hold errors
    $form_errors = array();

//validate
    $required_fields = array('email', 'password');
    $form_errors = array_merge($form_errors, check_empty_fields($required_fields));

    if(empty($form_errors)){

        //collect form data
        $email = $_POST['email'];
        $password = $_POST['password'];

        //check if user exist in the database
        $sqlQuery = "SELECT * FROM propietarios WHERE email = :email";
        $statement = $db->prepare($sqlQuery);
        $res = $statement->execute(array(':email' => $email));

        
        if($statement->rowCount() == 0){
            $result = flashMessage("Usuario no existe");

        }

       while($row = $statement->fetch()){
           $id = $row['id'];
           $hashed_password = $row['password'];
           $username = $row['username'];
           
           
           if(password_verify($password, $hashed_password)){
               $_SESSION['id'] = $id;
               $_SESSION['username'] = $username;
               header("location: index.php");
           }else{
               
               $result = flashMessage("Correo y/o contraseña invalido/s");
           }
       }
    

    }else{
        if(count($form_errors) == 1){
            $result = flashMessage("Hubo un error en el formulario<br>");
            
        }else{
            $result = flashMessage("Hubieron " .count($form_errors). " errores en el formulario <br>");
        }
    }
}
?>

<div class="container">
    <section class="col-lg-7">
        <h2>Iniciar sesión</h2><hr>
        <div>
        <?php if(isset($result)) echo $result; ?>
        <?php if(!empty($form_errors)) echo show_errors($form_errors); ?>
        </div>
        <div class="clearfix"></div>
            <form action="" method="post">
                <!-- <div class="form-group">
                    <label for="usernameField">Usuario</label>
                    <input type="text" class="form-control" name="username" id="usernameField" placeholder="Username">
                </div> -->
                <div class="form-group">
                    <label for="emailField">Correo</label>
                    <input type="text" class="form-control" name="email" id="emailField" placeholder="Correo">
                </div>
                <div class="form-group">
                    <label for="passwordField">contraseña</label>
                    <input type="password" name="password" class="form-control" id="passwordField" placeholder="Password">
                </div>
    
                
                <a  href="forgot_password.php">¿Olvidaste tu contraseña?</a>
                <button type="submit" name="loginBtn" class="btn btn-primary float-right">iniciar sesión</button>
               
            </form>
    </section>
    
</div>

<?php include_once 'partials/footers.php'; ?>
</body>
</html>