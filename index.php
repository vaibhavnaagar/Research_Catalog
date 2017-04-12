<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Day 001 Login Form</title>
  
  
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
		      <form action = "login.php" method = "POST">
			 <p> </p><label for="user" class="label">Username</label> <input type = "text" name = "Username" class="input"/>
			 <p> </p><label for="user" class="label">Password</label> <input type = "text" name = "Password" class="input" />
			  <p> </p><input type = "submit" value="Sign-in" class="button"/>
		      </form>
			</div>
		</div>

		<div class="sign-up-htm">
			<div class="group">
			<form action = "signup.php" method = "POST">
			 <p> </p><label for="user" class="label">Username</label> <input type = "text" name = "Username" class="input"/>
			 <p> </p><label for="user" class="label">Password</label> <input type = "password" name = "Password" class="input" data-type="password"/>
			 <p> </p><label for="user" class="label">Repeat-Password</label> <input type = "password" name = "Password" class="input" data-type="password"/>
			 <p> </p><label for="user" class="label">Email-id</label> <input type = "text" name = "Email" class="input"/>
			 
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
