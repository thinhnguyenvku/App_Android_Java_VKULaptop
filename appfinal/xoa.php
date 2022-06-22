<?php
	include "connect.php";
	$id = $_POST['id'];
	$query = "DELETE FROM `sanphammoi` WHERE `id` = " .$id;
	$data = mysqli_query($conn, $query);

	if($data == true){
		$arr = [
			'success' => true,
			'message' => 'Xóa sản phẩm thành công!'
		];
	}else{
		$arr = [
			'success' => false,
			'message' => 'Xóa sản phẩm không thành công!'
		];
	}
	print_r(json_encode($arr));
?>