
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body style="margin: 50px">
    <?php

include "connect.php";

if($_GET['key'] && $_GET['reset'])
{
  $email=$_GET['key'];
  $pass=$_GET['reset'];

  $query = "SELECT email,pass FROM user WHERE email='$email' AND pass='$pass'";
  $data = mysqli_query($conn, $query);
 
  if($data == true)
  {
    ?>
    <h1><b style='color: red'>V</b><b style='color:blue '>K</b><b style='color:#FF8000'>U</b> - LAPTOP</h1>

    <form method="post" action="submit_new.php">
      <input type="hidden" name="email" value="<?php echo $email;?>">
      <p style="margin-top: 10px" >Vui lòng nhập mật khẩu mới</p>
      <input type="password" class="form-control" name='password' style="width: 200px">
      <button type="submit" class="btn btn-outline-danger" style="margin-top: 10px"  name="submit_password">Gửi</button>
    </form>
    <?php
  }
}
?>
</body>
</html>