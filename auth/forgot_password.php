<?php
$page_title = "cambiar contraseña";
include_once 'partials/headers.php';

?>
<?php


//process the form if the reset password button is clicked
if(isset($_POST['passwordResetBtn'])){
    //initialize an array to store any error message from the form
    $form_errors = array();

    //Form validation
    $required_fields = array('email', 'new_password', 'confirm_password');

    //call the function to check empty field and merge the return data into form_error array
    $form_errors = array_merge($form_errors, check_empty_fields($required_fields));

    //Fields that requires checking for minimum length
    $fields_to_check_length = array('new_password' => 6, 'confirm_password' => 6);

    //call the function to check minimum required length and merge the return data into form_error array
    $form_errors = array_merge($form_errors, check_min_length($fields_to_check_length));

    //email validation / merge the return data into form_error array
    $form_errors = array_merge($form_errors, check_email($_POST));

    //check if error array is empty, if yes process form data and insert record
    if(empty($form_errors)){
        //collect form data and store in variables
        $email = $_POST['email'];
        $password1 = $_POST['new_password'];
        $password2 = $_POST['confirm_password'];

        //check if new password and confirm password is same
        if($password1 != $password2){
           
            $result = flashMessage("Nueva contraseña y confirmar contraseña no coinciden");
        }else{
            try{
                //create SQL select statement to verify if email address input exist in the database
                $sqlQuery = "SELECT email FROM propietarios WHERE email =:email";

                //use PDO prepared to sanitize data
                $statement = $db->prepare($sqlQuery);

                //execute the query
                $statement->execute(array(':email' => $email));

                //check if record exist
                if($statement->rowCount() == 1){
                    //hash the password
                    $hashed_password = password_hash($password1, PASSWORD_DEFAULT);

                    //SQL statement to update password
                    $sqlUpdate = "UPDATE propietarios SET password =:password WHERE email=:email";

                    //use PDO prepared to sanitize SQL statement
                    $statement = $db->prepare($sqlUpdate);

                    //execute the statement
                    $statement->execute(array(':password' => $hashed_password, ':email' => $email));

                    
                    $result = flashMessage("Cambio de contraseña exitoso","Pass");
                }
                else{
                    
                    $result = flashMessage("El correo ingresado no existe en la base de datos, intenta con otro");
                }
            }catch (PDOException $ex){
                
                $result = flashMessage("Ah ocurrido un error: " .$ex->getMessage());
            }
        }
    }
    else{
        if(count($form_errors) == 1){
            
            $result = flashMessage("Hubo un error en el formulario<br>");
        }else{
            
            $result = flashMessage("Hubieron " .count($form_errors). " errores en el formulario <br>");
        }
    }
}
?>


<div class="container">
    <section class="col col-lg-7">
        <h2>Cambiar contraseña</h2><hr>

        <div>
            <?php if(isset($result)) echo $result; ?>
            <?php if(!empty($form_errors)) echo show_errors($form_errors); ?>
        </div>
        <div class="clearfix"></div>
        <form action="" method="post">
            <div class="form-group">
                <label for="emailField">Correo</label>
                <input type="text" name="email" class="form-control" id="emailField" placeholder="email">
            </div>


            <div class="form-group">
                <label for="passwordField">Nueva Contraseña</label>
                <input type="password" name="new_password" class="form-control" id="passwordField" placeholder="Nueva contraseña">
            </div>

            <div class="form-group">
                <label for="passwordField">Confirmar Contraseña</label>
                <input type="password" name="confirm_password" class="form-control" id="passwordField" placeholder="Confirmar contraseña">
            </div>
            
            <button type="submit" name="passwordResetBtn" class="btn btn-primary float-right">Guardar Contraseña</button>
        </form>
    </section>
    
</div>
<?php include_once 'partials/footers.php'; ?>
</body>
</html>