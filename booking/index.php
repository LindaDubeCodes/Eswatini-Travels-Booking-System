<?php session_start()?>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Generating Order you...</title>

<link rel="stylesheet" type="text/css" href="semantic/semantic.min.css">
<script src="semantic/jquery.min.js"> </script>
<script src="semantic/semantic.min.js"></script>
<script src="order_validate.js"></script>

<style>
body{
background-color:f1f1f1;
}
a{
	cursor:pointer;
}
</style>
</head>
<body>
    <div class="ui inverted huge borderless fixed fluid menu">
      <a class="header item">Eswatini Transports</a>
    </div><br>
<div class="ui text container" style="margin-top:90px">
<div id="err001" class="ui icon small attached message">
<div class="content">
<div class="header">Unique Ticket ID is ready</div>
<p>You can now book a ride.....</p>
<div id="proceed"></div>
</div>
</div>
<div class="ui attached bottom message">
<div class="ui horizontal divider">lost your ticket?</div>

<form onsubmit="return ordval(this)">
<div id="refbox" class="ui icon input small">
<input placeholder="Enter Ticket ID here" id="refinput" required>
 <i class="search icon"></i>
</div>
<button id="printbtn" class="ui button small blue">Re-print</button>
</form>
</div>
</div>
<?php
function generate_order()
{

//These are just Random Letters forming a transaction ID
    $order_ref = "";
    $char = array('O', 'T', 'R', 'S', 'A', 'C', 'B', 'E');
    $num = rand(11, 99);
    $num2 = rand(12, 89);
    $num3 = rand(13, 92);
    shuffle($char);
//now the final
    $order_ref = $char[0] . $char[3] . $num . $char[1] . $num2 . $char[2] . $num3 . $char[4];
//assignming to user
    $_SESSION['ORDERREF'] = $order_ref;

}
generate_order();
?>

<script>
setTimeout(function(){document.getElementById("proceed").innerHTML="<a href='booking.php' class='ui button small green'>Book s</a> <a href='../admin/login.php' class='ui button small orange'>Admin Login</a> "},5000);
</script>
</body>
</html>