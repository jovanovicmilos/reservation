<?php
class Connection
{
	private static $conn = null;
	public static function getConnection()
	{
		if(!self::$conn){
			self::$conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME);
		}return self::$conn;
	}
}
	
?>