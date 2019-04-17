<?php 
$conn=mysqli_connect('localhost','root','','prueba');


if(isset($_POST['save'])){
	$checkbox = $_POST['check'];
	for($i=0;$i<count($checkbox);$i++){
	$del_id = $checkbox[$i]; 
	mysqli_query($conn,"update t_prueba set comment='C' WHERE id='".$del_id."'");
	$message = "Data deleted successfully !";
}
}
$result = mysqli_query($conn,"SELECT * FROM t_prueba");
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Delete employee data</title>
</head>
<body>
<div><?php if(isset($message)) { echo $message; } ?>
</div>
<form method="post" action="">
<table class="table table-bordered">
<thead>
<tr>
    <th><input type="checkbox" id="checkAl"> Select All</th>
	<th>Id</th>
	<th>Date</th>
	<th>Agent Id</th>
	<th>Subject_id</th>
	<th>Comment</th>
	<th>Supervisor_id</th>
	<th>Project_id</th>
	<th>Status</th>
</tr>
</thead>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
    <td><input type="checkbox" id="checkItem" name="check[]" value="<?php echo $row["id"]; ?>"></td>
	<td><?php echo $row["id"]; ?></td>
	<td><?php echo $row["date"]; ?></td>
	<td><?php echo $row["agent_id"]; ?></td>
	<td><?php echo $row["subject_id"]; ?></td>
	<td><?php echo $row["comment"]; ?></td>
	<td><?php echo $row["supervisor_id"]; ?></td>
	<td><?php echo $row["project_id"]; ?></td>
	<td><?php echo $row["status"]; ?></td>
</tr>
<?php
$i++;
}
?>
</table>
<p align="center"><button type="submit" class="btn btn-success" name="save">DELETE</button></p>
</form>
<script>
$("#checkAl").click(function () {
$('input:checkbox').not(this).prop('checked', this.checked);
});
</script>
</body>
</html>