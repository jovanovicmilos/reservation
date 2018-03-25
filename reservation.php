<?php
session_start();

require "config.php"; 
$tipovi = Tip::getAll();
$gradovi = Grad::getAll("order by grad_naziv;");
$vrste = Vrsta::getAll();
$rez = new Rezervacije;
$ob = Objekti::get($_GET['objekat']);
?>
<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="style.css"/>
	<link href='https://fonts.googleapis.com/css?family=Alegreya+Sans:400,700,500|Titillium+Web' rel='stylesheet' type='text/css'><link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<title>rezervacije.rs</title>
	<script>
$(document).ready(function(){
    $("#show").click(function(){
        $("#registration").toggle(700);
    });
});
</script>
<script>
$(document).ready(function(){
    $("button[name='show_reservation']").click(function(){
        $(".reservation").toggle(700);
    });
});
</script>
<script>
        $(function() {
            $( ".from" ).datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 3,
                onClose: function( selectedDate ) {
                    $( ".to" ).datepicker( "option", "minDate", selectedDate );
                }
            });
            $( ".to" ).datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 3,
                onClose: function( selectedDate ) {
                    $( ".from" ).datepicker( "option", "maxDate", selectedDate );
                }
            });


        });
</script>
<script>
	$(document).ready(function(){
		var readMoreHtml = $(".read-more").html();
		var lessText = readMoreHtml.substr(0,300)
		if(readMoreHtml.length > 50){
			$(".read-more").html(lessText).append("<a href='' class='read-more-link'> Detaljnije...</a>");
		}else{
			$("read-more").html(readMoreHtml);
		}
		$("body").on("click", ".read-more-link", function(event){
			event.preventDefault();
			$(this).parent(".read-more").html(readMoreHtml).append("<a href='' class='show-less-link'> Vrati</a>");
		});
		$("body").on("click", ".show-less-link", function(){
			event.preventDefault();
			$(this).parent(".read-more").html(readMoreHtml.substr(0,300)).append("<a href='' class='read-more-link'> Detaljnije...</a>");
		});
	});
</script>
</head>
<body>
	<section class="col-md-12" id="navigation">
		<div class="col-md-2" id="logo"><a href="index.php"><img src="images/logo.png" alt=""/></a></div>
		<div class="col-md-3">
		<a href="index.php" class='btn btn-primary' style='margin:12px 0 0 20px;padding:2px 10px;'>Nazad</a>
		</div>
		<div class="col-md-7"><ul id="nav" class="nav navbar-nav bg-inverse">
			<li><a href="#prvi">POCETNA</a></li>
			<li><a href="#prvi">O NAMA</a></li>
			<li><a href="#drugi">KONTAKT</a></li>
			<li><a href="#treci">POMOC</a></li>
		</ul></div>
	</section>
	<section class="col-md-12" id="first">
	<div class="col-md-2" id="first_nav"><!--navigacija levo-->
		<ul>
			<?php foreach($tipovi as $tip){?>
			<li><a href='index.php?tip=<?php echo $tip->tip_id;?>'><?php echo $tip->tip_ime; }?></a></li>
		</ul>
	</div>
	<div class="col-md-7" id="first_main">
		<div class="row">
		<div class="col-md-12">
			<div id="registration" style="display:none;">
				<fieldset>
				<legend style="border:none;">Registration</legend>
				<form role="form">
				<div class="form-group">
				  <label for="usr">Ime:</label>
				  <input type="text" class="form-control" id="usr">
				</div>
				<div class="form-group">
				  <label for="usr">Prezime:</label>
				  <input type="text" class="form-control" id="usr">
				</div>
				<div class="form-group">
				  <label for="usr">E-mail:</label>
				  <input type="text" class="form-control" id="usr">
				</div>
				<div class="form-group">
				  <label for="pwd">Password:</label>
				  <input type="password" class="form-control" id="pwd">
				</div>
				 <div class="form-group">
				  <input type="submit" class="btn btn-success" value="Potvrdi registraciju"/>
				</div>
		  </form>
		  </fieldset>
			</div>
		</div>
			<div class="col-md-12">
				<div class='reservation' style='border:1px solid black;padding:20px;'>
				<h4 style='text-align:center;'>Rezervacija</h4>
				<div class='form-group' style='margin-bottom:30px'>
					<form role='form' method='post' style='margin-top:10px;'>
						<label for='usr'>Ime:</label>
						<label hidden><input type='text' class='form-control' name='rez_korisnik_id' value='<?php if(isset($_SESSION['user_mail'])){echo $_SESSION['id'];} ?>'></label>
							<input type='text' class='form-control' name='rez_ime' value='<?php if(isset($_SESSION['user_mail'])){echo $_SESSION['korisnik'];} ?>'>
							<br/>
						<label for='usr'>Prezime:</label>
							<input type='text' class='form-control' name='rez_prezime' value='<?php if(isset($_SESSION['user_mail'])){echo $_SESSION['prezime'];} ?>'><br/>
						<label for='usr'>Ime objekta:</label>
							<input type='text' class='form-control' name='rez_objekat' value='<?php echo $ob->objekat_ime; ?>'><br/>
						<label for='usr'>Broj osoba:</label>
							<input type='text' class='form-control' name='rez_brojosoba' value='' placeholder="Unesi broj osoba"/><br/>
						<label for='usr'>U koliko sati:</label>
							<input type='text' class='form-control' name='rez_vreme' value='' placeholder="Unesi tacno vreme u h"><br/>
						<div style='color:red;'>u koliko rezervisete jedan dan u oba polja unesite isti datum</div><br/>
						<div class='col-md-3' style='margin:0 10px 10px 0;padding:0;'>
							<label for='from'>Od:</label><br/>
							<input type='text' class='from' name='rez_od' style='padding:6px;border:1px solid #bdbdbd;border-radius:3px;'placeholder="Datum od"/>
						</div>
						<div class='col-md-3' style='margin:0;padding:0;'>
							<label for='from'>Do:</label><br/>
							<input type='text' class='to' name='rez_do' class='form-control' style='padding:6px;border:1px solid #bdbdbd;border-radius:3px;'placeholder="Datum do"/>
						</div><br><br><br><br>
						<div>
						<label>Komentar / narudzbina:</label>
							<textarea class="form-control" rows="5" name='rez_komentar'placeholder="Unesi komentar ili narudzbinu"></textarea></div><br/>
							<input type='submit' name='potvrdi' class="btn btn-primary"  value='Potvrdi rezervaciju'/>
					</form>
				</div>
				</div>
			</div>
		
	<div class="col-md-3" id="first_said"><!--registracija-->
	<?php if(isset($_SESSION['user_mail'])){
					 echo "<h4>Dobrodosli,  " . $_SESSION['korisnik'] . " " . $_SESSION['prezime'] . "</h4>";
					 echo "<a href='logout.php' class='btn btn-primary'>Logout</a><br/>";
					echo "<br><p>Poslednje 5 rezervacije:</p>";	
				}?>
	<?php
		if(isset($_SESSION['user_mail'])){
			$ide = $_SESSION['id'];
			$rez_id = Rezervacije::getAll("where rez_korisnik_id = '$ide' order by rez_id desc limit 5");

			}
		
		if(isset($_SESSION['id'])){
		foreach($rez_id as $id){
			
			echo "<ul><li style='font-size:9pt;'>" .$id->rez_objekat . " Datum: " . $id->rez_od . "</li></ul>";
		}}
	?>
	
		<hr>
		<img src='images/attention.png' alt='' style='width:40px;'/>
		</p><p style='color:yellow'>Obavestenje:</p>
		<ul>
			<li>Morate sacekati potvrdu rezervacije na email</li>
			<li>Obavezan rok otkazivanja rezervacije 24h</li>
		</ul>
	</div>
	</section>
</body>
</html>	
<?php
	if(isset($_POST['potvrdi']))
	{
		$rez->rez_ime = $_POST['rez_ime'];
		$rez->rez_prezime = $_POST['rez_prezime'];
		$rez->rez_objekat = $_POST['rez_objekat'];
		$rez->rez_brojosoba = $_POST['rez_brojosoba'];
		$rez->rez_sati = $_POST['rez_vreme'];
		$rez->rez_od = $_POST['rez_od'];
		$rez->rez_do = $_POST['rez_do'];
		$rez->rez_komentar = $_POST['rez_komentar'];
		$rez->rez_korisnik_id = $_POST['rez_korisnik_id'];
		$rez->insert();
	}
?>

