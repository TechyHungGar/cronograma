<?php
	session_start();
	$user = $_SESSION['id'];
	$username =  $_SESSION['use'];	
	echo $username. "<br>";	
	
	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";	
	
	$courseLoad = 5;	
	

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
	$numOfCourse =0;
	for($corelect = 0; $corelect < 2; $corelect++)
	{
		$counter = 0;
		if($corelect == 0)
			$sql = "SELECT DISTINCT  * FROM corecourses JOIN courselist ON courselist.id = corecourses.course_id";
		if($corelect == 1)
			$sql = "SELECT  * FROM electivecourses JOIN courselist ON courselist.id = electivecourses.course_id";
			
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
		
		echo "counter ->". $counter. "<br>";
		for($x = 0; $x <= $counter; $x++)
		{
			$noLec = false;
			$noTut = false;
			$noLab = false;
			$addLec = false;
			$addTut = false;
			$addLab = false;			
			$incremented = false;
			
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
							(CAST(start as time) < '$endTime' AND CAST(end as time) >= '$endTime') or
							((CAST(start as time) > '$startTime') AND CAST(end as time) < '$endTime'))";
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
							(CAST(start as time) < '$endTime' AND CAST(end as time) >= '$endTime') or 
							((CAST(start as time) > '$startTime') AND CAST(end as time) < '$endTime'))";
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
			
			//LABS
			while($noLab == false && $courseLabInfoRow = $courseLabInfo->fetch_assoc())
			{	
				$conflict = false;
				$dayString = str_replace("-","",$courseLabInfoRow["day"]);				
				for($z = 0; $z < strlen($dayString); $z++)
				{
					$startTime = $courseLabInfoRow["start"];
					$endTime = $courseLabInfoRow["end"];
					$day = $dayString[$z];
					$sql = "SELECT * FROM schedule WHERE day = '$day' AND 
							((CAST(start as time) <= '$startTime' AND CAST(end as time) > '$startTime') or 
							(CAST(start as time) < '$endTime' AND CAST(end as time) >= '$endTime') or
							((CAST(start as time) > '$startTime') AND CAST(end as time) < '$endTime'))";
					$schedule = $conn->query($sql);	

					if($schedule->num_rows > 0)
					{
						$conflict = true;
						break;
					}				
				}
				if($conflict == false)
				{
					$addLab = true;
					break;
				}
			}
			if($noLec == false && $addLec == false)
				goto skip;
			if($noTut == false && $addTut == false)
				goto skip;
			if($noLab == false && $addLab == false)
				goto skip;
			
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
				$incremented = true;
				echo " added <br>";
			}			
			
			if($addTut == true)
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
				if($incremented == false)
					$numOfCourse++;
				echo " added <br>";
			}
			
			if($addLab == true )
			{
				//Seperate course day, into single days for easy schedule reading
				$dayString = str_replace("-","",$courseLabInfoRow["day"]);				
				for($y = 0; $y < strlen($dayString); $y++)
				{
					$dayChar = $dayString[$y];
					$courseID = $courseLabInfoRow["id"];
					$startTime = $courseLabInfoRow["start"];
					$endTime = $courseLabInfoRow["end"];
					$type = $courseLabInfoRow["courseType"];
					$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end) VALUES ('$user', '$dayChar', '$courseID', '$type', '$startTime', '$endTime')";
					$conn->query($sql);				
				}
				if($incremented == false)
					$numOfCourse++;				
				echo " added <br>";				
			}	
			
			$sql = "SELECT DISTINCT courseinfo.code FROM `schedule` JOIN `courseinfo` ON courseName = courseinfo.id AND studentID = $user";
			$numOfCourses = $conn->query($sql);
			
			if($numOfCourses->num_rows == 5)
				break;
			skip:		
			
		}
		if($numOfCourses->num_rows == 5)
				break;
		
	}				
	header('Location: /cronograma/home.php');
      
		

?>