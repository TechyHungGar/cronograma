<!DOCTYPE html>
<html>
<body>

Select Days you do not want class:
<form action="preferencesInput.php" method="post">
  <input type="radio" name="selection[]" value="M"> Monday<br>
  <input type="radio" name="selection[]" value="T"> Tuesday<br>
  <input type="radio" name="selection[]" value="W"> Wednesday<br>
  <input type="radio" name="selection[]" value="J"> Thursday<br>
  <input type="radio" name="selection[]" value="F"> Friday<br> 
  <input type="radio" name="selection[]" value="REMOVE"> REMOVE ALL CONSTRAINTS<br>  
  <input type="text" pattern="(?:[01]|2(?![4-9])){1}\d{1}:[0-5]{1}\d{1}" name="selection[]"> Start<br>
  <input type="text" pattern="(?:[01]|2(?![4-9])){1}\d{1}:[0-5]{1}\d{1}" name="selection[]"> End<br>  
  <input type="submit">
</form>

</body>
</html>
