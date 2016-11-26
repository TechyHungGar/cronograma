<?php
	session_start();
	$user = $_SESSION['id'];
	$username =  $_SESSION['use'];	
	echo $username. "<br>";	
	
	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";
	
		function conflictingDay($day1, $day2) {
				$mday1= str_replace("-","",$day1);
				$mday2 = str_replace("-","",$day2);
			
				similar_text($mday1,$mday2,$percent);
				if($percent == 0)
					return 0;
				else
					return 1;
		}
		
		function conflictingTime($schedStart, $schedEnd, $eligibalStart, $eligibalEnd) {				
				
				if($eligibalStart <= $schedEnd && $schedStart <= $eligibalEnd)
					return 1;				
				else
					return 0;
		}	
				
		
	
	$courseLoad = 5;
	$counter = 0;
	$numOfCourse = 0;

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);	

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	$sql = "DELETE FROM schedule WHERE studentID = $user";					
	$conn->query($sql);	
	
	/**** ADD CONSTRAINTS TO SCHEDULE ****/

	$sql = "SELECT * FROM preferences WHERE studentID = $user";					
	$prefs = $conn->query($sql);
	
	if($prefs->num_rows > 0)
		{
			while($row = $prefs->fetch_assoc())
			{
				$dayTime = $row["day"];
				$startTime = $row["start"];
				$endTime = $row["end"];				
				$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end) VALUES ('$user', '$dayTime', '1001', 'PREF', '$startTime', '$endTime')";
				$conn->query($sql);
			}
		}
	
	/**********FIND COURSES ELIGIBAL TO TAKE*********/
	$sql = "SELECT * FROM courselist";
	$courseList = $conn->query($sql);

	// output data of each row
	while($row = $courseList->fetch_assoc()) 
	{
		$testcourse = $row["id"];
		
		$sql = "SELECT * FROM courserequisites WHERE courseID = $testcourse";
		$courseReqs = $conn->query($sql);
		
		if($courseReqs->num_rows > 0)
		{
			while($reqRow = $courseReqs->fetch_assoc())
			{
				$isCourseCompleted = $reqRow["reqID"];					
				
				$sql = "SELECT * FROM completecourses WHERE studentID = $user AND courseID = $isCourseCompleted";
				$doneCourses = $conn->query($sql);						
				
				if($doneCourses->num_rows > 0)
				{
					$eligibalCourse =$row["id"];
					$sql = "SELECT * FROM completecourses WHERE studentID = $user AND courseID = $eligibalCourse";
					$checkCourses = $conn->query($sql);						
				
					if($checkCourses->num_rows > 0)
					{							
					}
					else
					{
						$eligibal[$counter] = $row["id"];
						echo $eligibal[$counter]. "<br>";
						$counter++;
					}
				}					  
				
			}
		}	
		else
		{
			$eligibalCourse =$row["id"];				
			$sql = "SELECT * FROM completecourses WHERE studentID = $user AND courseID = $eligibalCourse";
			$checkCourses = $conn->query($sql);						
		
			if($checkCourses->num_rows > 0)
			{							
			}
			else
			{
				if($row["id"] != '100' && $row["id"] != '101')
				{
					$eligibal[$counter] = $row["id"];
					echo $eligibal[$counter]. "<br>";
					$counter++;
				}
			}
		}
		
				
	} 		
	
	
	/************FIND CONFLICTS WITH SCHEDULE AND CONSTRAINTS*********/
	
	$numOfCourse =0;
	echo "counter ->". $counter. "<br>";
	for($x = 0; $x <= $counter; $x++)
	{
		$noLec = false;
		$noTut = false;
		$noLab = false;
		$addLec = false;
		$addTut = false;		
		
		$sql = "SELECT * FROM courseinfo WHERE course_id= $eligibal[$x] AND courseType = 'Lec'";
		$courseLecInfo = $conn->query($sql);
		
		$sql = "SELECT * FROM courseinfo WHERE course_id= $eligibal[$x] AND courseType = 'Tut'";
		$courseTutInfo = $conn->query($sql);
		
		$sql = "SELECT * FROM courseinfo WHERE course_id= $eligibal[$x] AND courseType = 'Lab'";
		$courseLabInfo = $conn->query($sql);
		
		//check if course has no lec
		if($courseLecInfo->num_rows == 0)
			$noLec = true;
		
		//check if course has no tut
		if($courseTutInfo->num_rows == 0)
			$noTut = true;
		
		//check if course has no lab
		if($courseLabInfo->num_rows == 0)
			$noLab = true;
		
		//LECTURES		
		while($noLec == false && $courseLecInfoRow = $courseLecInfo->fetch_assoc())
		{	
			$conflict = false;
			$dayString = str_replace("-","",$courseLecInfoRow["day"]);				
			for($z = 0; $z < strlen($dayString); $z++)
			{
				$startTime = $courseLecInfoRow["start"];
				$endTime = $courseLecInfoRow["end"];
				$day = $dayString[$z];
				$sql = "SELECT * FROM schedule WHERE day = '$day' AND 
						((CAST(start as time) <= '$startTime' AND CAST(end as time) > '$startTime') or 
						(CAST(start as time) < '$endTime' AND CAST(end as time) >= '$endTime'))";
				$schedule = $conn->query($sql);	

				if($schedule->num_rows > 0)
				{
					$conflict = true;
					break;
				}				
			}
			if($conflict == false)
			{
				$addLec = true;
				break;
			}
		}
		
		if($addLec == true)
		{
			//Seperate course day, into single days for easy schedule reading
			$dayString = str_replace("-","",$courseLecInfoRow["day"]);				
			for($y = 0; $y < strlen($dayString); $y++)
			{
				$dayChar = $dayString[$y];
				$courseID = $courseLecInfoRow["id"];
				$startTime = $courseLecInfoRow["start"];
				$endTime = $courseLecInfoRow["end"];
				$type = $courseLecInfoRow["courseType"];
				$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end) VALUES ('$user', '$dayChar', '$courseID', '$type', '$startTime', '$endTime')";
				$conn->query($sql);				
			}
			$numOfCourse++;
			echo " added <br>";
		}
		else if($noLec == false)
		{
				goto skip;
		}
		
		//TUTORIALS
		while($noTut == false && $courseTutInfoRow = $courseTutInfo->fetch_assoc())
		{	
			$conflict = false;
			$dayString = str_replace("-","",$courseTutInfoRow["day"]);				
			for($z = 0; $z < strlen($dayString); $z++)
			{
				$startTime = $courseTutInfoRow["start"];
				$endTime = $courseTutInfoRow["end"];
				$day = $dayString[$z];
				$sql = "SELECT * FROM schedule WHERE day = '$day' AND 
						((CAST(start as time) <= '$startTime' AND CAST(end as time) > '$startTime') or 
						(CAST(start as time) < '$endTime' AND CAST(end as time) >= '$endTime'))";
				$schedule = $conn->query($sql);	

				if($schedule->num_rows > 0)
				{
					$conflict = true;
					break;
				}				
			}
			if($conflict == false)
			{
				$addTut = true;
				break;
			}
		}		
		
		if($addTut == true )
		{
			//Seperate course day, into single days for easy schedule reading
			$dayString = str_replace("-","",$courseTutInfoRow["day"]);				
			for($y = 0; $y < strlen($dayString); $y++)
			{
				$dayChar = $dayString[$y];
				$courseID = $courseTutInfoRow["id"];
				$startTime = $courseTutInfoRow["start"];
				$endTime = $courseTutInfoRow["end"];
				$type = $courseTutInfoRow["courseType"];
				$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end) VALUES ('$user', '$dayChar', '$courseID', '$type', '$startTime', '$endTime')";
				$conn->query($sql);				
			}			
			echo " added <br>";
		}	
	
		if($numOfCourse == 5)
			break;
		
		skip:
		
	}
						
	header('Location: /cronograma/home.php');
      
		

?>