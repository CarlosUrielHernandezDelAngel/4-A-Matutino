<?php
    $username = "root";
    $password = "";
    $servername = "localhost";
    $database = "exe";

    $conexion = new mysqli($servername, $username, $password, $database);
    if ($conexion->connect_error) {
        die("Conexion Fallida: " . $conexion->connect_error);
    }

    if($_SERVER["REQUEST_METHOD"]=="POST"){

        $nombre = $_POST["nombre"];
        $precio = $_POST["precio"];
        $id_categoria = $_POST["categoria"];
        $sql = "INSERT INTO productos (nombre, precio, id_categoria)
        VALUES ('$nombre', '$precio', '$id_categoria')";
        if ($conexion->query($sql) == TRUE) {
            echo "<p style='color: Green';>producto agregado correctamente</p>";
        }else {
            echo "<p class='error'>Error al agregar al alumno: " . $conexion->error . "</p>";
        }
    }
    $sql_categorias = "SELECT * FROM categorias";
    $result_categorias = $conexion->query($sql_categorias);
?>

<html>
    <head>
        <title>
            Pagina del profe que es aparte pero igual es una pagina del profe.
        </title>

        <link rel="stylesheet" href="StyleTable.css">
        <link rel="stylesheet" href="StyleUniversal.css">
    </head>
    <body>
        <h1>Registrar nuevos productos</h1>
        <div class="container1">
            <form method ="POST">
            <label>nombre del producto: </label>
            <input type="text" name="nombre" required><br></br>
            <label>precio: </label>
            <input type="number" name="precio" required><br></br>
            <label>categoria: </label>
            <select name="categoria" required >
            <option value="">seleccionar categoria</option>
            <?php
            if ($result_categorias->num_rows > 0) {
                while($row = $result_categorias->fetch_assoc()){
                    echo "<option value='" . $row["id"] . "'>" . $row["nombre"] . "</option>";
                }
            }
            ?>
            </select><br></br>
            <input type="submit" value="Agregar producto">
        </form>
        </div>
        
        <h2>Lista de Productos</h2>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Categoria</th>
            </tr>
            <?php
            $sql_productos = "SELECT productos.nombre, productos.precio, categorias.nombre AS 
            categoria
            FROM productos 
            JOIN categorias ON productos.id_categoria = categorias.id";
            
            
            $result_productos = $conexion->query($sql_productos);
            if($result_productos->num_rows>0){
                while($row = $result_productos->fetch_assoc()){
                    echo "<tr>
                    <td>{$row['nombre']}</td>
                    <td>{$row['precio']}</td>
                    <td>{$row['categoria']}</td>
                    </tr>";
                }
            } else {
                echo "<tr>No hay productos registrados</tr>";
            }

            ?>
        </table>
    </body>
</html>