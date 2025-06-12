CREATE TABLE inteligencias_artificiales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  id_modelo INT NOT NULL,
  id_creador INT NOT NULL,
  id_aplicacion INT,
  id_lenguaje INT NOT NULL,
  id_interfaz INT NOT NULL,
  
  FOREIGN KEY (id_modelo) REFERENCES modelos_ia(id_modelo),
  FOREIGN KEY (id_creador) REFERENCES creadores(id_creador),
  FOREIGN KEY (id_aplicacion) REFERENCES aplicaciones(id_aplicacion),
  FOREIGN KEY (id_lenguaje) REFERENCES lenguajes_programacion(id_lenguaje),
  FOREIGN KEY (id_interfaz) REFERENCES interfaz_usuarios(id_interfaz)
);

2:

CREATE TABLE inteligencias_artificiales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  año_creacion INT(4) NOT NULL,
  id_plataforma INT NOT NULL,
  id_modelo INT NOT NULL,
  id_lenguaje INT NOT NULL,
  id_interfaz INT NOT NULL,
  id_aplicacion INT NOT NULL,
  
  FOREIGN KEY (id_modelo) REFERENCES modelos(id),
  FOREIGN KEY (id_plataforma) REFERENCES plataformas(id),
  FOREIGN KEY (id_aplicacion) REFERENCES aplicaciones(id),
  FOREIGN KEY (id_lenguaje) REFERENCES lenguajes(id),
  FOREIGN KEY (id_interfaz) REFERENCES interfaz_usuarios(id)
);

3:

INSERT INTO aplicaciones (aplicacion) VALUES
('Aisistente Virtual'),
('Reconocimiento de Img/Video'),
('Análisis de Sentimiento'),
('Recomendadores'),
('Vehículos Autónomos'),
('Chatbots'),
('PLN (Procesamiento de Lenguaje Natural)'),
('Detección de Fraude'),
('Medicina y Diagnóstico'),
('Optimización Industrial')
;

4:

INSERT INTO interfaces (interfaz) VALUES
('API (Interfaz de Programación de Aplicaciones)'),
('RESTful APIs'),
('WebSockets'),
('CLI (Interfaz de Línea de Comandos)'),
('GUI (Interfaz Gráfica de Usuario)')
;

5:

INSERT INTO lenguajes (lenguaje) VALUES
('Python'),
('R'),
('Java'),
('C++'),
('JavaScript'),
('Julia'),
('SQL')
;

6:

INSERT INTO modelos (modelo) VALUES
('Redes Neuronales Artificiales'),
('Máquinas de Soporte Vectorial (SVM)'),
('Árboles de Decisión'),
('K-Vecinos Más Cercanos (KNN)'),
('Modelos de Regresión'),
('Modelos Generativos (GANs)'),
('Modelos de Lenguaje (Transformers)')
;

