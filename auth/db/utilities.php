<?php
 
function check_empty_fields($required_fields_array){
    //initialize an array to store error messages
    $form_errors = array();

    //loop through the required fields array snd popular the form error array
    foreach($required_fields_array as $name_of_field){
        if(!isset($_POST[$name_of_field]) || $_POST[$name_of_field] == NULL){
            $form_errors[] = $name_of_field . " es un campo obligatorio";
        }
    }

    return $form_errors;
}

 
function check_min_length($fields_to_check_length){
    //initialize an array to store error messages
    $form_errors = array();

    foreach($fields_to_check_length as $name_of_field => $minimum_length_required){
        if(strlen(trim($_POST[$name_of_field])) < $minimum_length_required){
            $form_errors[] = $name_of_field . " debe de tener minimo {$minimum_length_required} caracteres";
        }
    }
    return $form_errors;
}

 
function check_email($data){
    //initialize an array to store error messages
    $form_errors = array();
    $key = 'email';
    //check if the key email exist in data array
    if(array_key_exists($key, $data)){

        //check if the email field has a value
        if($_POST[$key] != null){

            // Remove all illegal characters from email
            $key = filter_var($key, FILTER_SANITIZE_EMAIL);

            //check if input is a valid email address
            if(filter_var($_POST[$key], FILTER_VALIDATE_EMAIL) === false){
                $form_errors[] = $key . " no es un correo valido";
            }
        }
    }
    return $form_errors;
}


function show_errors($form_errors_array){
    $errors = "<p><ul style='color: red;'>";

    //loop through error array and display all items in a list
    foreach($form_errors_array as $the_error){
        $errors .= "<li> {$the_error} </li>";
    }
    $errors .= "</ul></p>";
    return $errors;
}

function flashMessage($message, $passOrFail = "Fail"){
    if($passOrFail === "Pass"){
        $data = "<div class='alert alert-success'>{$message}</p>";
    }else{
        $data = "<div class='alert alert-danger'>{$message}</p>";
    }

    return $data;
}

function checkDuplicateEntries($table, $column_name, $value, $db){
    try{
        $sqlQuery = "SELECT * FROM $table WHERE $column_name=:$column_name";
        $statement = $db->prepare($sqlQuery);  
        $statement->execute(array(":$column_name" => $value));

        if($row = $statement->fetch()){
            return true;
        }
        return false;
    }catch (PDOException $ex){
        //handle exception
    }
}