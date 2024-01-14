-- Nom: Rohit Kumar Kumar amb DNI: 46279331L 
-- CALCUL: 31+05+02 mod 4 = 2
-- 2 = Exercici C (Supermercats)

/*
--Creació de la Base de dades
CREATE DATABASE supermercats;
*/


-- Estructura de Base de dades Supermercats

--Taula SUPERMERCAT
CREATE TABLE supermercat (
    codi_super SERIAL PRIMARY KEY,
    nom_super VARCHAR(50) UNIQUE NOT NULL,
    adreça_carrer VARCHAR(50) NOT NULL,
    adreça_codipostal VARCHAR(10) NOT NULL,
    adreça_poblacio VARCHAR(50) NOT NULL,
    nif_director VARCHAR(20) NOT NULL
);
-- Taula EMPLEAT
CREATE TABLE empleat (
    nif VARCHAR(20) PRIMARY KEY,
    nom_treballador VARCHAR(50) NOT NULL,
    primer_cognom VARCHAR(50) CHECK (primer_cognom = UPPER(LEFT(primer_cognom, 1)) || LOWER(SUBSTRING(primer_cognom, 2))) NOT NULL,
    segon_cognom VARCHAR(50) CHECK (segon_cognom = UPPER(LEFT(segon_cognom, 1)) || LOWER(SUBSTRING(segon_cognom, 2))) NOT NULL,
    codi_super SERIAL,
    CONSTRAINT fk_empleat_supermercat FOREIGN KEY (codi_super) REFERENCES supermercat(codi_super)
);
-- taula PRODUCTE
CREATE TABLE producte (
    codi_producte SERIAL PRIMARY KEY,
    descripcio TEXT NOT NULL,
    codi_barres VARCHAR(20) CHECK (LENGTH(codi_barres) = 13) NOT NULL,
    pvp DECIMAL(10, 2) CHECK (pvp >= 0) NOT NULL
);
-- Taula PROVEIDOR
CREATE TABLE proveidor (
    cif VARCHAR(20) PRIMARY KEY,
    nom_proveidor VARCHAR(50) NOT NULL,
    adreça VARCHAR(50) NOT NULL,
    email VARCHAR(50) CHECK (email LIKE '%@%') NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    persona_contacte VARCHAR(50) NOT NULL
);
-- Taula PROD_PROV(N:M --> producte-proveidor)
CREATE TABLE prod_prov (
    codi_producte SERIAL NOT NULL,
    cif_proveidor VARCHAR(20) NOT NULL,
    data_compra DATE DEFAULT CURRENT_DATE NOT NULL,
    preu_compra DECIMAL(10, 2) NOT NULL,
    quantitat_compra INT DEFAULT 1 NOT NULL,
    PRIMARY KEY (codi_producte, cif_proveidor),
    CONSTRAINT fk_prod_prov_producte FOREIGN KEY (codi_producte) REFERENCES producte(codi_producte),
    CONSTRAINT fk_prod_prov_proveidor FOREIGN KEY (cif_proveidor) REFERENCES proveidor(cif)
);
-- Taula STOCK_PROV(N:M --> supermercat-producte)
CREATE TABLE stock_prod (
    codi_super INT NOT NULL,
    codi_producte INT NOT NULL,
    stock INT NOT NULL,
    stock_minim INT DEFAULT 0 NOT NULL,
    PRIMARY KEY (codi_super, codi_producte),
    CONSTRAINT fk_stock_prod_supermercat FOREIGN KEY (codi_super) REFERENCES supermercat(codi_super),
    CONSTRAINT fk_stock_prod_producte FOREIGN KEY (codi_producte) REFERENCES producte(codi_producte)
);
-- Taula CAIXA
CREATE TABLE caixa (
    codi_super INT NOT NULL,
    num_caixa INT NOT NULL,
    data_revisio DATE NOT NULL,
    CONSTRAINT pk_caixa PRIMARY KEY (codi_super, num_caixa),
    CONSTRAINT fk_caixa_supermercat FOREIGN KEY (codi_super) REFERENCES supermercat(codi_super)
);

-- Taula CLIENT
CREATE TABLE client (
    dni_client VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(50) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    data_naixement DATE NOT NULL,
    num_targeta VARCHAR(20) NOT NULL
);
-- Taula TIQUET

CREATE TABLE tiquet (
    id_tiquet SERIAL PRIMARY KEY,
    data_hora DATE NOT NULL,
    codi_super INT NOT NULL,
    num_caixa INT NOT NULL,
    dni_client VARCHAR(20),
    descompte DECIMAL(5, 2) CHECK (descompte >= 0 AND descompte <= 1) NOT NULL,
    CONSTRAINT fk_tiquet_supermercat_caixa FOREIGN KEY (codi_super, num_caixa) REFERENCES caixa(codi_super, num_caixa),
    CONSTRAINT fk_tiquet_client FOREIGN KEY (dni_client) REFERENCES client(dni_client)
);

-- Taula DETALL_TICKET
CREATE TABLE detall_tiquet (
    id_tiquet INT NOT NULL,
    codi_producte INT NOT NULL,
    preu DECIMAL(10, 2) NOT NULL,
    quantitat INT NOT NULL,
    PRIMARY KEY (id_tiquet, codi_producte),
    CONSTRAINT fk_detall_tiquet_tiquet FOREIGN KEY (id_tiquet) REFERENCES tiquet(id_tiquet),
    CONSTRAINT fk_detall_tiquet_producte FOREIGN KEY (codi_producte) REFERENCES producte(codi_producte)
);


-- Afegir dades a les taules


INSERT INTO supermercat (codi_super,nom_super, adreça_carrer, adreça_codipostal, adreça_poblacio, nif_director)
VALUES (1,'Supeco', 'Carrer Major 15', '17300', 'Blanes', '12345678A'),
       (2,'Mercadona', 'Carrer Aribau 15', '17310', 'Lloret de Mar', '87654321B');




INSERT INTO empleat (nif, nom_treballador, primer_cognom, segon_cognom, codi_super)
VALUES ('11111111A', 'Daniela', 'Pérez', 'Careira', 2),
       ('22222222B', 'Luca', 'Yeray', 'Andrade', 2),
       ('33333333C', 'Eduardo', 'Silva', 'Santos', 2),
       ('44444444D', 'Laura', 'Gimena', 'Gimenez', 1),
       ('55555555E', 'Cristina', 'Rodriguez', 'Rodriguez', 1),
       ('66666666F', 'José', 'Moreno', 'Santos', 1),
       ('77777777G', 'Rohit', 'Kumar', 'Kumar', 1),
       ('88888888H', 'Silvia', 'Gimenez', 'Farola', 2),
       ('99999999I', 'Claudia', 'Carrion', 'Morales', 1),
       ('00000000J', 'Ismael', 'Bonto', 'Sercanto', 1);

INSERT INTO producte (codi_producte,descripcio, codi_barres, pvp)
VALUES (1,'Barra de pa', '1234567890123', 10.99),
       (2,'Nata', '2345678901234', 5.99),
       (3,'Coca cola', '3456789012345', 2.99),
       (4,'Heineken-Mojito', '4567890123456', 8.99),
       (5,'Porras', '5678901234567', 3.99),
       (6,'Salchichetes', '6789012345678', 6.99),
       (7,'Aigua', '7890123456789', 4.99),
       (8,'Noodles', '8901234567890', 7.99),
       (9,'Patata', '9012345678901', 9.99),
       (10,'Pollastre', '0123456789012', 15.99);



INSERT INTO proveidor (cif, nom_proveidor, adreça, email, telefon, persona_contacte)
VALUES ('A12345678', 'Heineken', 'Carrer SuperAlcoholica Embrutada 3', 'sells@heineken.com', '123456789', 'Ariadna'),
       ('B87654321', 'Fruits & Pressecs', 'Carrer de Fruiteries 7', 'ventes@fruitsandpressecs.com', '987654321', 'Carlos'),
       ('C11111111', 'Florichsol', 'Carrer Flor 3', 'yovendomejor@florichsol.com', '111111111', 'Pedro'),
       ('D99999999', 'StarLiquors', 'Carrer Liquor nº 1', 'callaycomprabarato@starliquors.com', '999999999', 'Rocky');

INSERT INTO prod_prov (codi_producte, cif_proveidor, data_compra, preu_compra, quantitat_compra)
VALUES (1, 'A12345678', '2022-01-01', 9.99, 10),
       (2, 'B87654321', '2022-01-02', 4.99, 5),
       (3, 'C11111111', '2022-01-03', 1.99, 3),
       (4, 'D99999999', '2022-01-04', 7.99, 8),
       (5, 'A12345678', '2022-01-05', 2.99, 6),
       (6, 'B87654321', '2022-01-06', 5.99, 4),
       (7, 'C11111111', '2022-01-07', 3.99, 2),
       (8, 'D99999999', '2022-01-08', 6.99, 7),
       (9, 'A12345678', '2022-01-09', 8.99, 9),
       (10, 'B87654321', '2022-01-10', 3.99, 5);

INSERT INTO stock_prod (codi_super, codi_producte, stock, stock_minim)
VALUES (2, 1, 100, 10),
       (1, 2, 50, 5),
       (2, 3, 30, 3),
       (1, 4, 80, 8),
       (2, 5, 60, 6),
       (1, 6, 40, 4),
       (2, 7, 20, 2),
       (1, 8, 70, 7),
       (2, 9, 90, 9),
       (1, 10, 50, 5);

INSERT INTO caixa (codi_super, num_caixa, data_revisio)
VALUES (1, 1, '2022-01-01'),
       (2, 3, '2022-01-03'),
       (1, 4, '2022-01-04'),
	   (1, 2, '2022-01-04'),
	   (2, 1, '2022-01-04');

INSERT INTO client (dni_client, nom, cognoms, telefon, data_naixement, num_targeta)
VALUES ('11111111A', 'Carlos', 'Estratega', '123456789', '2000-01-01', '1111111111111111'),
       ('22222222B', 'Pedro', 'Sanchez', '987654321', '2000-02-02', '2222222222222222'),
       ('33333333C', 'Ana', 'Mika', '111111111', '2000-03-03', '3333333333333333'),
       ('44444444D', 'Maria', 'Rodriguez', '999999999', '2000-04-04', '4444444444444444'),
       ('55555555E', 'Alex', 'Fulano', '555555555', '2000-05-05', '5555555555555555');

INSERT INTO tiquet (data_hora, codi_super, num_caixa, dni_client, descompte)
VALUES (CURRENT_DATE, 1, 1, '11111111A', 0.1),
       ('2021-04-21', 1, 2, '22222222B', 0.2),
       (CURRENT_DATE, 2, 3, '33333333C', 0.3),
       ('2021-04-20', 1, 4, '44444444D', 0.4),
       ('2023-04-20', 2, 1, '55555555E', 0.5);


INSERT INTO detall_tiquet (id_tiquet, codi_producte, preu, quantitat)
VALUES (1, 1, 10.99, 2),
       (1, 2, 5.99, 1),
       (1, 3, 2.99, 3),
       (2, 4, 8.99, 1),
       (2, 5, 3.99, 2),
       (2, 6, 6.99, 1),
       (3, 7, 4.99, 2),
       (3, 8, 7.99, 1),
       (3, 9, 9.99, 3),
       (4, 10, 1.99, 1),
       (4, 1, 10.99, 2),
       (4, 2, 5.99, 1),
       (5, 3, 2.99, 3),
       (5, 4, 8.99, 1),
       (5, 5, 3.99, 2);


-------------------- ACTUALITZACIONS -----------------------------


-- Hem detectat que els tiquets del dia 20/04/2021 de la caixa 1 realment corresponien a la caixa 2, 
--actualitza'ls.
UPDATE tiquet
SET num_caixa = '2'
WHERE data_hora = '2021-04-20';

--El client amb NIF 'XXX' ha modificat el número de telèfon a 9999922, actualitza'l.
UPDATE client
SET telefon = '9999922'
WHERE dni_client = '33333333C';

--Hem contractat un nou empleat, dona'l d'alta.
INSERT INTO empleat (nif, nom_treballador, primer_cognom,segon_cognom,codi_super)
VALUES ('12345678X', 'Carlos', 'Diractrante','Ruiz', 1);
-- Aquest empleat serà el nou director del supermercat 1.
UPDATE supermercat
SET nif_director = '12345678X'
WHERE codi_super = 1;

--Hem d'eliminar el tiquet 3 de la caixa 2, elimina'l juntament amb el seu detall.
DELETE FROM tiquet
WHERE id_tiquet = 3 AND num_caixa = 2;

DELETE FROM detall_tiquet
WHERE id_tiquet = 3;
--El proveïdor amb id = 2 ha incrementat el preu dels seus producte un 0,5 %, actualitza'ls.
UPDATE producte
SET pvp = pvp * 1.005
WHERE codi_producte IN (
    SELECT codi_producte
    FROM prod_prov
    WHERE cif_proveidor = '2'
);
/*
-- Eliminació de les taules de la base de dades
DROP TABLE IF EXISTS detall_tiquet;
DROP TABLE IF EXISTS tiquet;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS caixa;
DROP TABLE IF EXISTS stock_prod;
DROP TABLE IF EXISTS prod_prov;
DROP TABLE IF EXISTS proveidor;
DROP TABLE IF EXISTS producte;
DROP TABLE IF EXISTS empleat;
DROP TABLE IF EXISTS supermercat;
*/

