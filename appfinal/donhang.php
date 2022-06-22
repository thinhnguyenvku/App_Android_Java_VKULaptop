<?php
	include "connect.php";

	$sdt = $_POST['sdt'];
	$email = $_POST['email'];
	$tongtien = $_POST['tongtien'];
	$iduser = $_POST['iduser'];
	$diachi = $_POST['diachi'];
	$soluong = $_POST['soluong'];

	$chitiet = $_POST['chitiet'];


	$query = 'INSERT INTO `donhang`(`iduser`, `diachi`, `email`, `sdt`, `soluong`, `tongtien`) VALUES ("'.$iduser.'","'.$diachi.'","'.$email.'","'.$sdt.'","'.$soluong.'","'.$tongtien.'")';

	$data = mysqli_query($conn, $query);
	if($data == true){
		$query = 'SELECT id AS iddonhang FROM `donhang` WHERE `iduser` = '.$iduser.' ORDER BY id DESC LIMIT 1';
		$data = mysqli_query($conn, $query);

		while($row = mysqli_fetch_assoc($data)){
			$iddonhang = ($row);
		}

		if(!empty($iddonhang)){
			$chitiet = json_decode($chitiet, true);
			foreach ($chitiet as $key => $value) {
				$query1 = 'INSERT INTO `chitietdonhang`(`iddonhang`, `idsp`, `soluong`, `gia`) VALUES ("'.$iddonhang['iddonhang'].'","'.$value['idsp'].'","'.$value['soluong'].'","'.$value['gia'].'")';

				$data = mysqli_query($conn, $query1);
			}
			if($data == true){
				$arr = [
					'success' => true,
					'message' => 'Thành công',
					'iddonhang' => $iddonhang['iddonhang']
				];
			}
			else{
				$arr = [
					'success' => false,
					'message' => 'Không thành công'
				];
			}
			print_r(json_encode($arr));
		}
	}
	else{
		$arr = [
			'success' => false,
			'message' => 'Không thành công'
		];

	print_r(json_encode($arr));
}
?>