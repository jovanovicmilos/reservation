<?php
session_start();
require "config.php"; 

$tipovi = Tip::getAll();
$gradovi = Grad::getAll("order by grad_naziv;");
$vrste = Vrsta::getAll();
$registracija = new Registracija;

?>
<!--registracija-->
<?php
$conn = Connection::getConnection();
	if(isset($_POST['reg_potvrda'])){
		if(!empty($_POST['reg_ime'])&&!empty($_POST['reg_prezime'])&&!empty($_POST['reg_email'])&&!empty($_POST['reg_lozinka'])){
			$registracija->korisnik_ime = $_POST['reg_ime'];
			$registracija->korisnik_prezime = $_POST['reg_prezime'];
			$registracija->korisnik_email = $conn->real_escape_string($_POST['reg_email']);
			$registracija->korisnik_lozinka = $_POST['reg_lozinka'];
			$registracija->korisnik_lozinka = md5($registracija->korisnik_lozinka);
			
			$sql = mysqli_query($conn,"select * from korisnici where korisnik_email='$registracija->korisnik_email'");
				if(mysqli_num_rows($sql)>0){
					echo "<div style='color:#fff;text-align:center;background:#d9534f;'>Vec postoji nalog sa ovom adresom</div>";
				}else{
					$registracija->insert();
					echo "<div style='color:#fff;text-align:center;background:#5cb85c;'>Uspesno ste se registrovali na sajt rezervacije.rs</div>";
				}
			}else if(empty($_POST['reg_ime'])||empty($_POST['reg_prezime'])||empty($_POST['reg_email'])||empty($_POST['reg_lozinka'])){
				echo "<div style='color:#fff;text-align:center;background:#d9534f;'>Morate popuniti celu formu</div>";
			}
	}
?>
<!--login-->
<?php
$conn = Connection::getConnection();
if(isset($_POST['login_potvrda']))
{
	$email = $conn->real_escape_string($_POST['login_email']);
	$pass = $conn->real_escape_string($_POST['login_lozinka']);
	$pass = md5($pass);
	
	$sql = mysqli_query($conn, "select * from korisnici where korisnik_email='$email' and korisnik_lozinka='$pass'");
	if(mysqli_num_rows($sql)>0)
	{
		$_SESSION['user_mail'] = $email;
		header("Location: index.php");
		while($ispis = mysqli_fetch_array($sql))
		{
			$name = $ispis['korisnik_ime'];
			$_SESSION['korisnik'] = $name;
			$last = $ispis['korisnik_prezime'];
			$_SESSION['prezime'] = $last;
			$id = $ispis['korisnik_id'];
			$_SESSION['id'] = $id; 
		}
	}else
{
	echo "<div style='color:#fff;text-align:center;background:#d9534f;'>Neispravan email ili lozinka</div>";
}
}

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
			<form method="get" action="" role="form">
				<div class="col-md-10">
					<input type="text" name="user_query" class="form-control"/>
				</div>
				<div class="col-md-2">			
					<input type="submit" name="search_header" value="Pretraga" class="btn btn-info"/>
				</div>
			</form>
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
				<form role="form" method='post'>
				<div class="form-group">
				  <label for="usr">Ime:</label>
				  <input type="text" class="form-control" name="reg_ime"/>
				</div>
				<div class="form-group">
				  <label for="usr">Prezime:</label>
				  <input type="text" class="form-control" name="reg_prezime"/>
				</div>
				<div class="form-group">
				  <label for="usr">E-mail:</label>
				  <input type="text" class="form-control" name="reg_email"/>
				</div>
				<div class="form-group">
				  <label for="pwd">Lozinka:</label>
				  <input type="password" class="form-control" name="reg_lozinka"/>
				</div>
				 <div class="form-group">
				  <input type="submit" class="btn btn-success" value="Potvrdi registraciju" name="reg_potvrda"/>
				</div>
		  </form>
		  </fieldset>
			</div>
		</div>
		<div class="col-md-12">
		</div>
		<div class="col-md-12" id="search">
		<form method="get" action="" role="form"><!--petraga preko select kontrole-->
			  <div class="col-md-5">
				  <select name="grad" class="form-control">
				  <?php foreach($gradovi as $grad){ ?>
				  <option value='<?php echo $grad->grad_id; ?>'><?php echo $grad->grad_naziv;} ?></option>";
				  </select>
			  </div>
			   <div class="col-md-5">
			  <select name="vrsta" class="form-control">
			<?php foreach($vrste as $vrsta){ ?>
						<option value='<?php echo $vrsta->vrsta_id; ?>'><?php echo $vrsta->vrsta_ime;} ?></option>
					
				
			  </select>
			  </div>
			
			  <div class="col-md-2">
				<input type="submit" name="search" class="btn btn-info" value="Pretraga"/>
			  </div>
		  </form>
		</div><!--pretraga-->
		<div class="col-md-12">
		<?php
			if(isset($_GET['search'])){
				$grad = $_GET['grad'];
				$vrsta = $_GET['vrsta'];
				$sql = Objekti::getAll("where objekat_grad=$grad and objekat_vrsta='$vrsta'");
				foreach($sql as $objekat){
					include "main.php";	
				}
			}
			if(isset($_GET['search_header'])){
				$search = $_GET['user_query'];
				$sql = Objekti::getAll("where objekat_ime like '%$search%'");
				foreach($sql as $objekat){
					include "main.php";
				}
			}
			if(isset($_GET['tip'])){
				$tip_id = $_GET['tip'];
				$sql = Objekti::getAll("where objekat_tip='$tip_id'");
				foreach($sql as $objekat){
					include "main.php";
				}
			}
			if(!isset($_GET['tip'])&&!isset($_GET['grad'])&&!isset($_GET['vrsta'])&&!isset($_GET['user_query'])){

							$sql = Objekti::getAll("order by objekat_id desc limit 0,12");
							foreach($sql as $objekat){
								include "main.php";
			}
				}
			?>
		</div>	
			<div class="col-md-12">
				
			</div>
		
	<div class="col-md-3" id="first_said"><!--registracija-->
	<?php if(isset($_SESSION['user_mail'])){
		 echo "<h4>Dobrodosli  " . $_SESSION['korisnik'] . " " . $_SESSION['prezime'] . "</h4>";
		 echo "<a href='logout.php' class='btn btn-primary'>Logout</a>";
	}else
	{
		echo '<h4>Login</h4>
			<form action="" method="post" role="form">
				<div class="form-group">
				  <label for="usr">E-mail:</label>
				  <input type="text" class="form-control" name="login_email">
				</div>
				<div class="form-group">
				  <label for="pwd">Lozinka:</label>
				  <input type="password" class="form-control" name="login_lozinka">
				</div>
				 <div class="form-group">
				  <input type="submit" class="btn btn-primary" value="Uloguj se" name="login_potvrda"/>
				  <button type="button" class="btn btn-primary" id="show">Registruj se</button>
				</div>
		  </form>
		  
		<hr>
		<p>Kao registrovani korisnik sajta rezervacije.rs ostvarujete mogucnost
		direktne rezervacije u svim restoranima,splavovima,klubovima, na svim manifestacijama i celokupnoj ponudi koju pruza nas sajt.
		Zelimo Vam ugodno surfovanje i sigurni smo da cemo Vam pomoci da uzivate i da se provedete.</p>
	';}?>
		<?php
		if(isset($_SESSION['user_mail'])){
			$ide = $_SESSION['id'];
			$rez_id = Rezervacije::getAll("where rez_korisnik_id = '$ide' order by rez_id desc limit 5");

			}
		
		if(isset($_SESSION['id'])){
			echo "<p style='text-align:left;padding-top:20px;'><u>Poslednje 5 rezervacije:</u></p>";
		foreach($rez_id as $id){
			echo "<ul><li style='font-size:9pt;'>" .$id->rez_objekat . " Datum: " . $id->rez_od . "</li></ul>";
		}}
	?>
		</div>
	</section>
</body>
</html>	
<!--login-->

