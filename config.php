<?php
//definisem server i direktorijum
define("APP_DIR", "c:/wamp/www/rezervacije/");
define("DBHOST","localhost"); 
define("DBUSER","root"); 
define("DBPASS",""); 
define("DBNAME","rezervacije");

function __autoload($className){
	require_once "classes/{$className}.class.php";
} 


?>
