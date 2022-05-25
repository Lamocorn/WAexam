<?php
session_start();
$titulok = 'Ponuka';
include('funkcie.php');
include('hlavicka.php');
include('navigacia.php');
include('db.php');

$sqlvyb = "UPDATE `sperky_objednavky` SET `vybavena` = '1' WHERE `id` = {$_GET['id']}";
$mysqli->query("SET CHARACTER SET 'utf8'");

$res = $mysqli->query($sqlvyb);
?>
vybavene
