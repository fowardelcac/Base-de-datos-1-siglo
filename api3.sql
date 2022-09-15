USE siglo;

CREATE TABLE estudiantes (
    legajo INT PRIMARY KEY, 
    apellido VARCHAR(20) NOT NULL, 
    nombre VARCHAR(20) NOT NULL, 
    domicilio VARCHAR(40) NOT NULL, 
    tipo_doc VARCHAR(3) NOT NULL, 
    nro_doc INT(3)
);

CREATE TABLE materias (
    codigo VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE inscripcion (
    legajo INT, 
    código_materia VARCHAR(20), 
    fecha DATE NOT NULL, 
    condición VARCHAR(20) NOT NULL,
    FOREIGN KEY(legajo) REFERENCES estudiantes(legajo), 
    FOREIGN KEY(código_materia) REFERENCES materias(codigo)
);
SELECT * FROM inscripcion;

INSERT INTO estudiantes VALUES(7547, 'Perez', 'Silvana','San Rafael 55', 'DNI', 333);
INSERT INTO estudiantes VALUES(7548, 'Suarez', ' Ana', 'Riobamba 74', 'DNI', 888);
INSERT INTO estudiantes VALUES(7549, 'Lopez', ' Maximiliano', 'Lima 659', 'DNI', 666);
INSERT INTO estudiantes VALUES(7550, 'Fernández', ' Gonzalo', 'Colon 55', 'DNI', 999);

INSERT INTO materias VALUES('Mat001','Matemática I');
INSERT INTO materias VALUES('Eti0002', 'Ética');
INSERT INTO materias VALUES('Des001', 'Desarrollo Emprendedor');
INSERT INTO materias VALUES('Pro001', 'Programación Orientada a Objetos');

INSERT INTO inscripcion(legajo, fecha, condición) VALUES(7547, '2010/03/01', 'Regular');
INSERT INTO inscripcion(legajo, fecha, condición)  VALUES(7548, '2011/03/01', 'Inscripto');
INSERT INTO inscripcion(legajo, fecha, condición)  VALUES(7548, '2011/03/01', 'Inscripto');
INSERT INTO inscripcion(legajo, fecha, condición)  VALUES(7547, '2009/03/01', 'Regular');
INSERT INTO inscripcion(fecha, condición)  VALUES('2010/03/01', 'Aprobado');

TRUNCATE inscripcion;

SELECT * FROM estudiantes;
SELECT * FROM inscripcion;
SELECT * FROM materias;

UPDATE inscripcion SET fecha = '2016-12-23', condición = 'Aprobado'
WHERE legajo = 7550;

DELETE FROM inscripcion WHERE legajo = 7550;

SELECT e.apellido, i.código_materia, i.legajo 
from estudiantes e, inscripcion i
where i.legajo = e.legajo
order by e.apellido, i.código_materia,i.legajo;
