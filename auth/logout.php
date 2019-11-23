<?php include_once 'db/session.php';

session_destroy();
header('location: index.php');