<?php
	include "connect.php";

	$iddonhang = $_POST['id'];
	$token = $_POST['token'];
	


		$query = 'UPDATE `donhang` SET `momo` = "'.$token.'" WHERE `id` =' .$iddonhang;
		$data = mysqli_query($conn, $query);
		if($data == true){
			$arr = [
				'success' => true,
				'message' => 'Thành công!'
			];
		}else{
			$arr = [
				'success' => false,
				'message' => 'Không thành công!'
			];
		}
	
	print_r(json_encode($arr));
?>