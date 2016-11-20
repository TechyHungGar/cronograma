<?php
	session_start();
	$user = $_SESSION['id'];
	$username = $_SESSION['use'];	

	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";
	
	$conn = new mysqli($servername, $username, $password, $dbname);	
	$constraints = $_POST["selection"];
	
	$sql = "DELETE FROM preferences WHERE studentID = $user";
		$conn->query($sql);
	
	foreach($constraints as $check) 
	{
		$output = $output . $check;
	}
	
	$sql = "INSERT INTO preferences (studentID, day) VALUES ('$user', '$output')";
		$conn->query($sql);
		
	header('Location: /cronograma/generateSchedule.php');
?>