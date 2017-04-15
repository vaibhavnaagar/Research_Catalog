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

		include 'connect_db.php';
		$conn=connect_db();

		$title = $_POST['title'];
		$author=$_POST['author'];
		$category=$_POST['category'];
		$year=$_POST['year'];

		$sql = "SELECT r_id,r_name,r_year,r_doi,r_pdf,c_name FROM research_paper natural join written_by natural join author natural join correspond_to natural join category natural join key_map natural join words WHERE ";
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
			$sql = $sql."  GROUP BY r_name,r_year,r_doi,r_pdf,c_name,r_id ORDER BY r_year desc, r_name ;";
		}
		//echo $sql;
		if ($result=mysqli_query($conn,$sql)){
      $count = 0;
		echo "<ul>";
			while ($obj=mysqli_fetch_object($result)){
				$linktopaper = "http://dx.doi.org/".$obj->r_doi;
				$sql2 = "SELECT a_name,a_id,a_institute FROM research_paper natural join written_by natural join author WHERE r_id = '$obj->r_id'";
				$result2=mysqli_query($conn,$sql2);
				echo "
		<li> <h1><a href=$linktopaper target='_blank'><b style='font-style:normal;'>".htmlspecialchars($obj->r_name)."</b></a></h1>
			<ul class='w3-ul w3-card-2'>
			  <li><b>Authors:</b><ul>";
        while ($obj2=mysqli_fetch_object($result2))
				{
          if ($obj2->a_institute)
          {
					echo "	<li> $obj2->a_name  (Institute: $obj2->a_institute)
							</li>" ;
          }
          else{
            echo "	<li> $obj2->a_name
  							</li>" ;
          }
				}
        $sql3 = "SELECT word FROM words natural join key_map  WHERE r_id = '$obj->r_id'";
        $result3=mysqli_query($conn,$sql3);
        $obj3=mysqli_fetch_object($result3);
  			echo" </ul></li>
  			  <li><b>Category:</b> $obj->c_name</li>
  			  <li><b>Published Year:</b> $obj->r_year</li>
          <script>var myvar$count = 'p_$count';</script>
          <li><button onclick='myFunction(myvar$count)' class='w3-btn w3-block w3-black w3-left-align'>View Summary</button>
          <div id='p_$count' class='w3-container w3-hide'>
            <p>$obj3->word</p>
          </div>
          </li>
          <li><a href='$obj->r_pdf' target='_blank' class='w3-button w3-black'>View PDF</a></li>
  			</ul>
  		</li>
			";
      $count++;
			}
		echo "</ul>";
    mysqli_free_result($result);
    mysqli_free_result($result2);
		mysqli_free_result($result3);
		}

		mysqli_close($conn);
	?>
	<center> <a href='advsearch.php' class='w3-button w3-brown w3-hover-black'>Search Again</a><center>
      </section>
    </div>
  </div>
</div>
<script>
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
</body>
</html>
