<!DOCTYPE html>
<?php session_start(); ?>
<html lang="en">
<head>
  <title>CronoGrama</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
	  background-color: #232322;
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }	
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="capture.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">        
        <li><a href="generateSchedule.php">Generate Schedule</a></li>        	
		<li><a href="#" data-toggle="modal" data-target="#myModal">Add Preferences</a></li>        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.php"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
	  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">  
 <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Contraints</h4>
        </div>
        <div class="modal-body">
		<table class="table">
		<thead>
		<tr>
		<td>
		<b>Day to avoid:
		</td>
		<td>
		<b>Time to avoid (default is 8h - 23h):</b>
		</td>		
		</tr>
		<tbody>
		<td>		  
          <form action="preferencesInput.php" method="post">
		  <input type="radio" name="selection[]" value="M"> Monday<br>
		  <input type="radio" name="selection[]" value="T"> Tuesday<br>
		  <input type="radio" name="selection[]" value="W"> Wednesday<br>
		  <input type="radio" name="selection[]" value="J"> Thursday<br>
		  <input type="radio" name="selection[]" value="F"> Friday<br> 
		</td>
		<td>		  
		  Start<br><input type="text" pattern="(?:[01]|2(?![4-9])){1}\d{1}:[0-5]{1}\d{1}" name="selection[]" placeholder="hh:mm"><br>
		  End<br><input type="text" pattern="(?:[01]|2(?![4-9])){1}\d{1}:[0-5]{1}\d{1}" name="selection[]" placeholder="hh:mm"><br>		  
		</td>
	
		</tbody>
		</table>
        </div>
        <div class="modal-footer">
		<center><input type="submit" class="btn btn-default">		
		<input type="submit" class="btn btn-default" name="selection[]" value="Remove All Contstraints">		
		</form>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button></center>
        </div>
      </div>	
      
    </div>
  </div>
    </div>
  </div>
</nav>
<div class="container">
      

<div class="table-responsive">	
	<table class="table">
    <thead>
      <tr>
		<th><center>Time</center></th>
        <th><center>Monday</center></th>
        <th><center>Tuesday</center></th>
        <th><center>Wednesday</center></th>
		<th><center>Thursday</center></th>
        <th><center>Friday</center></th>       
      </tr>
    </thead>
    <tbody>
 


</body>
</html>
<?php
	function get_minutes ( $start, $end ) {  

	   while ( strtotime($start) <= strtotime($end) ) {  
		   $minutes[] = date("H:i:s", strtotime( "$start" ) );  
		   $start = date("H:i:s", strtotime( "$start + 30 mins")) ; 
		   
		}  
		return $minutes;
	}
	
	$user = $_SESSION['id'];
	$username = $_SESSION['use'];		
	
		
	$days= array("M", "T", "W", "J", "F");
	 					

	
	$servername = "localhost";
	$username = "root";
	$password = "publicvoid1";
	$dbname = "school";	
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);	
	

	$minutes = get_minutes('08:00', '23:00'); 
	
		
			
	foreach($minutes as $minute) 
	{ 	
		echo "<tr>";
		echo "<td><center>" . $minute. "</center></td>";
		$end = date("H:i:s", strtotime( "$minute + 30 mins")) ;
		foreach($days as $day)
		{	
			$sql = "SELECT DISTINCT * FROM schedule join courseinfo on courseinfo.id = schedule.courseName and schedule.studentID = '$user' 
					AND ((schedule.start > '$minute' and schedule.start <= '$end') or (schedule.start <= '$minute' AND schedule.end > '$minute')) AND schedule.day = '$day'";
			$schedule = $conn->query($sql);
			if($schedule->num_rows > 0)
			{
				$scheduleRow = $schedule->fetch_assoc();
				if($scheduleRow["start"] >= $minute && $scheduleRow["start"] <= $end)
					echo "<td class = info><center>".$scheduleRow["code"]. " - ".$scheduleRow["courseType"]. "</center></td>";
				else
					echo "<td class = info></td>";
			}
			else
				echo "<td></td>";
				
   			
			
		}
		echo "</tr>";	

	}
	
?>


	
	</div>    
	</tbody>
  </table>
</div>	
</html>		
			

