CREATE DATABASE petram_dev;

use petram_dev;

CREATE TABLE empresas (
    id  int (11) auto_increment not null,
    nombre varchar (100) not null,
    CONSTRAINT pk_empresas PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE roles (
    id int (11) auto_increment not null,
    nombre varchar (100) not null,
    CONSTRAINT pk_roles PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE eps (
    id int (11) auto_increment not null,
    nombre varchar (100) not null,
    CONSTRAINT pk_eps PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE niveles_de_educacion (
    id int (11) auto_increment not null,
    nombre varchar (50) not null,
    CONSTRAINT pk_niveles_de_educacion PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE estratos (
    id int (11) auto_increment not null,
    nombre varchar (50) not null,
    CONSTRAINT pk_estratos PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE tipos_de_pagos (
    id int(11) auto_increment not null,
    nombre varchar (100) not null,
    CONSTRAINT pk_tipos_de_pagos PRIMARY KEY (id)
)ENGINE=InnoDB;

CREATE TABLE formas_de_pagos (
    id int(11) auto_increment not null,
    nombre varchar (100) not null,
    CONSTRAINT pk_formas_de_pagos PRIMARY KEY (id)
)ENGINE=InnoDB;


CREATE TABLE estados (
    id int (11) auto_increment not null,
    nombre varchar (50) not null,
    CONSTRAINT pk_estados PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE comprobantes_de_pagos (
    id int (11) auto_increment not null,
    total int (50) not null,
    marca varchar (100) not null,
    tipo_de_pago_id int(11) not null,
    forma_de_pago_id int(11) not null,
    estado_id int(11) not null,
    CONSTRAINT pk_comprobantes_de_pagos PRIMARY KEY (id),
    CONSTRAINT fk_comprobante_tipo_pago FOREIGN KEY (tipo_de_pago_id) REFERENCES tipos_de_pagos(id),
    CONSTRAINT fk_comprobante_forma_pago FOREIGN KEY (forma_de_pago_id) REFERENCES formas_de_pagos(id),
    CONSTRAINT fk_comprobante_estado FOREIGN KEY (estado_id) REFERENCES estados(id)
) ENGINE=InnoDB;

CREATE TABLE ambientes (
    id int (11) auto_increment not null,
    nombre varchar (50) not null,
    direccion varchar (50) not null,
    empresa_id int (11) not null,
    estado_id int(11) not null,
    CONSTRAINT pk_ambientes PRIMARY KEY (id),
    CONSTRAINT fk_ambiente_empresa FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    CONSTRAINT fk_ambiente_estado FOREIGN KEY (estado_id) REFERENCES estados(id)
)ENGINE=InnoDB;

CREATE TABLE tipos_de_documentos (
id int (11) auto_increment  not null,
nombre varchar (50) not null,
abreviatura varchar (5) not null,
CONSTRAINT pk_tipos_de_docuementos PRIMARY KEY (id)
) ENGINE=innoDB;

CREATE TABLE usuarios (
    id int (11) auto_increment not null,
    num_documento varchar (50) not null,
    tipo_de_documento_id int (11) not null,
    nombre varchar (100) not null,
    apellidos varchar (150) not null,
    nickname int (100) not null,
    password varchar (200) not null,
    fecha_nacimiento date not null,
    fecha_matricula int (11) not null,
    nivel_de_educaciones_id int(11) not null,
    telefono1 varchar (15) not null,
    telefono2 varchar (15) not null,
    direccion varchar (200) not null,
    estrato varchar (1) not null,
    eps varchar (30) not null,
    ocupacion varchar (100) not null,
    email varchar (100) not null,
    imagen_perfil varchar (200) not null,
    firma varchar (100) not null,
    estrato_id int(11) not null,
    curso_id int(11) not null,
    estado_id int(11) not null,
    comprobante_de_pago_id int (11) not null,
    forma_de_pago_id int(11) not null,
    empresa_id int (11) not null,
    CONSTRAINT pk_usuarios PRIMARY KEY (id),
    CONSTRAINT fk_usuario_comprobante_de_pago FOREIGN KEY (comprobante_de_pago_id) REFERENCES comprobantes_de_pagos(id),
    CONSTRAINT fk_uuario_empresa FOREIGN KEY (empresa_id) REFERENCES empresas (id),
    CONSTRAINT fk_usuario_nivel_de_educacion FOREIGN KEY (nivel_de_educaciones_id) REFERENCES niveles_de_educacion (id),
    CONSTRAINT fk_usuario_estrato FOREIGN KEY (estrato_id) REFERENCES estratos (id),
    CONSTRAINT fk_usuario_tipo_de_documento FOREIGN KEY (tipo_de_documento_id) REFERENCES tipos_de_documentos(id),
    CONSTRAINT fk_usuario_forma_de_pago FOREIGN KEY (forma_de_pago_id) REFERENCES formas_de_pagos(id),
    CONSTRAINT fk_usuario_estado FOREIGN KEY (estado_id) REFERENCES estados(id)
)ENGINE=InnoDB;

CREATE TABLE cursos (
    id int (11) auto_increment not null,
    nombre varchar (100) not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    precio int(11) not null,
    ambiente_id int (11) not null,
    empresa_id int(11) not null,
    estado_id int(11) not null,
    CONSTRAINT pk_cursos PRIMARY KEY (id),
    CONSTRAINT fk_curso_ambiente FOREIGN KEY (ambiente_id) REFERENCES ambientes(id),
    CONSTRAINT fk_curso_empresa FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    CONSTRAINT fk_curso_estado FOREIGN KEY (estado_id) REFERENCES estados(id)
)ENGINE=InnoDB; 

CREATE TABLE vehiculos (
    id int (11) auto_increment not null,
    placa varchar (100) not null,
    marca varchar (100) not null,
    modelo varchar (100) not null,
    empresa_id int(11) not null,
    estado_id int(11) not null,
    CONSTRAINT pk_vehiculos PRIMARY KEY (id),
    CONSTRAINT fk_vehiculo_estado FOREIGN KEY (estado_id) REFERENCES estados(id),
    CONSTRAINT fk_vehiculo_empresa FOREIGN KEY (empresa_id) REFERENCES empresas(id)
)ENGINE=InnoDB;

CREATE TABLE clases (
    id int (11) auto_increment not null,
    duracion int  (10) not null,
    ambiente_id int(11) not null,
    usuario_id int(11) not null,
    curso_id int(11) not null,
    estado_id int(11) not null,
    CONSTRAINT pk_clases PRIMARY KEY (id),
    CONSTRAINT fk_clase_ambiente FOREIGN KEY (ambiente_id) REFERENCES ambientes (id),
    CONSTRAINT fk_clase_estado FOREIGN KEY (estado_id) REFERENCES estados (id),
    CONSTRAINT fk_clase_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
) ENGINE=InnoDB;

CREATE TABLE detalles_de_comprobantes_de_pagos (
    id int (11) auto_increment not null,
    descripcion varchar (10) not null,
    iva float not null,
    subtotal int (11) not null,
    descuento float  not null,
    firma varchar (50) not null,
    comprobante_de_pago_id int (11) not null,
    CONSTRAINT pk_detalles_de_comprobantes_de_pagos PRIMARY KEY (id),
    CONSTRAINT fk_detalle_de_comprobante_de_pago_comprobante_de_pago FOREIGN KEY (comprobante_de_pago_id) REFERENCES comprobantes_de_pagos  (id)
) ENGINE=InnoDB;

/* Añadiendo otros campos */
ALTER TABLE usuarios ADD CONSTRAINT fk_usuario_curso FOREIGN KEY (curso_id) REFERENCES cursos(id);

/* Insercion de datos en la base de datos */

/* Empresas */
INSERT INTO empresas VALUES(null, "Autopremier");
INSERT INTO empresas VALUES(null, "Conducir Colombia");
INSERT INTO empresas VALUES(null, "DriverCar");

/* roles */
INSERT INTO roles VALUES(null, "Administrador");
INSERT INTO roles VALUES(null, "Secretaria");
INSERT INTO roles VALUES(null, "Docente");
INSERT INTO roles VALUES(null, "Estudiante");

/* niveles de educacion */
INSERT INTO niveles_de_educacion VALUES(null, "Educacion Basica");
INSERT INTO niveles_de_educacion VALUES(null, "Educacion Media");
INSERT INTO niveles_de_educacion VALUES(null, "Educacion Superior");

/* estratos */
INSERT INTO estratos VALUES(null, "Estrato 1");
INSERT INTO estratos VALUES(null, "Estrato 2");
INSERT INTO estratos VALUES(null, "Estrato 3");
INSERT INTO estratos VALUES(null, "Estrato 4");
INSERT INTO estratos VALUES(null, "Estrato 5");
INSERT INTO estratos VALUES(null, "Estrato 6");

/* estados */
INSERT INTO estados VALUES(null, "Activo");
INSERT INTO estados VALUES(null, "Bloqueado");
INSERT INTO estados VALUES(null, "Inactivo");
INSERT INTO estados VALUES(null, "Pago");
INSERT INTO estados VALUES(null, "Sin pagar");
INSERT INTO estados VALUES(null, "En espera");
INSERT INTO estados VALUES(null, "Disponible");
INSERT INTO estados VALUES(null, "No disponible");
INSERT INTO estados VALUES(null, "En taller");
INSERT INTO estados VALUES(null, "En clase");
INSERT INTO estados VALUES(null, "En parqueadero");

/* tipos de pagos*/
INSERT INTO tipos_de_pagos VALUES(null, "Cheque");
INSERT INTO tipos_de_pagos VALUES(null, "Efectivo");
INSERT INTO tipos_de_pagos VALUES(null, "Tarjeta de credito");
INSERT INTO tipos_de_pagos VALUES(null, "Tarjeta de debito");
INSERT INTO tipos_de_pagos VALUES(null, "Transferencia bancaria");
INSERT INTO tipos_de_pagos VALUES(null, "Consignacion bancaria");
INSERT INTO tipos_de_pagos VALUES(null, "BitaCoin");

/* formas de pago*/
INSERT INTO formas_de_pagos VALUES(null, "Entrante");
INSERT INTO formas_de_pagos VALUES(null, "Saliente");


/* comprobantes de pago */
INSERT INTO comprobantes_de_pagos VALUES(null, 60000, "img/autopremier",4,1,1);
INSERT INTO comprobantes_de_pagos VALUES(null, 500000, "img/autopremier",4,2,1);
INSERT INTO comprobantes_de_pagos VALUES(null, 500000, "img/autopremier",5,1,1);
INSERT INTO comprobantes_de_pagos VALUES(null, 356090, "img/autopremier",5,1,1);
INSERT INTO comprobantes_de_pagos VALUES(null, 100000, "img/autopremier",5,1,1);

INSERT INTO comprobantes_de_pagos VALUES(null, 630000, "img/conducir colombia",6,1,2);
INSERT INTO comprobantes_de_pagos VALUES(null,950000, "img/conducir colombia",6,1,2 );
INSERT INTO comprobantes_de_pagos VALUES(null,1200000, "img/conducir colombia",5,2,2);
INSERT INTO comprobantes_de_pagos VALUES(null,50000200, "img/conducir colombia",5,2,2);
INSERT INTO comprobantes_de_pagos VALUES(null,4900000, "img/conducir colombia",4,2,2);
 
INSERT INTO comprobantes_de_pagos VALUES(null, 500000, "img/driver_car",4,1,1);
INSERT INTO comprobantes_de_pagos VALUES(null, 90000, "img/driver_car",5,2,1);
INSERT INTO comprobantes_de_pagos VALUES(null, 1500000, "img/driver_car",6,1,2);
INSERT INTO comprobantes_de_pagos VALUES(null, 980000, "img/driver_car",4,1,2);
INSERT INTO comprobantes_de_pagos VALUES(null, 784000, "img/driver_car",4,1,2);

/* ambientes */
INSERT INTO ambientes VALUES(null, "Salon 101", "Carrera 19 numero 78", 1, 7);
INSERT INTO ambientes VALUES(null, "Salon 200", "Calle 34-45 sur", 1, 7);
INSERT INTO ambientes VALUES(null, "Salon 502", "Calle 45-98", 1, 7);

INSERT INTO ambientes VALUES(null, "Salon 601", "Calle 13", 2, 8);
INSERT INTO ambientes VALUES(null, "Salon 610", "Calle 69-45", 2, 8);
INSERT INTO ambientes VALUES(null, "Salon 400", "Calle 63-34 numero 12 sur", 2,8);

INSERT INTO ambientes VALUES(null, "Salon 613", "Calle 29 numero 13-90", 3,7);
INSERT INTO ambientes VALUES(null, "Salon 663", "Avenida cali calle 34", 3,8);
INSERT INTO ambientes VALUES(null, "Salon 206", "Avenida carrera 30", 3,8);



/* vehiculos */
INSERT INTO vehiculos VALUES (null,"sjb-231", "Chevrolet", "Captiva", 1,1);
INSERT INTO vehiculos VALUES (null,"lfb-699", "Jeep", "commander", 1,2);
INSERT INTO vehiculos VALUES (null,"mkl-687", "Jaguar", "F-type", 1,2);
INSERT INTO vehiculos VALUES (null,"xxs-521", "Bentley","Continental",1,1);

INSERT INTO vehiculos VALUES (null,"stg-985", "Lamborghini", "Huracan", 2,1);
INSERT INTO vehiculos VALUES (null,"pat-471", "Ferrari", "Portofino", 2,2);
INSERT INTO vehiculos VALUES (null,"cht-917", "Audi", "XR8", 2,2);
INSERT INTO vehiculos VALUES (null,"cip-522", "BMW", "I3", 2,1);

INSERT INTO vehiculos VALUES (null,"per-113", "Aston Martin", "Vulcan", 3,1);
INSERT INTO vehiculos VALUES (null,"seu-569", "Alfa Romeo", "MiTo", 3,1);
INSERT INTO vehiculos VALUES (null,"jac-478", "Alpine", "Health", 3,1);
INSERT INTO vehiculos VALUES (null,"son-877", "Bugatti", "Veyron", 3,2);


/* detalle comprobante de pago*/
INSERT INTO detalles_de_comprobantes_de_pagos  VALUES (null,"pago motocicleta", 1000 , 0.50, 50000, 0.70, 1);
INSERT INTO detalles_de_comprobantes_de_pagos  VALUES (null,"pago carro", 52000 , 0.90, 95000, 0.10, 2);
INSERT INTO detalles_de_comprobantes_de_pagos  VALUES (null,"pago pagina web", 630000 , 0.60, 340000, 0.30, 1);
INSERT INTO detalles_de_comprobantes_de_pagos  VALUES (null,"pago marketing", 96300 , 0.40, 21000, 0.80, 1);
INSERT INTO detalles_de_comprobantes_de_pagos  VALUES (null,"pago marketing digital", 780010 , 0.20, 61000, 0.20, 1);



/* eps */
INSERT INTO eps VALUES(null, "Sanitas");
INSERT INTO eps VALUES(null, "Capital Salud");
INSERT INTO eps VALUES(null, "Cruz Blanca ");
INSERT INTO eps VALUES(null, "Compensar");
INSERT INTO eps VALUES(null, "Sura");
INSERT INTO eps VALUES(null, "Famisanar");
INSERT INTO eps VALUES(null, "Sisben");

INSERT INTO tipos_de_documentos VALUES (null, 'Cedula de ciudadania', 'C.C');
INSERT INTO tipos_de_documentos VALUES (null, 'Cedula de extranjeria', 'C.E');
INSERT INTO tipos_de_documentos VALUES (null, 'Tarjeta de identidad', 'C.C');
INSERT INTO tipos_de_documentos VALUES (null, '', 'C.C');

/* cursos */
INSERT INTO cursos VALUES(null, "Curso moto A2", "2017-01-15", "2019-05-08", 1200000, 2, 1, 1);
INSERT INTO cursos VALUES(null, "Curso carro B1", "2019-01-15", "2020-07-01", 1200000,2, 1, 1);
INSERT INTO cursos VALUES(null, "Curso moto C2", "2018-01-15", "2019-10-15", 1200000,2, 1, 1);
INSERT INTO cursos VALUES(null, "Capacitacion de manejo defensivo", "2020-05-14", "2021-1-1", 120000, 1, 1, 2);


INSERT INTO usuarios values(null, 1001848636, 1, "mike", "wazauski", "papeleo", "123", "12-09-2000", "12-02-2010", "1", 1002, 30210, "calle 34 sur ", 3, "sanitas", "estudiante", "anoche@gmail.com", "assets/images/foto.png", "Wazauzky", 1, 2, 1, 1, 1, 1);

/* clases */
INSERT INTO clases VALUES (null, 4, 2, 1 , 1,1);
INSERT INTO clases VALUES (null, 6 , 6, 1 , 1,1);
INSERT INTO clases VALUES (null, 3, 3, 1, 1,1);
INSERT INTO clases VALUES (null, 5 , 1, 1 , 1,1);