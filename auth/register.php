<?php
$page_title = "Registrarse";
include_once 'partials/headers.php';

?>
<?php

//procesar formulario
if(isset($_POST['registroBtn'])){


    //initialize an array to store any error message from the form
    $form_errors = array();

    //Form validation
    $required_fields = array('email', 'username', 'password', 'confirm_password');

    //call the function to check empty field and merge the return data into form_error array
    $form_errors = array_merge($form_errors, check_empty_fields($required_fields));

    //Fields that requires checking for minimum length
    $fields_to_check_length = array('username' => 4, 'password' => 6);

    //call the function to check minimum required length and merge the return data into form_error array
    $form_errors = array_merge($form_errors, check_min_length($fields_to_check_length));

    //email validation / merge the return data into form_error array
    $form_errors = array_merge($form_errors, check_email($_POST));

    //collect form data and store in variables
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $password2 = $_POST['confirm_password'];

    if(checkDuplicateEntries("propietarios","username",$username,$db)){
        $result = flashMessage("Usuario ya existe en la base de datos");
    }
    else if(checkDuplicateEntries("propietarios","email",$email,$db)){
        $result = flashMessage("Email ya existe en la base de datos");
    } 
    else if($password != $password2){
           
        $result = flashMessage("Nueva contraseña y confirmar contraseña no coinciden");
    }

        //check if error array is empty, if yes process form data and insert record
       else if(empty($form_errors)){
            
    
            //hashing the password
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            try{
    
                //create SQL insert statement
                $sqlInsert = "INSERT INTO propietarios (username, email, password, join_date)
                  VALUES (:username, :email, :password, now())";
    
                //use PDO prepared to sanitize data
                $statement = $db->prepare($sqlInsert);
    
                //add the data into the database
                $statement->execute(array(':username' => $username, ':email' => $email, ':password' => $hashed_password));
    
                //check if one new row was created
                if($statement->rowCount() == 1){
                    
                    $result = flashMessage("Registro exitoso","Pass");
                }
                
            }catch (PDOException $e){
                
                $result = flashMessage("Ah ocurrido un error: " .$e->getMessage());
                
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
        <h2>Registro</h2><hr>
        <div>
            <?php if(isset($result)) echo $result; ?>
            <?php if(!empty($form_errors)) echo show_errors($form_errors); ?>
        </div>
        <div class="clearfix"></div>

        <form action="" method="post">
            <div class="form-group">
                <label for="emailField">Correo</label>
                <input type="text" class="form-control" name="email" id="emailField" placeholder="Email">
            </div>

            <div class="form-group">
                <label for="usernameField">Usuario</label>
                <input type="text" class="form-control" name="username" id="usernameField" placeholder="Usuario">
            </div>
            <div class="form-group">
                <label for="passwordField">Contraseña</label>
                <input type="password" name="password" class="form-control" id="passwordField" placeholder="Contraseña">
            </div>
            <div class="form-group">
                <label for="passwordField">Confirmar Contraseña</label>
                <input type="password" name="confirm_password" class="form-control" id="passwordField" placeholder="Confirmar contraseña">
            </div>
            
            <button type="submit" name="registroBtn" class="btn btn-primary float-right">Registrarse</button>
        </form>
    </section>
    
</div>
<?php include_once 'partials/footers.php'; ?>
</body>
</html>