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
		include 'connect_db.php';
		$conn=connect_db();
		
		$un=$_POST['username'];
		$pswd=$_POST['password'];
		$sql = "SELECT * FROM users WHERE username = '$un'";
		$retval = mysqli_query($conn, $sql);
		if(! $retval ) {
			die('Could not get data: ' . mysqli_error());
		}
		
		$obj=mysqli_fetch_object($retval);
		if($obj->password == $pswd){
			header("Location:search.php");
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
