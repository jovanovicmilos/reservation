<div class='content'>
		<img src='admin/a_images/<?php echo $objekat->objekat_slika;?>' style='float:right;'/>
		<h4><?php echo $objekat->objekat_ime;?></h4>
		<div class='read-more'><?php echo $objekat->objekat_opis;?></div><br/>
		<p>Radno vreme: <?php echo $objekat->objekat_radnovreme; ?> <br/>Adresa: <?php echo $objekat->objekat_adresa;?><br/>Telefon: <?php echo $objekat->objekat_telefon;?></p>
		<div class='btn-group'>
		  <a href='../rezervacije/re_cenovnik/<?php echo $objekat->objekat_cenovnik;?>' type='button' class='btn btn-primary'>Cenovnik</a>
		  <?php if(isset($_SESSION['user_mail'])){
		  echo "<a href='reservation.php?objekat={$objekat->objekat_id}' type='button' class='btn btn-primary'>Rezervisi</a>";
	} ?>
		  
		</div><hr style='margin-top:35px;border:1px solid #07a1f2;'></div>
