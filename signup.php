<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Sign-up</title>


  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="css/style.css">


</head>

<body>
  <div class="login-wrap">
	<div class="login-html">

	<div class="group">
	<?php
    @session_start();
    if ((@session_status() == PHP_SESSION_ACTIVE) && isset($_SESSION['token'])){
      echo '<h2 align="center"><font size="3" color="red">User already logged in!</font></h2>';
      header("Location:simple_search.php");
      exit;
    }

		include 'connect_db.php';
		$conn=connect_db();
		$fn=$_POST['firstname'];
		$ln=$_POST['lastname'];
		$un=$_POST['username'];
		$pswd = hash("sha256", $_POST['pswd']);
		$emailid=$_POST['emailid'];
		if ($fn != '' && $ln != '' && $un != '' && $pswd != '' && $emailid != ''){
			$sql = "INSERT INTO users (firstname, lastname, username, password, email)
			VALUES ('$fn', '$ln', '$un', '$pswd', '$emailid')";

			if (mysqli_query($conn, $sql)) {
			    echo '<h2 align="center"><font size="3" color="white">New record created successfully</font></h2>';
          @session_destroy();
          @session_start();
          $_SESSION = array();
          $_SESSION['token'] = $un;
          header("Location:simple_search.php");
      		exit;
			}
			else {
			    echo '<h2 align="center"><font size="3" color="white">Error: Try using different username</font></h2>';
			}
		}
		else{
			echo '<h2 align="center"><font size="3" color="white">All fields are necessary in the form</font></h2>';
			}
		mysqli_close($conn);
	?>
	<div class="login-form">
		<div class="group">
			<input type="button" value="Return to Login Page" onclick="location='index.php'" class="button" />
		</div>
	</div>

	</div>
	</div>
</div>


</body>
</html>
