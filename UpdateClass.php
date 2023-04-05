<html lang="en">
<head>
    <link rel = "stylesheet" href = "style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Primary School Database</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: lightslategray;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
    <hr>
    <hr>
    <h1 style = "text-align: center;">Rishton Primary School</h1>
    <hr>
    <hr>
    <div class="navbar">
      <a href="index.html">Home</a>
      <div class="dropdown">
          <button class="dropbtn">View
              <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
              <a href="ViewStudent.php">Student</a>
              <a href="ViewParent.php">Parent</a>
              <a href="ViewTeacher.php">Teacher</a>
              <a href="ViewClass.php">Class</a>
          </div>
      </div>
      <div class="dropdown">
          <button class="dropbtn">Add
              <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
              <a href="AddStudent.php">Student</a>
              <a href="AddParent.php">Parent</a>
              <a href="AddTeacher.php">Teacher</a>
              <a href="AddClass.php">Class</a>
          </div>
      </div>
      <div class="dropdown">
        <button class="dropbtn">Delete
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="delStudent.php">Student</a>
            <a href="delParent.php">Parent</a>
            <a href="delTeacher.php">Teacher</a>
            <a href="delClass.php">Class</a>
        </div>
    </div>
    <div class="dropdown">
      <button class="dropbtn">Update
          <i class="fa fa-caret-down"></i>
      </button>
      <div class="dropdown-content">
          <a href="Updatestudent.php">Student</a>
          <a href="UpdateParent.php">Parent</a>
          <a href="UpdateTeacher.php">Teacher</a>
          <a href="UpdateClass.php">Class</a>
      </div>
  </div>
  </div>
  </div>
  <hr>
	
	<h3>Update a Class</h3>

    <form method="post" action="UpdateClass.php">

        <input type="submit" name="submit">
        <br>

        <label>Class Name:</label>
		<input type="text" name="ClassName">
		<br>
	
		<label>Year group:</label>
		<input type="text" name="Year_Group">
		<br>
	
		<label>Capacity:</label>
		<input type="text" name="Capacity">

        <label>Select Class ID:</label>
        <br>
        <select name="ClassesID">
            <?php
            $link = mysqli_connect("sdb-58.hosting.stackcp.net", "student14-353031378cd1", "ua92-studentAc", "student14-353031378cd1");
            // Check connection
            if ($link === false) {
              die("Connection failed: ");
            }
            $sql = mysqli_query($link, "SELECT ClassesID, ClassName FROM Classes");
            while ($row = $sql->fetch_assoc()){
            echo "<option value='{$row['ClassesID']}'>{$row['ClassName']}</option>";
            }
            ?>
        </select>

	</form>
	
	<?php
    if (isset($_POST['submit'])) {
	
		  $ClassesID = $_POST['ClassesID'];
      $ClassName = $_POST['ClassName'];
      $Capacity = $_POST['Capacity'];
      $Year_Group = $_POST['Year_Group'];
		
		$sql = "UPDATE Classes SET ClassName = '$ClassName', Capacity = '$Capacity', 'Year_Group' = '$Year_Group' WHERE ClassesID = '$ClassesID'";
		if (mysqli_query($link, $sql)) {
		echo "New record Deleted successfully";
		} else {
		echo "Error deleting record ";
		}
	
	}
	
	$link->close();
	?>

<hr>
</body>
</html>