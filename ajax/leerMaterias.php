<?php
	// include Database connection file 
	include("db_connection.php");

	// Design initial table header 
	$data = '<table class="table table-bordered table-striped">
						<tr>
							<th>No. Materia</th>
							<th>Materia</th>
							<th>Núm. Créditos</th>
							<th>nHT</th>
                            <th>nHP</th>
						</tr>';

	$query = "SELECT * FROM materia";

	if (!$result = mysqli_query($con, $query)) {
        exit(mysqli_error($con));
    }

    // if query results contains rows then featch those rows 
    if(mysqli_num_rows($result) > 0)
    {
    	$number = 1;
    	while($row = mysqli_fetch_assoc($result))
    	{
    		$data .= '<tr>
				<td>'.$number.'</td>
				<td>'.$row['nCveMateria'].'</td>
				<td>'.$row['sNombreMateria'].'</td>
				<td>'.$row['nCreditos'].'</td>
                <td>'.$row['nHT'].'</td>
				<td>'.$row['nHP'].'</td>
    		</tr>';
    		$number++;
    	}
    }
    else
    {
    	// records now found 
    	$data .= '<tr><td colspan="6">No hay registros!</td></tr>';
    }

    $data .= '</table>';

    echo $data;
?>