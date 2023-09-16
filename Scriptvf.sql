create schema vf;

CREATE TABLE vf.marca (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE vf.grupo_empresarial (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE vf.modelo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca_id INT,
    grupo_empresarial_id INT,
    FOREIGN KEY (marca_id) REFERENCES vf.marca(id),
    FOREIGN KEY (grupo_empresarial_id) REFERENCES vf.grupo_empresarial(id)
);

CREATE TABLE vf.color (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE vf.aseguradora (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    moneda VARCHAR(50) NOT NULL
);

CREATE TABLE vf.coche (
    matricula VARCHAR(15) PRIMARY KEY,
    modelo_id INT,
    color_id INT,
    fecha_compra DATE NOT NULL,
    aseguradora_id INT,
    poliza_numero VARCHAR(20) NOT NULL,
    fecha_alta_seguro DATE,
    kilometros_totales DECIMAL(10, 2),
    FOREIGN KEY (modelo_id) REFERENCES vf.modelo(id),
    FOREIGN KEY (color_id) REFERENCES vf.color(id),
    FOREIGN KEY (aseguradora_id) REFERENCES vf.aseguradora(id)
);

CREATE TABLE vf.revision (
    id SERIAL PRIMARY KEY,
    coche_matricula VARCHAR(15),
    importe_revision DECIMAL(10, 2),
    moneda VARCHAR(50),
    kms_revision DECIMAL(10, 2),
    fecha_revision DATE,
    FOREIGN KEY (coche_matricula) REFERENCES vf.coche (matricula)
    );


-- Insertar datos en la tabla 'vf.marca'
INSERT INTO vf.marca (nombre) VALUES
    ('Marca A'),
    ('Marca B'),
    ('Marca C');

-- Insertar datos en la tabla 'vf.grupo_empresarial'
INSERT INTO vf.grupo_empresarial (nombre) VALUES
    ('Grupo 1'),
    ('Grupo 2'),
    ('Grupo 3');

-- Insertar datos en la tabla 'vf.modelo'
INSERT INTO vf.modelo (nombre, marca_id, grupo_empresarial_id) VALUES
    ('Modelo 1', 1, 1),
    ('Modelo 2', 1, 2),
    ('Modelo 3', 2, 1);

-- Insertar datos en la tabla 'vf.color'
INSERT INTO vf.color (nombre) VALUES
    ('Rojo'),
    ('Azul'),
    ('Verde');

-- Insertar datos en la tabla 'vf.aseguradora'
INSERT INTO vf.aseguradora (nombre, moneda) VALUES
    ('Aseguradora 1', 'Dólar'),
    ('Aseguradora 2', 'Euro'),
    ('Aseguradora 3', 'Libra');

-- Insertar datos en la tabla 'vf.coche'
INSERT INTO vf.coche (matricula, modelo_id, color_id, fecha_compra, aseguradora_id, poliza_numero, fecha_alta_seguro, kilometros_totales) VALUES
    ('ABC123', 1, 1, '2023-01-15', 1, 'Poliza123', '2023-01-20', 50000.50),
    ('XYZ789', 2, 2, '2023-02-20', 2, 'Poliza456', '2023-02-25', 60000.75),
    ('DEF456', 3, 3, '2023-03-10', 3, 'Poliza789', '2023-03-15', 75000.25);

----Insertar datos en la tabla 'vf.revision'
INSERT INTO vf.revision (coche_matricula, importe_revision, moneda, kms_revision, fecha_revision) VALUES
    ('ABC123', 100.00, 'Dólar', 50500.25, '2023-05-10'),
    ('XYZ789', 120.50, 'Euro', 60100.75, '2023-06-15'),
    ('DEF456', 90.75, 'Libra', 75200.50, '2023-07-20');
   --Según la practiica una consulta SQL para el siguiente listado de coches activo de keepcoding:
   -- Nombre modelo, marca y grupo de coches
   --Fecha de Compra
   --Matricula
   --Nombre del color de coche
   --Total Kilometros
   Nombre
   

SELECT
    vf.modelo.nombre AS "Nombre del Modelo",
    vf.marca.nombre AS "Nombre de la Marca",
    vf.grupo_empresarial.nombre AS "Nombre del Grupo",
    vf.coche.fecha_compra AS "Fecha de Compra",
    vf.coche.matricula AS "Matrícula",
    vf.color.nombre AS "Nombre del Color",
    vf.coche.kilometros_totales AS "Total de Kilómetros",
    vf.aseguradora.nombre AS "Nombre de la Aseguradora",
    vf.coche.poliza_numero AS "Número de Póliza"
FROM
    vf.modelo
JOIN vf.marca ON vf.modelo.marca_id = vf.marca.id
JOIN vf.grupo_empresarial ON vf.modelo.grupo_empresarial_id = vf.grupo_empresarial.id
JOIN vf.coche ON vf.modelo.id = vf.coche.modelo_id
JOIN vf.color ON vf.coche.color_id = vf.color.id
JOIN vf.aseguradora ON vf.coche.aseguradora_id = vf.aseguradora.id;





   