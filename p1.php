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
            <a class="navbar-brand in" href="/database/MainP.html" style="color: white;">Inicio</a>

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

        <?php
        $username = "root";
        $password = "";
        $servername = "localhost";
        $database = "database";

        $conexion = new mysqli($servername, $username, $password, $database);
        if ($conexion->connect_error) {
            die("Conexion Fallida: " . $conexion->connect_error);
        }
        $sql = "SELECT * FROM `personas`"; //aqui agregan el nombre de la tabla que estqn usando//
        $resultado = $conexion->query($sql);
        ?>

        <div class = "container">
            <h2 class="display-4">DATOS DE ESTUDIANTES UNIVERSITARIOS</h2>

            <?php if($resultado->num_rows >0):?>
                <table>
                    <tr>
                        <th>id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Apodo</th>
                        <th>Peso</th>
                        <th>Altura</th>
                        <th>Rango</th>
                        <th>Universidad</th>
                    </tr>

                    <?php while ($fila = $resultado->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $fila['id']; ?></td>
                        <td><?php echo $fila['Nombre']; ?></td>
                        <td><?php echo $fila['Apellido']; ?></td>
                        <td><?php echo $fila['Apodo']; ?></td>
                        <td><?php echo $fila['Peso']; ?></td>
                        <td><?php echo $fila['Altura']; ?></td>
                        <td><?php echo $fila['Rango']; ?></td>
                        <td><?php echo $fila['Universidad']; ?></td>
                    </tr>
                    <?php endwhile; ?>
                </table>
                <?php else: ?>
                    <p>No se encontraron los estudiantes</p>
                <?php endif; ?>
        </div>

    </div>

</body>
</html>