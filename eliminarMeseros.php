<!DOCTYPE html>

<html lang="es">

<head>

	<meta charset="UTF-8">

	<title>Meseros</title>

<style type="text/css">
    .container_base {
      width:100%;
    }
    .left {
      width:50%;
      float:left;
    }
    .right {
      width:50%;
      float:right;
    }
    .tbl-content,.tbl-header{
    	width:90%;
    }
</style>
	

		<link rel='stylesheet' type='text/css' href='css/formularios.css' />
        <link rel='stylesheet' type='text/css' href='css/menu.css' />
        <link rel='stylesheet' type='text/css' href='css/consulta.css' />

</head>
<?php
$timezone="America/Mexico_City";
$dt=new datetime("now",new datetimezone($timezone));
$hoy = gmdate("Y-m-d",(time()+$dt->getOffset()));
$hora = gmdate("h:i a",(time()+$dt->getOffset()));

$host="localhost";
$user="root";
$password="CETIcolomos";
$linck = mysqli_connect ($host,$user,$password) or die ("No se puede conectar");
mysqli_set_charset($linck,'utf8');
$NombreBD="ordena";
mysqli_select_db($linck,$NombreBD);


echo"<body>

<nav class='menu'>
	  <ol>
	  	<li class='menu-item'><a href='#0'>Inicio</a></li>
	   	<li class='menu-item'><a href='#0'>Ventas</a></li>
	   	<li class='menu-item' style='background-color:#000'><a href='#0' style='color:#fff'>Meseros</a></li>
	   	<li class='menu-item'><a href='#0'>Mesas</a></li>
	   	<li class='menu-item'><a href='#0'>Menú</a></li>
	   	<li class='menu-item'><a href='#0'>Usuario</a>
		  
		</li>
	  </ol>
	</nav>

<div class='container_base'>
				   <div class='left'>
				   <br><nav class='menu'>
	  <ol>
	  	<li class='menu-item'><a href='agregarMeseros.php'>Agregar</a></li>
	   	<li class='menu-item'><a href='editarMeseros.php'>Editar</a></li>
	   	<li class='menu-item' style='background-color:#000'><a href='eliminarMeseros.php' style='color:#fff'>Eliminar</a></li>

	  </ol>
	</nav>";
	if(isset($_POST['adiosvaquero'])){
				    	$adios = $_POST['adiosvaquero'];
				    	if($adios==0){
				    		echo "<script language='javascript'>"; 
							echo "alert('Seleccione a un mesero.')";
							echo "</script>";
				    	}
				    	else{
				    		$reg=mysqli_query($linck,"DELETE FROM `meseros` WHERE `id_mesero` = '$adios';");
							echo "<script language='javascript'>"; 
							echo "alert('El mesero se ha ELIMINADO exitosamente.')";
							echo "</script>";
				    	}
				    }

									if(isset($_POST['estatus'])){
										$consulta2=mysqli_query($linck,"SELECT * FROM `meseros`;");
										while ($row = mysqli_fetch_array($consulta2)){
											$estatus = $_POST['estatus'];
								            $identurno = $row['id_mesero'];
								            $valor = 0;
								            if(isset($estatus[$identurno])){
								            	$valor = 1;
								            }
								            else{
								            	$valor = 0;
								            }
								            $consulta3=mysqli_query($linck,"UPDATE `meseros` SET `disponibilidad` = '$valor' WHERE `id_mesero` = '$identurno';");
										}
										/*echo "<script language='javascript'>"; 
										echo "alert('Los cambios han sido GUARDADOS.')";
										echo "</script>";*/
						            }
						            else{
						            	if(isset($_POST['confirmar'])){
						            		$consulta2=mysqli_query($linck,"SELECT * FROM `meseros`;");
						            		while ($row = mysqli_fetch_array($consulta2)){
									            $identurno = $row['id_mesero'];
									            $valor = 0;
									            $consulta3=mysqli_query($linck,"UPDATE `meseros` SET `disponibilidad` = '$valor' WHERE `id_mesero` = '$identurno';");
											}
											/*echo "<script language='javascript'>"; 
											echo "alert('Los cambios han sido GUARDADOS.')";
											echo "</script>";*/
						            	}
						            }

				   		echo"<div class='container'>
						  <form action='eliminarMeseros.php' method='post' enctype='multipart/form-data'>
						    <div class='row'>
						      <h4>Eliminar mesero</h4>
							       <div class='input-group input-group-icon' style='text-align:center'>
							       </div>
						      <div class='input-group input-group-icon'>
									<select name='adiosvaquero'>
									<option selected value='0'> Selecciona al mesero </option>";
									$consulta2=mysqli_query($linck,"SELECT * FROM `meseros` ORDER BY id_mesero;");
								      while ($row = mysqli_fetch_array($consulta2)){
								      	echo"
								      	<option value='".$row['id_mesero']."'>".$row['nombre']."</option>";
								        }
									echo"</select>
						        <div class='input-icon'><i class='fa fa-envelope'></i></div>
						      </div><br><br><br>
						      
						      	<input name='eliminar' type='submit' id='accionform' value='Eliminar'>
						    	
						    </div>
						  </form>
						</div>
						
				   </div>
				   <div class='right'>
				   
				   	<div class='tbl-header'>
					    <table cellpadding='0' cellspacing='0' border='0'>
					      <thead>
					        <tr>
					          <th style='color:#fff; width:30%;'>Nombre</th>
					          <th style='color:#fff; width:40% '>Mesas atendidas</th>
						  <th style='color:#fff; width:30%;'>Habilitar o deshabilitar mesero</th>
					        </tr>
					      </thead>
					    </table>
					  </div>
					  <div class='tbl-content' style='height:450px;'>
					    <table cellpadding='0' cellspacing='0' border='0'>
					      <tbody>";
					      $consulta=mysqli_query($linck,"SELECT * FROM `meseros` ORDER BY id_mesero;");
					      while ($row = mysqli_fetch_array($consulta)){
					      	echo"
					            <tr class='cuerpo'>
						            <td style='width:211px'><center>".$row['nombre']."</center></td>
						            <td style='width:331px'><center></center></td>
						            <td style='width:210px'><center>
						            <form method='POST'>";
						            if($row['disponibilidad']==1){
						            	echo"<input checked='true' name='estatus[".$row['id_mesero']."]' type='checkbox'/></center></td>";
						            }
						            else{
						            	echo"<input name='estatus[".$row['id_mesero']."]' type='checkbox'/></center></td>";
						            }
					            echo"</tr>";
					         }
					 echo"
					 </tbody>
					 <input type='submit' name='confirmar' value='Guardar cambios' id='accionform' />
						            </form>
					    </table>
					  </div>
			
				   </div>
				   
			</div>

</body>";

mysqli_close($linck);
?>

</html>