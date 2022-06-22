<?php
	include "connect.php";
	$email = $_POST['email'];
	$pass = $_POST['pass'];
	$username = $_POST['username'];
	$sdt = $_POST['sdt'];
	$uid = $_POST['uid'];
	$status = $_POST['status'];
	

	//Check email ton tai
	$query = 'SELECT * FROM `user` WHERE `email` = "'.$email.'"';
	$data = mysqli_query($conn, $query);
	$numrow = mysqli_num_rows($data);
	if($numrow > 0){
		$arr = [
			'success' => false,
			'message' => 'Email đã tồn tại! Vui lòng sử dụng email khác để tiếp tục!'
		];
	}else{
		//Chen du lieu user moi vao csdl
		$query = 'INSERT INTO `user`(`email`, `pass`, `username`, `sdt`, `uid`, `status`) VALUES ("'.$email.'","'.$pass.'","'.$username.'","'.$sdt.'","'.$uid.'","'.$status.'")';
		$data = mysqli_query($conn, $query);
		if($data == true){
			$arr = [
				'success' => true,
				'message' => 'Thanh cong!'
			];
		}else{
			$arr = [
				'success' => false,
				'message' => 'Khong thanh cong!'
			];
		}
	}
	print_r(json_encode($arr));
?>