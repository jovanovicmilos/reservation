<?php

abstract class Methods
{
	static function get($id)
	{
		$className = get_called_class();
		$conn = Connection::getConnection();
		$tableName = static::$tableName ;
		$keyCol = static::$keyColumn;
		$r = mysqli_query($conn,"select * from {$tableName} where {$keyCol} = {$id}");
		$clanak = mysqli_fetch_object($r,$className);
		return $clanak;
		
	}
	static function getAll($filter="")
	{
		$conn = Connection::getConnection();
		$className = get_called_class();
		$tableName = static::$tableName;
		$r = mysqli_query($conn, "select * from {$tableName} {$filter} ");
		$res = array();
		while($rw=mysqli_fetch_object($r,$className))
		{
			$res[] = $rw;
		}
		return $res;
	}
	static function del($id)
	{
		$conn = Connection::getConnection();
		$tableName = static::$tableName;
		$keyCol = static::$keyColumn;
		mysqli_query($conn, "delete from {$tableName} where {$keyCol}={$id}");
	}
	function insert()
	{
		$conn = Connection::getConnection();
		$tableName = static::$tableName;
		$q  = "insert into {$tableName} (";
		$vars="";
		foreach($this as $k=>$v)
		{
			if(static::$keyColumn==$k){
				continue;
			}
			$q.=$k . ",";
			$vars.="'".$v."',";
		}
		$q = trim($q,",");
		$vars = trim($vars,",");
		$q.= ") values ({$vars})";

		mysqli_query($conn, $q);
		}
    function update()
	{
		$conn = Connection::getConnection();
		$tableName = static::$tableName;
		$keyCol = static::$keyColumn;
		$q = "update {$tableName} set ";
		foreach($this as $k=>$v)
		{
			if(static::$keyColumn==$k){
				continue;
			}
			$q.= $k."='".$v."',";
			
		}
		$q = trim($q,",");
		$q.=" where {$keyCol}=" . $this->$keyCol;
		echo $q;
		mysqli_query($conn,$q);
	}
	
}


?>