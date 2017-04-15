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
li{
    color:#555555;
    font-size: 15px;
}
section {
  margin-bottom: 60px;
  padding: 30px;
  background-color: #efefef;
}
section:last-child {
  margin-bottom: 0;
}
input[type="text"] {
  display: block;
  margin: 0;
  width: 100%;
  font-family: "Open Sans", sans-serif;
  font-size: 18px;
}
ul.input-list {
  list-style: none;
  margin: 0 -10px;
  padding: 10;
}
ul.input-list li {
  display: block;
  padding: 0 10px;
  width: 50%;
  float: left;
}
.style-1 input[type="text"] {
  padding: 10px;
  border: solid 1px gainsboro;
  box-shadow: 0 1px 2px rgba(0,0,0,0.15);
  transition: all 600ms ease-in;
}
input[type="submit"]:hover{
  box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
  color: #383636;
  background: #e0d7d7;
}
/* clear floated divs */
.clearfix:after {
  content: "";
  display: table;
  clear: both;
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
        <li><a href="#">Normal Search</a></li>
        <li><a href="advsearch.php">Advanced Search</a></li>
        <li><a href="#">Add Paper</a></li>
        <li class="last"><a href="logout.php">Log out</a></li>
      </ul>
    </nav>
  </header>
</div>

<div class="wrapper row2">
  <div id="container" class="clear">
    <div id="intro">
      <!--section class="clear"-->
        <!-- article 1 -->
  <section class="clear">
  <!--header id="header" class="clear"-->
	<div id="hgroup">

	<h1 style="text-align:center;font-size:36px;font-style:normal;"><b>Insert a keyword to search for</b></h1><br></br>
	</div>
  <!--/header-->
		<form action="searchresult.php" method="post" >


      <ul class="input-list style-1 clearfix">
        <li>
        <h3>Find :</h3>  <input type="text" placeholder=""  name="keytofind" required>
        </li>
        <li>
        <input type="submit" class="button" value="Search">
      </li>
      </ul>
    <br/>
		</form>

  </section>

      <!--/section-->
    </div>
  </div>
</div>

</body>
</html>
