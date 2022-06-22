<?php
include "connect.php";
	$email = $_POST['email'];
	$pass = $_POST['pass'];
	$status = $_POST['status'];
	

	$query = 'SELECT * FROM `user` WHERE `email` = "'.$email.'" AND `pass` = "'.$pass.'" AND `status` = "'.$status.'"';
	$data = mysqli_query($conn, $query);
	$result = array();
	while ($row = mysqli_fetch_assoc($data)) {
		$result[] = ($row);
	// code...
	}
	if (!empty($result)) {
		$arr = [
			'success' => true,
			'message' => "thanh cong",
			'result' => $result
		];
	}else{
		$arr = [
			'success' => false,
			'message' => " khong thanh cong",
			'result' => $result
		];
	}
	print_r(json_encode($arr));

?>