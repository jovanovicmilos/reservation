<?php
	require "../config.php"; 
	$tipovi = Tip::getAll();
	$gradovi = Grad::getAll();
	$vrste = Vrsta::getAll();
	$objekat_get = Objekti::getAll();
	$objekat = new Objekti;
?>

<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="style.css"/>
	<link href='https://fonts.googleapis.com/css?family=Alegreya+Sans:400,700,500|Titillium+Web' rel='stylesheet' type='text/css'><link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
<section>
<!--FORMA ZA DODAVANJE-->
		<form action="insert.php" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group">
			<table class="table" border="1" style="width:800px;margin:0 auto;";>
    <thead>
      <tr>
        <th colspan="2" style='background:#428bca;color:#fff;'><h3>Forma za dodavanje novog objekta</h3></th>
        </tr>
    </thead>
    <tbody>
      <tr>
        <td>Grad</td>
        <td>
		<select name="objekat_grad" class="form-control">
		<option>Odaberi grad</option>
		<?php foreach($gradovi as $grad){ ?>
				  <option value='<?php echo $grad->grad_id; ?>'><?php echo $grad->grad_naziv;} ?></option>";
				  
	</select>
		</td>
        </tr>
		<tr>
			<td>Tip</td>
			<td>
				<select name="objekat_tip" class="form-control">
				<option>Odaberi tip</option>
				<?php foreach($tipovi as $tip){?>
				<option value=<?php echo $tip->tip_id;?>><?php echo $tip->tip_ime;}?></option>
	
			     </select>
			</td>
		    </tr>
	  <tr>
        <td>Vrsta objekta</td>
        <td>
		<select name="objekat_vrsta" class="form-control">
		<option>Odaberi vrstu</option>
		<?php foreach($vrste as $vrsta){ ?>
		<option value='<?php echo $vrsta->vrsta_id; ?>'><?php echo $vrsta->vrsta_ime;} ?></option>
	</select>
		</td>
      </tr>
	<tr>
		<td>Ime objekta: </td>
		<td><input type="text" name="objekat_ime" size="85"/></td>
	</tr>
	<tr>
		<td>Radno vreme: </td>
		<td><input type="text" name="objekat_radnovreme" size="85"/></td>
	</tr>
	<tr>
	<td>Opis objekta: </td>
	<td><textarea name="objekat_opis" cols="85" rows="10"></textarea></td>
</tr>
<tr>
	<td>Slika: </td>
	<td><input type="file" name="objekat_slika"/></td>
</tr>
<tr>
	<td>Cenovnik: pdf/docx</td>
	<td><input type="file" name="objekat_cenovnik"/></td>
</tr>
<tr>
	<td>Adresa, Postanski broj, Grad: </td>
	<td><input type="text" name="objekat_adresa" size="85"/></td>
</tr>
<tr>
	<td>Broj Telefona: </td>
	<td><input type="text" name="objekat_telefon" size="85"/></td>
</tr>
<tr align="center">
	<td colspan="2"><input type="submit" name="insert" value="Dodaj" class="btn btn-primary" style="width:200px;"/></td>
</tr>
    </tbody>
  </table>
		</div>
		</form><br/>
		<!--FORMA ZA BRISANJE-->
		<form action="insert.php" method="get" enctype="multipart/form-data" role="form">
		<div class="form-group">
			<table class="table" border="1" style="width:800px;margin:0 auto;";>
    <thead>
      <tr>
        <th colspan="2" style='background:#428bca;color:#fff;'><h3>Forma za brisanje objekta</h3></th>
        </tr>
    </thead>
    <tbody>
      <tr>
        <td>Objekti</td>
        <td>
		<select name="objekat_naziv" class="form-control">
		<option>Odaberi objekat</option>
		<?php foreach($objekat_get as $obj){ ?>
		<option value='<?php echo $obj->objekat_id; ?>'><?php echo $obj->objekat_ime;} ?></option>";		  
		</select>
		</td>
        </tr>
		<tr align="center">
		<td colspan="2"><input type="submit" name="delete" value="Obrisi" class="btn btn-primary" style="width:200px;"/></td>
		</tr>

    </tbody>
  </table>
		</div>
		</form>
</section>
</body>
</html>	
<?php
	if(isset($_POST['insert'])){
		
		
		$objekat->objekat_grad = $_POST['objekat_grad'];
		$objekat->objekat_tip = $_POST['objekat_tip'];
		$objekat->objekat_vrsta = $_POST['objekat_vrsta'];
		$objekat->objekat_ime = $_POST['objekat_ime'];
		$objekat->objekat_radnovreme = $_POST['objekat_radnovreme'];
		$objekat->objekat_opis = $_POST['objekat_opis'];
		$objekat->objekat_adresa = $_POST['objekat_adresa'];
		$objekat->objekat_telefon = $_POST['objekat_telefon'];
		
		$objekat->objekat_cenovnik = $_FILES['objekat_cenovnik']['name'];
		$objekat_cenovnik_tmp = $_FILES['objekat_cenovnik']['tmp_name'];
		
		move_uploaded_file($objekat_cenovnik_tmp,"../re_cenovnik/$objekat->objekat_cenovnik");
		
		$objekat->objekat_slika = $_FILES['objekat_slika']['name'];
		$objekat_slika_tmp = $_FILES['objekat_slika']['tmp_name'];
		
		move_uploaded_file($objekat_slika_tmp,"a_images/$objekat->objekat_slika");
		$objekat->insert();
		
	}
?>
<?php
	if(isset($_GET['delete'])){
		$objekat->objekat_id = $_GET['objekat_naziv'];
		$objekat->del($objekat->objekat_id);
	}
?>
