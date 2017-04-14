<?php
@session_start();
if ((@session_status() != PHP_SESSION_ACTIVE) || !(isset($_SESSION['token']))){
  header("Location:index.php");
  exit;
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Research Catalouge</title>
<meta charset="iso-8859-1">
<link rel="stylesheet" href="styles/layout.css" type="text/css">
<!--[if lt IE 9]><script src="scripts/html5shiv.js"></script><![endif]-->
<style>
.button {
    background-color: #555555; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
label{
    display:inline-block;
    width:100px;
}
li{
    color:#555555;
    font-size: 15px;
}
</style>

</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear">
    <div id="hgroup">
      <h1><a href="#">Research Catalouge</a></h1>
    </div>

    <nav>
      <ul>
        <li><a href="simple_search.php">Normal Search</a></li>
        <li><a href="#">Advanced Search</a></li>
        <li><a href="#">Make entry</a></li>
        <li class="last"><a href="#">Log out</a></li>
      </ul>
    </nav>
  </header>
</div>

<div class="wrapper row2">
  <div id="container" class="clear">
    <div id="intro">
      <section class="clear">
        <!-- article 1 -->
  <header id="header" class="clear">
	<div id="hgroup">

	<h1><b> Advanced Search</b></h1><br></br>
	</div>
  </header>
		<form action="advresult.php" method="post" >
		<label>Paper Title</label>: <input type="text" name="title"><br></br>
		<label>Author </label>: <input type="text" name="author"><br></br>
		<label>Category </label>: <input type="text" name="category"><br></br>
		<label>Year of Publication </label>: <input type="text" name="year"><br></br>
		<input type="submit" class="button">
		</form>
      </section>
    </div>
  </div>
</div>

</body>
</html>
