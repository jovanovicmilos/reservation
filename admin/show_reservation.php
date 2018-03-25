<?php
    require "../config.php";
    $rezerv = Rezervacije::getAll('order by rez_id desc;');
$rez = new Rezervacije;
?>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../style.css"/>
	<link href='https://fonts.googleapis.com/css?family=Alegreya+Sans:400,700,500|Titillium+Web' rel='stylesheet' type='text/css'><link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<title>rezervacije.rs</title>
	
</head>
<body>
	<section class="col-md-12" id="navigation">
		<div class="col-md-2" id="logo"><a href="index.php"><img src="../images/logo.png" alt=""/></a></div>
		<div class="col-md-3"></div>
		<div class="col-md-7">
		<ul id="nav" class="nav navbar-nav bg-inverse">
			<li style='color:white;font-size:14pt;padding:10px;'>ADMIN DEO ZA PRIKAZ REZERVACIJA</li>
		</ul></div>
	</section>
     <section class='col-md-7' id='list_res'>
        <ul class="list-group">
          
            <?php 
              foreach($rezerv as $rez){
                  echo "<li class='list-group-item'>ID: " . $rez->rez_id ." Ime: " . $rez->rez_ime . " <a href='show_reservation.php?rez={$rez->rez_id}'>" . $rez->rez_od . "</a></li><br/>";
              }
              
            ?>
            
        </ul>
    </section>
    <section class='col-md-5' id='show_res'>
        <?php
if(isset($_GET['rez'])){
				$rez_id = $_GET['rez'];
				$sql = Rezervacije::getAll("where rez_id='$rez_id'");
				foreach($sql as $rez){
					echo "<form action='' method='post'><br/> Ime:<input type='text' name='updIme' value='{$rez->rez_ime}'><br/> Prezime:<input type='text' name='updPrezime' value='{$rez->rez_prezime}'><br/>Objekat : <input type='text' name='updObjekat' value='{$rez->rez_objekat}'><br/> Broj osoba: <input type='text' name='updBrojosoba' value='{$rez->rez_brojosoba}'><br/> U koliko sati: <input type='text' name='updSati' value='{$rez->rez_sati}'><br/> Datum od: <input type='text' name='updOd' value='{$rez->rez_od}'><br/> Datum do: <input type='text' name='updDo' value='{$rez->rez_do}'><br/> Komentar: <input type='text' name='updKomentar' value='{$rez->rez_komentar}'><br/> ID korisnika: <input type='text' name='updKorisnik' value='{$rez->rez_korisnik_id}'><input type='submit' value='submit' name='updSubmit'></form>";
				}
			}
        ?>
    </section>
	
</body>
</html>	
<?php 
if(isset($_POST['updSubmit'])){
                   
                    $rez->rez_ime = $_POST['updIme'];
					$rez->rez_prezime = $_POST['updPrezime'];
					$rez->rez_objekat = $_POST['updObjekat'];
					$rez->rez_brojosoba = $_POST['updBrojosoba'];
					$rez->rez_sati = $_POST['updSati'];
					$rez->rez_od = $_POST['updOd'];
					$rez->rez_do = $_POST['updDo'];
					$rez->rez_komentar = $_POST['updKomentar'];
					$rez->rez_korisnik_id = $_POST['updKorisnik'];
					$rez->update();
}
?>


