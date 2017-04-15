<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Research Catalouge- Sign-up</title>

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

		$un=$_POST['username'];
		$pswd=hash("sha256", $_POST['password']);
		$sql = "SELECT * FROM users WHERE username = '$un'";
		$retval = mysqli_query($conn, $sql);
		if(! $retval ) {
			die('Could not get data: ' . mysqli_error());
		}

		$obj=mysqli_fetch_object($retval);
		if($obj->password == $pswd){
		      if ((session_status() == PHP_SESSION_ACTIVE) && (array_key_exists('token', $_SESSION)) && ($_SESSION['token'] == $un))
			echo '<h2 align="center"><font size="3" color="red">User already logged in!</font></h2>';
		      else{
			@session_destroy();
			@session_start();
			$_SESSION = array();
			$_SESSION['token'] = $un;
		      }
			header("Location:simple_search.php");
  			exit;
		}
		else{	
			echo '<h2 align="center"><font size="3" color="red">Username or Password incorrect</font></h2>';
		}
		mysqli_close($conn);
	?>
	<div class="login-form">
		<div class="group">
			<input type="button" value="Try again" onclick="location='index.php'" class="button" />
		</div>
	</div>

	</div>
	</div>
</div>

</body>
</html>
