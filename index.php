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
		echo "invalid student id or password";
		goto form;
	}
	$conn->close();        

   
}
else {
form:
 ?>
<html>
<head>

<title> Login Page   </title>

</head>

<body>

<form action="" method="post">

    <table width="200" border="0">
  <tr>
    <td>  StudentID </td>
    <td> <input type="text" name="user" > </td>
  </tr>
  <tr>
    <td> Password  </td>
    <td><input type="password" name="pass"></td>
  </tr>
  <tr>
    <td> <input type="submit" name="login" value="LOGIN"></td>
    <td></td>
  </tr>
</table>
</form>

</body>
</html>

<?php
};
?>