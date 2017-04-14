<?php
@session_start();
if ((@session_status() != PHP_SESSION_ACTIVE) || !(isset($_SESSION['token']))){
  header("Location:index.php");
  exit;
}
if (isset($_SESSION)){
  unset($_SESSION);
}
@session_destroy();
header("Location:index.php");
exit;
?>
