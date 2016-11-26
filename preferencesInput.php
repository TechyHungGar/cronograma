<?php
	session_start();
	$user = $_SESSION['id'];
	$username = $_SESSION['use'];	

	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";	
	$constraints = $_POST["selection"];	
	
	$conn = new mysqli($servername, $username, $password, $dbname);		
		
	if(count($constraints) == 2){
	}
	else
	{		
		if($constraints[2] == "Remove All Contstraints")
		{
			$sql = "DELETE FROM preferences WHERE studentID = $user";					
			$conn->query($sql);			
		}
		else
		{
			$day = $constraints[0];
			$start = $constraints[1];
			$end = $constraints[2];
			if($start == "" && $end == "")
			{
				$start = "08:00";
				$end = "23:00";
			}			
			
			$sql = "INSERT INTO preferences (studentID, day, courseName, type, start, end) VALUES ('$user', '$day', '0', 'noCourse', '$start', '$end')";
			$conn->query($sql);
			
		}		
		
	}
	
	
	
		
	
	header('Location: /cronograma/generateSchedule.php');
?>