<?php
$hostname='localhost';
$username='root';
$password='';




try {
    $db = new PDO("mysql:host=$hostname;dbname=ordena",$username,$password);
     
     $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
 
}catch(PDOException $e)
    {
    echo $e->getMessage();
    }

?>