<?php
session_start();
$titulok = 'Ponuka';
include('funkcie.php');
include('hlavicka.php');
include('navigacia.php');
include('db.php');



?>
<form method="post">
<select name="tovar" id="tovar">
		<option value=''>--- Zvoľte poradie ---</option>
		<option value='cenaASC'>cena vzostupne</option>
		<option value='cenaDSC'>cena zostupne</option>
		<option value='menoASC'>meno vzostupne</option>
		<option value='menoDSC'>meno zostupne</option>
</select>
<input type="submit" name="poradie" id='poradie' value="zorad">
</form>
<?php
$sql = "SELECT * FROM `sperky_produkty`";
$mysqli->query("SET CHARACTER SET 'utf8'");

if (isset($_POST['tovar'])){
	if (($_POST['tovar'] == 'cenaASC')){
		$sql .= " ORDER BY `cena` ASC";
}
	if (($_POST['tovar'] == 'cenaDSC')){
		$sql .= " ORDER BY `cena` DESC";
	}
	if (($_POST['tovar'] == 'menoDSC')){
		$sql .= " ORDER BY `nazov` DESC";
		}
	if (($_POST['tovar'] == 'menoASC')){
		$sql .= " ORDER BY `nazov` ASC";
		}
	else{
		echo 'nieco sa pokazilo';
	}

}
else{
	$sql .= " ORDER BY `nazov` ASC";
}

?>
<section>   

<!-- Nasledujúcu časť treba vygenerovať z databázy -->

<?php
// if !(isset($_POST['pridaj'])){
// 	$_SESSION['kosik'] = array();
// }
// if (isset($_POST['pridaj'])){
// 	$sqli = "SELECT * FROM `sperky_produkty`";
// 	if ($result = $mysqli->query($sql)) {
// 		while ($row = $result->fetch_assoc()) {

// 		}
// 	array_push($_SESSION['kosik'], $_POST['id']);	
// }
if ($_SESSION['user'] != 'admin' && (isset($_SESSION['user']))){
	if ($result = $mysqli->query($sql)) {
		while ($row = $result->fetch_assoc()) {
			echo '<figure>';
			echo '<figcaption>' . $row['nazov'] . '</figcaption>';
			echo '<img src="foto/' . $row['kod'] . '.png" alt="' . $row['nazov'] . '" width="130" height="130">';
			echo '<p>cena:' . $row['cena'] . ' &euro;</p>';
			echo '<a href="kosik.php?id=' . $row['kod'] .'">pridaj do kosika</a>';
			// echo '<form method="post">'; 
			// echo '<p><input name="pridaj" type="submit" id="'. $row['nazov'] . '" value="do kosika"></p></form>';
			echo '</figure>';
		}
		$result->free();
	}
	


}
else{
	if ($result = $mysqli->query($sql)) {
	while ($row = $result->fetch_assoc()) {
		echo '<figure>';
		echo '<figcaption>' . $row['nazov'] . '</figcaption>';
		echo '<img src="foto/' . $row['kod'] . '.png" alt="' . $row['nazov'] . '" width="130" height="130">';
		echo '<p>cena:' . $row['cena'] . ' &euro;</p>';
		echo '</figure>';
	}
	?> preslo to tu <?php
	$result->free();
}
}



?>
<!-- <figure>
	<figcaption>Azotic Ecstasy</figcaption>
	<img src='foto/7.png' alt='Azotic Ecstasy' width='130' height='130'>
	<p>cena: 30.15 &euro;</p>
</figure>
<figure>
	<figcaption>Black and White Bangle</figcaption>
	<img src='foto/55.png' alt='Black and White Bangle' width='130' height='130'>
	<p>cena: 205.15 &euro;</p>
</figure> -->

</section> 
<?php include('paticka.php'); ?>
