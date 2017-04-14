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
        <li><a href="search.php">Normal Search</a></li>
        <li><a href="advsearch.php">Advanced Search</a></li>
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
	<?php  
		include 'connect_db.php';
		$conn=connect_db();

		$title = $_POST['title'];
		$author=$_POST['author'];
		$category=$_POST['category'];
		$year=$_POST['year'];

		$sql = "SELECT * FROM research_paper natural join written_by natural join author natural join correspond_to natural join category natural join key_map natural join words WHERE ";
		if($title == '' && $author == '' && $category == '' && $year == '') {
			die('Please enter some Information to find data from');
		}
		else{	
			if($title != ''){
				$sql = $sql."r_name LIKE '%$title%' AND ";
			}
			if($author != ''){
				$sql = $sql."a_name LIKE '%$author%' AND ";
			}
			if($category != ''){
				$sql = $sql."c_name LIKE '%$category%' AND  ";
			}
			if($year != ''){
				$sql = $sql."r_year = $year AND  ";
			}
			$sql = $sql."1 ";
			$sql = $sql."ORDER BY r_year desc, r_name, a_name ;";
		}
		//echo $sql;
		if ($result=mysqli_query($conn,$sql)){
		echo "<ul>";
			while ($obj=mysqli_fetch_object($result)){
				$linktopaper = "http://dx.doi.org/".$obj->r_doi;				
				echo "				  
		<li> <h1><a href=$linktopaper>$obj->r_name</a></h1>		
			<ul>
			  <li>Written by: $obj->a_name
				 <ul>
					<li>author-id: $obj->a_id</li>
					<li>email-id: $obj->a_email</li>
				</ul> 
			  </li>
			  <li>Category: $obj->c_name</li>
			  <li>Published in $obj->r_year</li>
			</ul>
		</li>  
			";
			}
		echo "</ul>";
			mysqli_free_result($result);
		}

		mysqli_close($conn);
	?>
	<center> <button class="button" onclick="location='advsearch.php'">Search again</button> <center>
      </section>
    </div>
  </div>
</div>

</body>
</html>
