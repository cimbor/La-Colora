CREATE TABLE colora_alojamiento (idalojamiento BIGINT, nombre VARCHAR(45), preciobase DECIMAL(6, 2), subalojamiento BIGINT NOT NULL, minplazas BIGINT NOT NULL, maxplazas BIGINT NOT NULL, idempresa BIGINT NOT NULL, INDEX subalojamiento_idx (subalojamiento), INDEX idempresa_idx (idempresa), PRIMARY KEY(idalojamiento)) ENGINE = INNODB;
CREATE TABLE colora_cliente (idcliente BIGINT, datoscliente BIGINT NOT NULL, credenciales BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX credenciales_idx (credenciales), INDEX datoscliente_idx (datoscliente), PRIMARY KEY(idcliente)) ENGINE = INNODB;
CREATE TABLE colora_credenciales (idcredenciales BIGINT, usuario VARCHAR(255), password VARCHAR(255), PRIMARY KEY(idcredenciales)) ENGINE = INNODB;
CREATE TABLE colora_datospersonales (iddatospersonales BIGINT, nombre VARCHAR(45), apellido1 VARCHAR(45), apellido2 VARCHAR(45), nacionalidad VARCHAR(2) DEFAULT 'es', dni_passport VARCHAR(12), calle VARCHAR(45), num_y_piso VARCHAR(10), localidad VARCHAR(45), provincia VARCHAR(45), telefono BIGINT NOT NULL, email VARCHAR(255), PRIMARY KEY(iddatospersonales)) ENGINE = INNODB;
CREATE TABLE colora_empleado (idempleado BIGINT, datosempleado BIGINT NOT NULL, credenciales BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX credenciales_idx (credenciales), INDEX datosempleado_idx (datosempleado), PRIMARY KEY(idempleado)) ENGINE = INNODB;
CREATE TABLE colora_empresa (idempresa BIGINT, razonsocial VARCHAR(255), cif_nif VARCHAR(9), dirección VARCHAR(100), telefono VARCHAR(12), email VARCHAR(255), gerente VARCHAR(100), PRIMARY KEY(idempresa)) ENGINE = INNODB;
CREATE TABLE colora_factura (idfactura BIGINT, idempresa BIGINT NOT NULL, fecha DATETIME NOT NULL, idreserva BIGINT NOT NULL, mediopago VARCHAR(1) NOT NULL, numtarjeta BIGINT NOT NULL, tipotarjeta VARCHAR(15) NOT NULL, fechacadtarjeta DATE NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX idempresa_idx (idempresa), INDEX idreserva_idx (idreserva), PRIMARY KEY(idfactura)) ENGINE = INNODB;
CREATE TABLE colora_ofertapersonalizada (idofertapersonalizada VARCHAR(45), fechainicio DATETIME NOT NULL, fechafin DATETIME NOT NULL, codcliente BIGINT NOT NULL, codgerente BIGINT NOT NULL, dtoporcentual DECIMAL(5, 2) DEFAULT 0, dtofijo DECIMAL(5, 2) DEFAULT 0, descripcion VARCHAR(255) DEFAULT 'sin descripcion', nocobrarextra1 TINYINT(1) NOT NULL, nocobrarextra2 TINYINT(1) NOT NULL, techodto DECIMAL(5, 2) DEFAULT 0, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX codgerente_idx (codgerente), INDEX codcliente_idx (codcliente), PRIMARY KEY(idofertapersonalizada)) ENGINE = INNODB;
CREATE TABLE colora_ofertatemporada (idofertatemporada BIGINT, fechainicio DATETIME NOT NULL, fechafin DATETIME NOT NULL, codgerente BIGINT NOT NULL, dtoporcentual DECIMAL(5, 2) DEFAULT 0, dtofijo DECIMAL(5, 2) DEFAULT 0, descripcion VARCHAR(255) DEFAULT 'sin descripcion', nocobrarextra1 TINYINT(1) NOT NULL, nocobrarextra2 TINYINT(1) NOT NULL, techodto DECIMAL(5, 2) DEFAULT 0, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX codgerente_idx (codgerente), PRIMARY KEY(idofertatemporada)) ENGINE = INNODB;
CREATE TABLE colora_reserva (idreserva BIGINT, cliente BIGINT NOT NULL, importe DECIMAL(9, 2) NOT NULL, fianzadepositada DECIMAL(9, 2) DEFAULT 0, fechasalida DATETIME NOT NULL, fechallegada DATETIME NOT NULL, estado VARCHAR(255) NOT NULL, codofertatemporada BIGINT DEFAULT 0, codofertapersonalizada VARCHAR(45) NOT NULL, realizada_por BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX cliente_idx (cliente), INDEX realizada_por_idx (realizada_por), INDEX codofertatemporada_idx (codofertatemporada), INDEX codofertapersonalizada_idx (codofertapersonalizada), PRIMARY KEY(idreserva)) ENGINE = INNODB;
CREATE TABLE reserva_tiene_alojamiento (idalojamiento BIGINT, idreserva BIGINT, PRIMARY KEY(idalojamiento, idreserva)) ENGINE = INNODB;
CREATE TABLE colora_tarifa (idtarifa BIGINT, idalojamiento BIGINT UNIQUE NOT NULL, fechainicio DATE NOT NULL, fechafin DATE NOT NULL, preciobase DECIMAL(8, 2), conceptoextra1 VARCHAR(45), precioextra1 VARCHAR(45), conceptoextra2 VARCHAR(45), precioextra2 VARCHAR(45), INDEX idalojamiento_idx (idalojamiento), PRIMARY KEY(idtarifa)) ENGINE = INNODB;
ALTER TABLE colora_alojamiento ADD CONSTRAINT csci FOREIGN KEY (subalojamiento) REFERENCES colora_alojamiento(idalojamiento);
ALTER TABLE colora_alojamiento ADD CONSTRAINT colora_alojamiento_idempresa_colora_empresa_idempresa FOREIGN KEY (idempresa) REFERENCES colora_empresa(idempresa) ON DELETE CASCADE;
ALTER TABLE colora_cliente ADD CONSTRAINT colora_cliente_credenciales_colora_credenciales_idcredenciales FOREIGN KEY (credenciales) REFERENCES colora_credenciales(idcredenciales) ON DELETE CASCADE;
ALTER TABLE colora_cliente ADD CONSTRAINT cdci FOREIGN KEY (datoscliente) REFERENCES colora_datospersonales(iddatospersonales) ON DELETE CASCADE;
ALTER TABLE colora_empleado ADD CONSTRAINT colora_empleado_credenciales_colora_credenciales_idcredenciales FOREIGN KEY (credenciales) REFERENCES colora_credenciales(idcredenciales) ON DELETE CASCADE;
ALTER TABLE colora_empleado ADD CONSTRAINT cdci_1 FOREIGN KEY (datosempleado) REFERENCES colora_datospersonales(iddatospersonales) ON DELETE CASCADE;
ALTER TABLE colora_factura ADD CONSTRAINT colora_factura_idreserva_colora_reserva_idreserva FOREIGN KEY (idreserva) REFERENCES colora_reserva(idreserva) ON DELETE CASCADE;
ALTER TABLE colora_factura ADD CONSTRAINT colora_factura_idempresa_colora_empresa_idempresa FOREIGN KEY (idempresa) REFERENCES colora_empresa(idempresa) ON DELETE CASCADE;
ALTER TABLE colora_ofertapersonalizada ADD CONSTRAINT colora_ofertapersonalizada_codgerente_colora_empleado_idempleado FOREIGN KEY (codgerente) REFERENCES colora_empleado(idempleado) ON DELETE CASCADE;
ALTER TABLE colora_ofertapersonalizada ADD CONSTRAINT colora_ofertapersonalizada_codcliente_colora_cliente_idcliente FOREIGN KEY (codcliente) REFERENCES colora_cliente(idcliente) ON DELETE CASCADE;
ALTER TABLE colora_ofertatemporada ADD CONSTRAINT colora_ofertatemporada_codgerente_colora_empleado_idempleado FOREIGN KEY (codgerente) REFERENCES colora_empleado(idempleado) ON DELETE CASCADE;
ALTER TABLE colora_reserva ADD CONSTRAINT crci FOREIGN KEY (realizada_por) REFERENCES colora_datospersonales(iddatospersonales) ON DELETE CASCADE;
ALTER TABLE colora_reserva ADD CONSTRAINT colora_reserva_cliente_colora_cliente_idcliente FOREIGN KEY (cliente) REFERENCES colora_cliente(idcliente) ON DELETE CASCADE;
ALTER TABLE colora_reserva ADD CONSTRAINT ccci_1 FOREIGN KEY (codofertapersonalizada) REFERENCES colora_ofertapersonalizada(idofertapersonalizada) ON DELETE CASCADE;
ALTER TABLE colora_reserva ADD CONSTRAINT ccci FOREIGN KEY (codofertatemporada) REFERENCES colora_ofertatemporada(idofertatemporada) ON DELETE CASCADE;
ALTER TABLE reserva_tiene_alojamiento ADD CONSTRAINT rici FOREIGN KEY (idalojamiento) REFERENCES colora_alojamiento(idalojamiento);
ALTER TABLE reserva_tiene_alojamiento ADD CONSTRAINT reserva_tiene_alojamiento_idreserva_colora_reserva_idreserva FOREIGN KEY (idreserva) REFERENCES colora_reserva(idreserva);
ALTER TABLE colora_tarifa ADD CONSTRAINT colora_tarifa_idalojamiento_colora_alojamiento_idalojamiento FOREIGN KEY (idalojamiento) REFERENCES colora_alojamiento(idalojamiento) ON DELETE CASCADE;