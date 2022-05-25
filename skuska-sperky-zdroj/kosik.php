<?php
$titulok = 'Košík';
include('funkcie.php');
include('hlavicka.php');
include('navigacia.php');
session_start();
include('db.php')
?>

<?php


if (!(isset($_SESSION['kosik']))){
    $_SESSION['kosik'] = array();
}
if (isset($_GET['id'])){
    if (!(in_array($_GET['id'], $_SESSION['kosik']))){
            array_push($_SESSION['kosik'], $_GET['id']);
    }

}
if (isset($_POST['zrus'])){
    $_SESSION['kosik'] = array();
}


if (isset($_POST['odosli'])){
    $tex = implode(';', $_SESSION['kosik']);
    print_r($_SESSION['kosik']);
    $te = strval($tex);
    $posli = "INSERT INTO sperky_objednavky (`uid`, tovar, datum,vybavena) VALUES ('{$_SESSION['uid']}', '$te' , NOW(), '0')";
    $res = $mysqli->query($posli);
}


    // foreach ($_SESSION['kosik'] as $i){
    //     if ($result = $mysqli->query($sqlobj)) {
    //         while ($row = $result->fetch_assoc()) {
    //             if ($row['kod'] == $i){
    //                 $posli = "INSERT INTO `sperky_objednavky` (`uid`, `tovar`, `datum`,`vybavena`) VALUES ({$_SESSION['uid']}, {$row['nazov']}, NOW(), 0)";
    //             }
// }
//         }}

if (empty($_SESSION['kosik'])){
    ?>
    <section>
<h2>nic tu nie je</h2>
</section> 
<?php
}
else{

    $sqlkos = "SELECT * FROM `sperky_produkty`";
    $mysqli->query("SET CHARACTER SET 'utf8'");
    $sqlkos .= " ORDER BY `nazov` ASC";

    ?>
    <section>
    <h2>Zoznam tovaru v košíku</h2>
    <?php

    foreach ($_SESSION['kosik'] as $i){
        if ($result = $mysqli->query($sqlkos)) {
            while ($row = $result->fetch_assoc()) {
                if ($row['kod'] == $i){
                    echo '<figure>';
                    echo '<figcaption>' . $row['nazov'] . '</figcaption>';
                    echo '<img src="foto/' . $row['kod'] . '.png" alt="' . $row['nazov'] . '" width="130" height="130">';
                    echo '<p>cena:' . $row['cena'] . ' &euro;</p>';
                    echo '</figure>';
                }
            }
    }
    

}
?></section> <?php

			echo '<br><form method="post">';
			echo '<p><input name="zrus" type="submit" value="zrus kosik"></p></form>';
            echo '<br><form method="post">';
			echo '<p><input name="odosli" type="submit" value="ododsli objednavku"></p></form>';
}
?>
<?php include('paticka.php'); ?>
