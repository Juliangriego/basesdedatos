CREATE DATABASE empresa;
USE empresa;
CREATE TABLE IF NOT EXISTS personas (
    id_personas int NOT NULL auto_increment, 
    dni int not null,
    apyn varchar(20),
    telefono int(20),
    PRIMARY KEY (id_personas)
);

CREATE TABLE facturas(
    n_factura int, 
    total int, 
    id_clientes int,
    PRIMARY KEY (n_factura),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes)
);

CREATE TABLE clientes(
    id_clientes int,
    id_personas int,
    tarjeta int, 
    credito int, 
    PRIMARY KEY (id_clientes),
    FOREIGN KEY (id_personas) REFERENCES personas(id_personas)
);

CREATE TABLE empleados(
    id_empleados int,
    id_personas int,
    categoria varchar(20), 
    sueldo int, 
    PRIMARY KEY (id_empleados),
    FOREIGN KEY (id_personas) REFERENCES personas(id_personas)
);

INSERT INTO personas (dni, apyn, telefono)
VALUES
  (12345678, 'Gómez, Juan', 1234567890),
  (23456789, 'López, María', 9876543210),
  (34567890, 'Martínez, Pedro', 4567890123),
  (45678901, 'Sánchez, Ana', 7890123456),
  (56789012, 'González, Luis', 3210987654),
  (67890123, 'Rodríguez, Laura', 6543210987),
  (78901234, 'Fernández, Carlos', 9012345678),
  (89012345, 'Pérez, Andrea', 2345678901),
  (90123456, 'Torres, Marta', 5678901234),
  (01234567, 'Ramírez, Alejandro', 8901234567);

INSERT INTO clientes (id_clientes, id_personas, tarjeta, credito)
VALUES
  (1, 1, 123456, 1000),
  (2, 2, 234567, 2000),
  (3, 3, 345678, 1500),
  (4, 4, 456789, 500),
  (5, 5, 567890, 3000),
  (6, 6, 678901, 800),
  (7, 7, 789012, 2000),
  (8, 8, 890123, 1000),
  (9, 9, 901234, 500),
  (10, 10, 012345, 1500);

  INSERT INTO personas (dni, apyn, telefono)
VALUES
  (12345679, 'García, Ana', 1111111112),
  (23456780, 'Martínez, Juan', 2222222223),
  (34567891, 'Pérez, Luis', 3333333334),
  (45678902, 'González, María', 4444444445),
  (56789013, 'Sánchez, Pedro', 5555555556);

INSERT INTO empleados (id_empleados, id_personas, categoria, sueldo)
VALUES
  (1, 11, 'Gerente', 5000),
  (2, 12, 'Vendedor', 2000),
  (3, 13, 'Recepcionista', 1500),
  (4, 14, 'Contador', 3000),
  (5, 15, 'Técnico', 2500);

SELECT personas.apyn, clientes.credito
FROM personas
INNER JOIN clientes ON personas.id_personas = clientes.id_personas;

SELECT personas.apyn, clientes.credito
FROM personas
LEFT JOIN clientes ON personas.id_personas = clientes.id_personas;

SELECT personas.apyn, clientes.credito
FROM personas
RIGHT JOIN clientes ON personas.id_personas = clientes.id_personas;

SELECT personas.apyn, clientes.credito
FROM personas
 JOIN clientes ON personas.id_personas = clientes.id_personas;

ALTER TABLE facturas ADD cod_fact varchar (20) NOT NULL;

INSERT INTO facturas (n_factura, cod_fact, total, id_clientes)
VALUES
  (1, 'FAC001', 100, 1),
  (2, 'FAC002', 200, 2),
  (3, 'FAC003', 150, 3),
  (4, 'FAC004', 50, 4),
  (5, 'FAC005', 300, 5),
  (6, 'FAC006', 80, 6),
  (7, 'FAC007', 200, 7),
  (8, 'FAC008', 100, 8),
  (9, 'FAC009', 50, 9),
  (10, 'FAC010', 150, 10),
  (11, 'FAC011', 120, 1),
  (12, 'FAC012', 250, 2),
  (13, 'FAC013', 180, 3),
  (14, 'FAC014', 70, 4),
  (15, 'FAC015', 350, 5),
  (16, 'FAC016', 90, 6),
  (17, 'FAC017', 220, 7),
  (18, 'FAC018', 120, 8),
  (19, 'FAC019', 60, 9),
  (20, 'FAC020', 180, 10);


SELECT facturas.cod_fact,facturas.total,clientes.tarjeta,personas.apyn 
FROM facturas INNER JOIN clientes ON clientes.id_clientes=facturas.id_clientes 
INNER JOIN personas ON clientes.id_personas=personas.id_personas;

SELECT facturas.cod_fact,facturas.total,clientes.tarjeta,personas.apyn 
FROM personas INNER JOIN clientes ON clientes.id_personas=personas.id_personas  
INNER JOIN facturas ON clientes.id_clientes=facturas.id_clientes;

-- muestra las facturas según condición
SELECT facturas.cod_fact,facturas.total,clientes.tarjeta,personas.apyn 
FROM personas INNER JOIN clientes ON clientes.id_personas=personas.id_personas  
INNER JOIN facturas ON clientes.id_clientes=facturas.id_clientes
WHERE personas.apyn = 'Torres, Marta';

SELECT facturas.cod_fact,facturas.total,clientes.tarjeta,personas.apyn 
FROM personas INNER JOIN clientes ON clientes.id_personas=personas.id_personas  
INNER JOIN facturas ON clientes.id_clientes=facturas.id_clientes
WHERE personas.dni = 56789012;