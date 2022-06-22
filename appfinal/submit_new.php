<?php

include "connect.php";

if(isset($_POST['submit_password']) && $_POST['email'])
{

  $email=$_POST['email'];
  $pass=$_POST['password'];

  $query = "UPDATE user SET pass='$pass' WHERE email='$email'";
  $data = mysqli_query($conn, $query);
  
  if($data == true)
  {
    echo "<h1>Đổi mật khẩu thành công!</h1>";
  }

}
?>