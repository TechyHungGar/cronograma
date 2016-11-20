<?php
		function conflictingDay($day1, $day2) {
				$mday1= str_replace("-","",$day1);
				$mday2 = str_replace("-","",$day2);
				
				if(similar_text($mday1,$mday2,$percent) > 0)
					return 1;
				else
					return 0;
		}
		
		function conflictingTime($schedStart, $schedEnd, $eligibalStart, $eligibalEnd) {		
				
				if($eligibalStart >= $schedStart && $eligibalStart >= $schedEnd)
					return 1;
				else if($eligibalEnd >= $schedStart && $eligibalStart >= $schedEnd)
					return 1;
				else
					return 0;
		}
			
	
	
	session_start();
	$user = $_SESSION['id'];
	$username =  $_SESSION['use'];	
	echo $username. "<br>";	
	
	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";	
	$eligibal = array();
	
	
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
							if($row["id"] != '100')
							{
								$eligibal[$counter] = $row["id"];
								echo $eligibal[$counter]. "<br>";
								$counter++;
							}
						}
			}
		
				
	} 		
	
	
	/************FIND CONFLICTS WITH SCHEDULE AND CONSTRAINTS*********/
		for($x = 0; $x < $counter; $x++)
		{
			if($numOfCourse >= $courseLoad)
				break;
			
			//Lectures
			$sql = "SELECT * FROM courseinfo WHERE course_id = $eligibal[$x] AND courseType = 'Lec'";
			$courseInfo = $conn->query($sql);
			
			$addLec = null;
			$addTut = null;
			$addLab = null;
			$noLec = false;
			$noTut = false;
			$noLab = false;
			
			if ($courseInfo->num_rows > 0) {	
				while($row = $courseInfo->fetch_assoc())
				{
					$sql = "SELECT * FROM preferences WHERE studentID = $user";
					$constraints = $conn->query($sql);
					$constraintsRow = $constraints->fetch_assoc();
					
					$sql = "SELECT * FROM schedule WHERE studentID = $user";
					$schedInfo = $conn->query($sql);				
								
					if(conflictingDay($row["day"], $constraintsRow["day"]) == 0)
					{
						if($schedInfo->num_rows > 0)
						{
							while($schedRow = $schedInfo->fetch_assoc())
							{							
								if(conflictingDay($row["day"], $schedRow["day"]) == 1)							
								{									
									if(conflictingTime($schedRow["start"], $schedRow["end"], $row["start"], $row["end"]) == 0)
									{									
										$addLec = $row["id"];
										goto tutorials;
									}
								}
								else
								{								
									$addLec = $row["id"];
									goto tutorials;							
								}
							}
						}
						else
						{
							$addLec = $row["id"];
							goto tutorials;
						}				
					}	
				}
			}
			else
				$noLec = TRUE;
			
			if($noLec == false && $addLec == null)
				goto skip;
			
			//Tutorials
			tutorials:
			$sql = "SELECT * FROM courseinfo WHERE course_id = $eligibal[$x] AND courseType = 'Tut'";
			$courseInfo = $conn->query($sql);
			
			if ($courseInfo->num_rows > 0) {
							
					
				while($row = $courseInfo->fetch_assoc())
				{
					$sql = "SELECT * FROM preferences WHERE studentID = $user";
					$constraints = $conn->query($sql);
					$constraintsRow = $constraints->fetch_assoc();
					
					$sql = "SELECT * FROM schedule WHERE studentID = $user ";
					$schedInfo = $conn->query($sql);	
					
					if(conflictingDay($row["day"], $constraintsRow["day"]) == 0)
					{
						if($schedInfo->num_rows > 0)
						{
							while($schedRow = $schedInfo->fetch_assoc())
							{
								if(conflictingDay($row["day"], $schedRow["day"]) == 1)
								{							
									if(conflictingTime($schedRow["start"], $schedRow["end"], $row["start"], $row["end"]) == 0)
									{														
										$addTut = $row["id"];
										goto laboratories;
									}
								}
								else
								{
									$addTut = $row["id"];
									goto laboratories;							
								}
							}
						}	
						else
						{
							$addTut = $row["id"];
							goto laboratories;
						}
					}
				}	
				
			}
			else
				$noTut = TRUE;
			
			if($noTut == false && $addTut == null)
				goto skip;
			
			//Laboratories
			laboratories:
			$sql = "SELECT * FROM courseinfo WHERE course_id = $eligibal[$x] AND courseType = 'Lab'";
			$courseInfo = $conn->query($sql);
			
			if ($courseInfo->num_rows > 0) {
						
					
				while($row = $courseInfo->fetch_assoc())
				{
					$sql = "SELECT * FROM preferences WHERE studentID = $user";
					$constraints = $conn->query($sql);
					$constraintsRow = $constraints->fetch_assoc();
					
					$sql = "SELECT * FROM schedule WHERE studentID = $user ";
					$schedInfo = $conn->query($sql);
					
					if(conflictingDay($row["day"], $constraintsRow["day"]) == 0)
					{
						if($schedInfo->num_rows > 0)
						{
							while($schedRow = $schedInfo->fetch_assoc())
							{						
								if(conflictingDay($row["day"], $schedRow["day"]) == 1)
								{						
									if(conflictingTime($schedRow["start"], $schedRow["end"], $row["start"], $row["end"]) == 0)
									{									
										$addLab = $row["id"];
										goto insert;
									}
								}
								else
								{	
									
									$addLab = $row["id"];
									goto insert;
								}
							}
						}
						else
						{
							$addLab = $row["id"];	
							goto insert;
						}				
					}
				}	
				
			}
			else
				$noLab = TRUE;	

			if($noLab == false && $addLab == null)
				goto skip;
			
			insert:
			//Add lectures 
			if($addLec != null && $noLec == false)
			{
				$numOfCourse++;
				
				$sql = "SELECT * FROM courseinfo WHERE id= $addLec";
				$courseInfo = $conn->query($sql);									
				
				$row = $courseInfo->fetch_assoc();					
				
				$day = $row["day"];
				$id = $row["course_id"];
				$type = $row["courseType"];
				$start = $row["start"];
				$end = $row["end"];				
				
				$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end)
						VALUES ('$user', '$day', '$id', '$type', '$start', '$end')";
				
				$conn->query($sql);
			}
			
			//Add tutorials
			if($addTut != null && $noTut == false)
			{
				$sql = "SELECT * FROM courseinfo WHERE id= $addTut";
				$courseInfo = $conn->query($sql);								
				
				$row = $courseInfo->fetch_assoc();					
				
				$day = $row["day"];
				$id = $row["course_id"];
				$type = $row["courseType"];
				$start = $row["start"];
				$end = $row["end"];	
				
				$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end)
						VALUES ('$user', '$day', '$id', '$type', '$start', '$end')";
				
				$conn->query($sql);
			}
			
			//Add laboratories
			if($addLab != null && $noLab == false)
			{
					$sql = "SELECT * FROM courseinfo WHERE id= $addLab";
					$courseInfo = $conn->query($sql);								
					
					$row = $courseInfo->fetch_assoc();					
					
					$day = $row["day"];
					$id = $row["course_id"];
					$type = $row["courseType"];
					$start = $row["start"];
					$end = $row["end"];	
					
					$sql = "INSERT INTO schedule (studentID, day, courseName, type, start, end)
							VALUES ('$user', '$day', '$id', '$type', '$start', '$end')";
					
					$conn->query($sql);	
				
			}
				
				
		skip:			
			
						
		}
		
		header('Location: /cronograma/home.php');
      
		

?>