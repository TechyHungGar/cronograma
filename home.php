<html>   
    <body>
        <table>
        <thead>
            <tr>
                <td align="center">CourseID</td>
                <td align="center">Type</td>
				<td align="center">Day</td>
				<td align="center">Start</td>
				<td align="center">End</td>
            </tr>
        </thead>
        <tbody>
<?php
	session_start();
	$user = $_SESSION['id'];
	$username = $_SESSION['use'];		
	
	echo "<b> Hello " .$username. ", your current schedule is: </b><br>";	
	
	
	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";	
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);	

	$sql = "SELECT * FROM schedule join courselist on courselist.id = schedule.courseName and schedule.studentID = $user";
	$courseSched = $conn->query($sql);

	if($courseSched->num_rows > 0)
		while($row = $courseSched->fetch_assoc())
		{
			?>
				<tr>
                    <td><?php echo $row['code']?></td>
                    <td><?php echo $row['type']?></td>
					<td><?php echo $row['day']?></td>
					<td><?php echo $row['start']?></td>
					<td><?php echo $row['end']?></td>
                </tr>
		<?php	
		}
		?>
		
		</tbody>
            </table>
			<br>
	<a href="logout.php">Logout</a><br>
	<a href="generateSchedule.php">Generate Schedule</a><br>
	<a href="preferences.php">Add Preferences</a><br>
    </body>
</html>		
			

