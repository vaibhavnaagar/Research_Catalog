<?php

function connect_db(){
  $servername = "localhost";
  $db_username = "root";
  $db_password = "steinsgate";
  $db_name = "research_catalogue";

  $conn = mysqli_connect($servername, $db_username, $db_password, $db_name);

  // Check connection
  if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    die();
  }
  else {
    echo "Connection Established !";
    return $conn;
  }
}
connect_db();
?>
