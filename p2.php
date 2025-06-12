<?php
    ob_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carlos Uriel (NPC)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="StyleUniversal.css">
    <link rel="stylesheet" href="StyleTable.css">


</head>

<body>
    <nav class="navbar navbar-light navbarBg">
        <div class="container">
            <a class="navbar-brand in" href="/database/index.html" style="color: white;">Inicio</a>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="nav navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="font-menu nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color: white;"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Unidad 1</a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="hola dropdown-item" href="/database/p1.php">Página 1</a>
                            <a class="dropdown-item" href="/database/p2.php">Página 2</a>
                            <a class="dropdown-item" href="/database/p3.php">Página 3</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color: white;"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Unidad 2</a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/database/p4.php">Página 4</a>
                            <a class="dropdown-item" href="/database/p5.php">Página 5</a>
                            <a class="dropdown-item" href="/database/p6.html">Página 6</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color: white;"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Unidad 3</a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/database/p7.html">Página 7</a>
                            <a class="dropdown-item" href="/database/p8.html">Página 8</a>
                            <a class="dropdown-item" href="/database/p9.html">Página 9</a>
                        </div>
                    </li>

                    
                </ul>
            </div>
            

        </div>
    </nav>

    <div class="jumbotron">

    
        <h1  class="display-4" style="background: linear-gradient(to right, rgb(0, 121, 57), rgb(75, 238, 173), rgb(9, 177, 48));
        -webkit-background-clip: text;background-clip: text;color: transparent;">Mostrar Datos</h1>

        
        
        <h2 class="display-4">DATOS DE ESTUDIANTES UNIVERSITARIOS</h2>
        
        
        <div class="container1">

        <?php
        $username = "root";
        $password = "";
        $servername = "localhost";
        $database = "database";

        $conexion = new mysqli($servername, $username, $password, $database);
        if ($conexion->connect_error) {
            die("Conexion Fallida: " . $conexion->connect_error);
        }

        function insertarPersonaje($conexion){

        if($_SERVER["REQUEST_METHOD"]=="POST") {

            var_dump($_POST);
            $Nombre = $conexion->real_escape_string($_POST ["Nombre"]);
            $Apellido = $conexion->real_escape_string($_POST ["Apellido"]);
            $Apodo = $conexion->real_escape_string($_POST ["Apodo"]);
            $Peso = $conexion->real_escape_string($_POST ["Peso"]);
            $Altura = $conexion->real_escape_string($_POST ["Altura"]);
            $Rango = $conexion->real_escape_string($_POST ["Rango"]);
            $Universidad = $conexion->real_escape_string($_POST ["Universidad"]);

            $sql = "INSERT INTO personas (Nombre, Apellido, Apodo, Peso, Altura, Rango, Universidad) 
            VALUES ('$Nombre', '$Apellido', '$Apodo', '$Peso', '$Altura', '$Rango', '$Universidad')";
            if($conexion->query($sql)==TRUE){
                echo "<p class='success'>Nuevo nombre agregado con exito. </p>";
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();     
            }else{
                echo "<p class='error'>error al egregar nombre:" . $conexion->error . "</p>";
            }
        }
    } insertarPersonaje($conexion);

        //Mostrar Datos
        $sql = "SELECT * FROM personas";
        $resultado = $conexion->query($sql);


        if ($resultado->num_rows >0) {
            echo "<table class= 'table table-bordered'>";
            echo "<tr><th>id</th><th>Nombre</th><th>Apellido</th><th>Apodo</th><th>Peso</th>
            <th>Altura</th><th>Rango</th><th>Universidad</th></tr>";
            while($row = $resultado->fetch_assoc()){
                echo "<tr><td>" . $row["id"] . "</td><td>" . $row["Nombre"] . "</td><td>" . $row["Apellido"] . "</
                td><td>" . $row["Apodo"] . "</td><td>" . $row["Peso"] . "</td><td>" . $row["Altura"] . "</
                td><td>" . $row["Rango"] . "</td><td>" . $row["Universidad"] . "</td></tr>";
            }
            echo "</table>";
        }   else{
            echo "<p>No se encontraron registros en la base de datos</p>";
        }
        $conexion->close();
        ?>
    </div>
</body>
<!--"ctr k" + "ctrl t"-->
</html>
