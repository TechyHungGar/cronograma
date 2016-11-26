<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
   body {
    background-color: #232322;
	}
   .img-rounded{
	    background-color: #ffffff;
   }
		
  </style>
</head>
<body>
<?php  session_start(); ?>  

<?php

if(isset($_POST['login']))   // it checks whether the user clicked login button or not 
{
     $user = $_POST['user'];
     $pass = $_POST['pass'];
	 
	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
} 
		

	$sql = "SELECT * FROM student WHERE id = '$user' AND password = '$pass'";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) 
	{
		// output data of each row
		while($row = $result->fetch_assoc()) 
		{
			$_SESSION['use'] = $row["name"];
			$_SESSION['id'] = $row["id"];
			$conn->close();
			 echo '<script type="text/javascript"> window.open("home.php","_self");</script>';          
				
		}		
	} 
	else 
	{ 
		echo "<div class='alert alert-danger'>
			<strong>Invalid StudentID or Password</strong> 
			</div>";
		goto form;
	}
	$conn->close();        

   
}
else {
form:
 ?>

<center><img src="capture.png"></center>

<div class="container">
<div class="well">

  <h2>LOGIN</h2>
  <form action="" method="POST">
    <div class="form-group">
      <label for="text">StudentID:</label>
      <input type="text" name="user" class="form-control" id="user" placeholder="Enter StudentID">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" name="pass" class="form-control" id="pass" placeholder="Enter Password">
    </div>   
    <button type="submit" name ="login" class="btn btn-default">Submit</button><br>	
  </form>
</div>
</div>


</body>
</html>


<?php
};
?>