<?php
    //funcion para el tamaño de la consulta
 	  function totalQuery($conexion){
    	
		
    		$total_query="SELECT COUNT(*) AS TOTAL FROM NOTICIAS";
			$stmt=$conexion->query($total_query);
			$result=$stmt->fetch();
			$total=$result['TOTAL'];
			return (int)$total;
		
    }
	
	
	//funcion de paginación
	function paginatedQuery($conexion,$page_num,$page_size){
		$first=($page_num-1)*$page_size+1;
		$last=$page_num*$page_size;
		$paged_query="SELECT * FROM(SELECT ROWNUM RNUM, AUX.* FROM (SELECT * FROM NOTICIAS ORDER BY ROWID DESC ) AUX WHERE ROWNUM<= :last) WHERE RNUM>= :first";
		$stmt=$conexion->prepare($paged_query);
		$stmt->bindParam(':first', $first);
		$stmt->bindParam(':last', $last);
		$stmt-> execute();
		return $stmt;
		
	}
	
?>