<?php
@session_start();
if ((@session_status() == PHP_SESSION_ACTIVE) && isset($_SESSION['token'])){
  echo '<h2 align="center"><font size="3" color="red">User already logged in!</font></h2>';
  header("Location:simple_search.php");
  exit;
}
?>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Research Catalouge</title>


  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="css/style.css">


</head>

<body>
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
		<div class="sign-in-htm">
			<div class="group">
		      <form action = "login.php" method = "post">
          <label for="username" class="label">Username</label> <input type = "text" required id="username" name = "username" class="input"/>
     			<label for="password" class="label">Password</label> <input type = "password" required id="password" name = "password" class="input" />
			  <p> </p><input type = "submit" value="Sign-in" class="button"/>

		      </form>

			</div>
		</div>

		<div class="sign-up-htm">
			<div class="group">

			<form action = "signup.php" method = "post">
      <label for="firstname" class="label">First-Name</label> <input type = "text" required id="firstname" name = "firstname" class="input" value="<?php echo $firstname;?>"/>
			<label for="lastname" class="label">Last-name</label> <input type = "text" required id="lastname" name = "lastname" class="input" value="<?php echo $lastname;?>"/>
			<label for="newuser" class="label">Username</label> <input type = "text" required id="newuser" name = "username" class="input" value="<?php echo $usrnme;?>"/>
			<label for="newpasswd" class="label">Password</label> <input type = "password" required id="newpasswd" name = "pswd" class="input" data-type="password" value="<?php echo $pswd;?>"/>
			<label for="newid" class="label">Email-id</label> <input type = "text" id="newid" required name = "emailid" class="input" value="<?php echo $emailid;?>"/>
			<p> </p><input type = "submit" value="Sign-Up" class="button"/>
		      </form>
			</div>
			<div class="hr"></div>
			<div class="foot-lnk">
				<label for="tab-1">Already Member?</a>
			</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>
