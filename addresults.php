<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Research Catalouge</title>
<meta charset="iso-8859-1">
<link rel="stylesheet" href="styles/layout.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
        <li><a href="advsearch.php">Advanced Search</a></li>
        <li><a href="add_papers.php">Add Paper</a></li>
        <li class="last"><a href="logout.php">Log out</a></li>
      </ul>
    </nav>
  </header>
</div>

<div class="wrapper row2">
  <div id="container" class="clear">
    <div id="intro">
      <section class="clear">
	<?php
    @session_start();
    if ((@session_status() != PHP_SESSION_ACTIVE) || !(isset($_SESSION['token']))){
      header("Location:index.php");
      exit;
    }

    $category = $_POST['keyword'];
    $num = $_POST['num_papers'];
    $cmd = "/usr/bin/python3 /var/www/html/research_catalogue/db_populate.py ". escapeshellarg($category) . " " . escapeshellarg($num);
    $c = escapeshellcmd($cmd);
    $output = exec($c);
    echo $output;
    $resultData = json_decode($output, true);
    var_dump($resultData);

	?>
	<center> <a href='add_papers.php' class='w3-button w3-brown w3-hover-black'>Add More</a> <center>
      </section>
    </div>
  </div>
</div>

</body>
</html>
