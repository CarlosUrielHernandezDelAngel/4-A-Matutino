CREATE TABLE alumnos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  numero_control VARCHAR(10) UNIQUE NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido_paterno VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50),
  id_edad INT NOT NULL,
  id_colonia INT NOT NULL,
  id_especialidad INT NOT NULL,
  id_genero INT NOT NULL,
  correo VARCHAR(15) UNIQUE,
  telefono VARCHAR(15),
  fecha_ingreso DATE NOT NULL,
  FOREIGN KEY (id_edad) REFERENCES edades(id),
  FOREIGN KEY (id_colonia) REFERENCES colonias(id),
  FOREIGN KEY (id_especialidad) REFERENCES especialidades(id),
  FOREIGN KEY (id_genero) REFERENCES generos(id)
  );




2:



  CREATE TABLE edades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    edad INT NOT NULL UNIQUE
    );
CREATE TABLE colonias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_colonia VARCHAR(100) UNIQUE NOT NULL
    );
CREATE TABLE especialidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_especialidad VARCHAR(100) UNIQUE NOT NULL
    );
CREATE TABLE generos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_genero VARCHAR(50) UNIQUE NOT NULL
    );





3:





INSERT INTO edades (edad) VALUES (14), (15), (16), (17), (18), (19);



4:



INSERT INTO colonias (nombre_colonia) VALUES
('Jarachina Norte'), ('Jarachina Sur'), ('Granjas'),
('Vista Hermosa'), ('Esfuerzo'), ('Freznos'),
('Progreso'), ('Bugambilias'), ('Ventura'), ('Loma
Real'), ('Campestre'), ('Vista Alta');



5:



INSERT INTO generos (nombre_genero) VALUES ('Hombre'), ('Mujer'), ('Otro');


6:




INSERT INTO `especialidades` (`id`, `nombre_especialidad`) VALUES
(4, 'Administracion De Recursos Humanos'),
(5, 'CiberSeguridad'),
(9, 'Comercio Internacional'),
(7, 'Construccion'),
(10, 'Hoteleria'),
(6, 'Logistica'),
(3, 'Mantenimiento De Computo'),
(2, 'Mantenimiento Industrial'),
(8, 'Mecatronica'),
(1, 'Programacion');

