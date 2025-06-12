<?php
    ob_start();
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    $username = "root";
    $password = "";
    $servername = "localhost";
    $database = "ia";

    $conexion = new mysqli($servername, $username, $password, $database);
    if ($conexion->connect_error) {
        die("Conexion Fallida: " . $conexion->connect_error);
    }

    $sql_p = "SELECT id, plataforma FROM plataformas";
    $result_p = $conexion->query($sql_p);
    $sql_m = "SELECT id, modelo FROM modelos";
    $result_m = $conexion->query($sql_m);
    $sql_l = "SELECT id, lenguaje FROM lenguajes";
    $result_l = $conexion->query($sql_l);
    $sql_i = "SELECT id, interfaz FROM interfaces";
    $result_i = $conexion->query($sql_i);
    $sql_a = "SELECT id, aplicacion FROM aplicaciones";
    $result_a = $conexion->query($sql_a);

    
    {
        if($_SERVER["REQUEST_METHOD"]=="POST"){
            var_dump($_POST);//linea dedicada para depurar
            $nombre = $conexion->real_escape_string($_POST ["nombre"]);
            $año_creacion = $conexion->real_escape_string($_POST ["año_creacion"]);
            $plataforma = $conexion->real_escape_string($_POST ["id_plataforma"]);
            $modelo = $conexion->real_escape_string($_POST ["id_modelo"]);
            $lenguaje = $conexion->real_escape_string($_POST ["id_lenguaje"]);
            $interfaz = $conexion->real_escape_string($_POST ["id_interfaz"]);
            $aplicacion = $conexion->real_escape_string($_POST ["id_aplicacion"]);
        
            $sql_insert = "INSERT INTO inteligencias_artificiales (nombre, año_creacion, id_plataforma, id_modelo,
            id_lenguaje, id_interfaz, id_aplicacion)
            VALUES ('$nombre', '$año_creacion', '$plataforma', '$modelo', '$lenguaje', '$interfaz', '$aplicacion')";
        
            if ($conexion->query($sql_insert) === TRUE) {
                echo "<p class='success'>Nueva IA agregada con éxito</p>";
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            } else {
                echo "<p class='error'>Error al agregar la IA: " . $conexion->error . "</p>";
            }
        }
    }
    

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inteligencias Artificiales</title>
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
            <a class="navbar-brand in" href="/database/indexTOMAS.html" style="color: white;">Inicio</a>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="nav navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color: white;"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Unidad 1</a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/database/p1.php">Mostrar datos</a>
                            <a class="dropdown-item" href="/database/p2.php">Mostrar datos</a>
                            <a class="dropdown-item" href="/database/p3.php">Meter datos</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color: white;"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Unidad 2</a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/database/p4.php">Cuatro</a>
                            <a class="dropdown-item" href="/database/p5.php">Cinco</a>
                            <a class="dropdown-item" href="/database/p6.php">Seis</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" style="color: white;"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Unidad 3</a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/database/p7.php">Siete</a>
                            <a class="dropdown-item" href="/database/p8.php">Ocho</a>
                            <a class="dropdown-item" href="/database/p9.php">Nueve</a>
                        </div>
                    </li>
                    
                </ul>
            </div>
            
        </div>
    </nav>

    <div class="jumbotron">
        <h1 class="display-4" style="background: linear-gradient(to right, rgb(0, 121, 57), rgb(75, 238, 173), rgb(9, 177, 48));
        -webkit-background-clip: text;background-clip: text;color: transparent;">Datos de Inteligencias Artificiales (IA)</h1>
    </div>
    
    <div class="contenedor">
        <div class="container1">
        
        <form method="POST" id="formulario">
            <div class="form-group"><label for="nombre">Nombre: </label>
            <input type="text" id="nombre" name="nombre"required><br></div>
            <div class="form-group"><label for="año_creacion">Año de creacion: </label>
            <input type="text" id="año_creacion" name="año_creacion" required><br></div>
            
            <div class="form-group"><label for="plataforma">Plataforma: </label>
            <select name="id_plataforma" required>
            <option value="">Selecciona una plataforma</option>
            <?php
            if ($result_p->num_rows > 0) {
                while($row = $result_p->fetch_assoc()){
                    echo "<option value='" . $row["id"] . "'>" . $row["plataforma"] . "</option>";
                }
            }
            ?>
            </select></div>

            <div class="form-group"><label for="modelo">Modelo: </label>
            <select name="id_modelo" required>
                <option value="">Selecciona un modelo</option>
                <?php
                if ($result_m->num_rows > 0) {
                    while($row = $result_m->fetch_assoc()){
                        echo "<option value='" . $row["id"] . "'>" . $row["modelo"] . "</option>";
                    }
                }
                ?>
            </select></div>

            <div class="form-group"><label for="lenguaje">Lenguaje: </label>
            <select name="id_lenguaje" required>
                <option value="">Selecciona un lenguaje</option>
                <?php
                if ($result_l->num_rows > 0) {
                    while($row = $result_l->fetch_assoc()){
                        echo "<option value='" . $row["id"] . "'>" . $row["lenguaje"] . "</option>";
                    }
                }
                ?>
            </select></div>

            <div class="form-group"><label for="interfaz">Interfaz: </label>
            <select name="id_interfaz" required>
                <option value="">Selecciona una interfaz</option>
                <?php
                if ($result_i->num_rows > 0) {
                    while($row = $result_i->fetch_assoc()){
                        echo "<option value='" . $row["id"] . "'>" . $row["interfaz"] . "</option>";
                    }
                }
                ?>
            </select></div>

            <div class="form-group"><label for="aplicacion">Aplicacion: </label>
            <select name="id_aplicacion" required>
                <option value="">Selecciona algun uso</option>
                <?php
                if ($result_a->num_rows > 0) {
                    while($row = $result_a->fetch_assoc()){
                        echo "<option value='" . $row["id"] . "'>" . $row["aplicacion"] . "</option>";
                    }
                }
                ?>
            </select></div>

            <div class="form-group"><input type="submit" value="Agregar Dato Nuevo"></div>
        </form>

        <h2>Lista de IA' s</h2>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Año de creacion</th>
                <th>Plataforma</th>
                <th>Modelo</th>
                <th>Lenguaje</th>
                <th>Interfaz</th>
                <th>Aplicacion (Uso)</th>
            </tr>
            <?php
            $sql = "SELECT
            ia.id,
            ia.nombre,
            ia.año_creacion,
            p.plataforma,
            m.modelo,
            l.lenguaje,
            i.interfaz,
            a.aplicacion
            FROM inteligencias_artificiales ia
            JOIN plataformas p ON ia.id_plataforma = p.id
            JOIN modelos m ON ia.id_modelo = m.id
            JOIN lenguajes l ON ia.id_lenguaje = l.id
            JOIN interfaces i ON ia.id_interfaz = i.id
            JOIN aplicaciones a ON ia.id_aplicacion = a.id";
            $resultado = $conexion->query($sql);
            if ($resultado->num_rows > 0) {
                while($row = $resultado->fetch_assoc()){
                    echo "<tr>
                    <td>" . $row['id'] . "</td>
                    <td>" . $row['nombre'] . "</td>
                    <td>" . $row['año_creacion'] . "</td>
                    <td>" . $row['plataforma'] . "</td>
                    <td>" . $row['modelo'] . "</td>
                    <td>" . $row['lenguaje'] . "</td>
                    <td>" . $row['interfaz'] . "</td>
                    <td>" . $row['aplicacion'] . "</td>
                    </tr>";
                };
            }   else{
                echo "<tr><td coldspan='11'>No hay datos registrados</td></tr>";
            }
            ?>
            </table>
        </div>
    </div>
</body>
<!--"ctr k" + "ctrl t"-->
</html>
