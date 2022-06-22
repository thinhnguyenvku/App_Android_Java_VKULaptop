<?php

  include "connect.php";

  use PHPMailer\PHPMailer\PHPMailer;
  use PHPMailer\PHPMailer\Exception;

  require 'PHPMailer/src/Exception.php';
  require 'PHPMailer/src/PHPMailer.php';
  require 'PHPMailer/src/SMTP.php';

  $email = $_POST['email'];
  
  $query = 'SELECT * FROM `user` WHERE `email` = "'.$email.'"';
  $data = mysqli_query($conn, $query);
  $result = array();
  while($row = mysqli_fetch_assoc($data)){
    $result[] = ($row);
  }

  if(empty($result)){
    $arr = [
      'success' => false,
      'message' => 'Email không tồn tại!',
      'result' => $result
    ];
  }else{
    $email = ($result[0]["email"]);
    $pass = ($result[0]["pass"]);

    $link="<h1><b style='color: red'>V</b><b style='color: blue'>K</b><b style='color:#FF8000'>U</b> - LAPTOP</h1><a href='http://192.168.43.127/appfinal/reset_pass.php?key=".$email."&reset=".$pass."'>Click To Reset password</a>";
    
    $mail = new PHPMailer();
    $mail->CharSet =  "utf-8";
    $mail->IsSMTP();
    // enable SMTP authentication
    $mail->SMTPAuth = true;                  
    // GMAIL username
    $mail->Username = "nthhnguyenhanh@gmail.com";
    // GMAIL password
    $mail->Password = "ldgdvfawtnpyaood";
    $mail->SMTPSecure = "ssl";  
    // sets GMAIL as the SMTP server
    $mail->Host = "smtp.gmail.com";
    // set the SMTP port for the GMAIL server
    $mail->Port = "465";
    $mail->From= "nthhnguyenhanh@gmail.com";
    $mail->FromName='VKU LAPTOP';
    $mail->AddAddress($email, 'reciever_name');
    $mail->Subject  =  'VKU LAPTOP';
    $mail->IsHTML(true);
    $mail->Body    = $link;
    if($mail->Send())
    {
      $arr = [
        'success' => true,
        'message' => 'Vui lòng kiểm tra email của bạn',
        'result' => $result
      ];
    }
    else
    {
      $arr = [
        'success' => false,
        'message' => 'Gửi email thất bại',
        'result' => $result
      ];
    }

  }

  print_r(json_encode($arr));
    
?>