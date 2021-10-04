<?php
	// include Database connection file 
	include("db_connection.php");

	// Design initial table header 
	$data = '<table class="table table-bordered table-striped">
						<tr>
							<th>No.</th>
							<th>Cve</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th style="width:650px>Operaciones</th>
							<th></th>
						</tr>';

	$query = "SELECT * FROM usuario";

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
				<td>'.$row['cve'].'</td>
				<td>'.$row['sNombre'].'</td>
				<td>'.$row['sApePat'].'</td>
				<td>
					<button onclick="GetUserDetails('.$row['cve'].')" class="btn btn-warning"><i class="fas fa-edit"></i>Actualizar</button>
				</td>
				<td>
					<button onclick="DeleteUser('.$row['cve'].')" class="btn btn-danger"><i class="far fa-trash-alt"></i>Borrar</button>
				</td>
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