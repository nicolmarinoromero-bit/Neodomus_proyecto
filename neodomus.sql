drop database if exists neodomus;
create database neodomus;
use neodomus;

create table tipos_documento (
    id_tipo_documento int auto_increment primary key,
    nombre_tipo varchar(2)
);

insert into tipos_documento (nombre_tipo)
values ('cc'), ('ce');

create table roles_usuario (
    id_rol int auto_increment primary key,
    nombre_rol varchar(50)
);

insert into roles_usuario (nombre_rol)
values
('administrador'),
('tecnico de instalador'),
('tecnico de soporte'),
('analista qa'),
('desarrollador backend'),
('coordinador de proyectos');

create table usuarios (
    id_usuario int auto_increment primary key,
    nombre_usuario varchar(100),
    apellido_usuario varchar(100),
    id_tipo_documento_u int,
    documento_usuario int unique,
    telefono_usuario int,
    correo_usuario varchar(100) unique,
    contraseña_usuario varchar(100),
    id_rol_u int,
    foreign key (id_tipo_documento_u) references tipos_documento(id_tipo_documento),
    foreign key (id_rol_u) references roles_usuario(id_rol)
);

insert into usuarios (nombre_usuario, apellido_usuario, id_tipo_documento_u, documento_usuario, telefono_usuario, correo_usuario, contraseña_usuario, id_rol_u) values 
('carlos andrés', 'gómez ríos', 1, 1023456790, 3001234567, 'carlos.andres.gomez@gmail.com', '123456', 2),
('jorge daniel', 'charry pérez', 1, 1034567890, 3002345678, 'jorge.charry@gmail.com', '123456', 2),
('juan sebastián', 'moreno torres', 1, 1078901234, 3003456789, 'juan.moreno@gmail.com', '123456', 2),
('luis eduardo', 'martínez gaitán', 1, 1090123456, 3004567890, 'luis.martinez@gmail.com', '123456', 1),
('andrés mauricio', 'lópez vargas', 1, 1056789012, 3005678901, 'andres.lopez@gmail.com', '123456', 3),
('camila andrea', 'rodríguez peña', 1, 1089012345, 3006789012, 'camila.rodriguez@gmail.com', '123456', 1),
('nicol alejandra', 'mariño romero', 1, 1045678901, 3007890123, 'nicolmarinoromero@gmail.com', '123456', 1),
('laura marcela', 'pérez duarte', 2, 1009876543, 3008901234, 'laura.perez@gmail.com', '123456', 4),
('julián felipe', 'carvajal caballero', 2, 1012345678, 3009012345, 'julian.carvajal@gmail.com', '123456', 5),
('maría fernanda', 'rincón salazar', 2, 1067890123, 3010123456, 'maria.rincon@gmail.com', '123456', 6);

create table clientes (
    id_cliente int auto_increment primary key,
    nombre_cliente varchar(100),
    apellido_cliente varchar(100),
    id_tipo_documento_c int,
    documento_cliente int unique,
    telefono_cliente int,
    correo_cliente varchar(100) unique,
    direccion_cliente varchar(150),
    contraseña_cliente varchar(100),
    is_active boolean default false,
    verification_token varchar(100) unique,
    foreign key (id_tipo_documento_c) references tipos_documento(id_tipo_documento)
);

insert into clientes 
(nombre_cliente, apellido_cliente, id_tipo_documento_c, documento_cliente, telefono_cliente, correo_cliente, direccion_cliente, contraseña_cliente, is_active, verification_token) 
values 
('laura', 'garcía rojas', 1, 1012345678, 3001234567, 'laura.garcia@gmail.com', 'cra 10 #12-34', '123456', true, null),
('daniela', 'ramírez peña', 1, 1034567890, 3023456789, 'daniela.ramirez@gmail.com', 'av 30 #15-09', '123456', true, null),
('andrés', 'gonzález mora', 2, 1045678901, 3034567890, 'andres.gonzalez@gmail.com', 'mz a casa 10', '123456', true, null),
('mariana', 'suárez lópez', 1, 1056789012, 3045678901, 'mariana.suarez@gmail.com', 'cl 8b #20-45', '123456', true, null),
('natalia', 'castro jiménez', 1, 1078901234, 3067890123, 'natalia.castro@gmail.com', 'cl 19 #13-55', '123456', true, null),
('felipe', 'martínez pérez', 1, 1089012345, 3078901234, 'felipe.martinez@gmail.com', 'av 68 #54-23', '123456', true, null),
('camila', 'ortiz salazar', 2, 1090123456, 3089012345, 'camila.ortiz@gmail.com', 'cl 100 #25-10', '123456', true, null),
('sebastián', 'lópez romero', 1, 1101234567, 3090123456, 'sebastian.lopez@gmail.com', 'cra 7 #89-12', '123456', true, null),
('sofía', 'ramírez ortega', 1, 1112345678, 3101234567, 'sofia.ramirez@gmail.com', 'cl 50 #12-34', '123456', true, null),
('mateo', 'gutiérrez pardo', 2, 1123456789, 3112345678, 'mateo.gutierrez@gmail.com', 'av 20 #45-67', '123456', true, null);

create table proveedores (
    id_proveedor int auto_increment primary key,
    nombre_proveedor varchar(100),
    contacto_proveedor varchar(100),
    telefono_proveedor varchar(20),
    correo_proveedor varchar(100) unique,
    direccion_proveedor varchar(150)
);

insert into proveedores (nombre_proveedor, contacto_proveedor, telefono_proveedor, correo_proveedor, direccion_proveedor)
values
('deportes elite s.a.', 'carlos ramírez', '3104567890', 'contacto@deporteselite.com', 'cra 45 #12-34, bogotá'),
('sportline distribuciones', 'maría gómez', '3159876543', 'ventas@sportline.com', 'av. las américas #23-45, medellín'),
('todofitness ltda.', 'andrés lópez', '3006543210', 'info@todofitness.com', 'calle 50 #67-12, cali'),
('proveedora olímpica', 'laura torres', '3123456789', 'ltorres@proveedoraolimpica.com', 'carrera 9 #80-22, barranquilla'),
('suministros deportivos sas', 'jorge martínez', '3012233445', 'jorge@suministrosdeportivos.com', 'calle 100 #15-40, bogotá'),
('equipos progym', 'diana herrera', '3209988776', 'dherrera@progym.com', 'av. 30 de agosto #45-67, pereira'),
('distribuciones runningpro', 'luis castillo', '3167788990', 'ventas@runningpro.com', 'calle 10 #25-30, bucaramanga'),
('balones y redes s.a.', 'paola rincón', '3184455667', 'paola@balonesyredes.com', 'cra 21 #45-10, cartagena'),
('fitequipos sas', 'andrés peña', '3178899001', 'andres@fitequipos.com', 'cl 45 #23-10, manizales'),
('gympro distribuciones', 'carolina ríos', '3164455667', 'carolina@gympro.com', 'cra 15 #30-20, ibagué');

create table sucursales (
    id_sucursal int auto_increment primary key,
    nombre_sucursal varchar(100) unique,
    direccion_sucursal varchar(150),
    telefono_sucursal varchar(20) unique
);

insert into sucursales (nombre_sucursal, direccion_sucursal, telefono_sucursal)
values
('sucursal centro bogotá', 'cra 7 #12-34, bogotá', '6013456789'),
('sucursal norte bogotá', 'av. 19 #120-45, bogotá', '6019876543'),
('sucursal medellín poblado', 'cra 43a #6-50, medellín', '6043112233'),
('sucursal medellín centro', 'calle 50 #45-10, medellín', '6044567890'),
('sucursal cali norte', 'av. 3n #34-67, cali', '6023211122'),
('sucursal cali sur', 'cra 66 #13-45, cali', '6026547890'),
('sucursal barranquilla centro', 'carrera 45 #50-22, barranquilla', '6053556677'),
('sucursal bucaramanga cabecera', 'calle 36 #33-40, bucaramanga', '6076123456'),
('sucursal cartagena bocagrande', 'cra 1 #8-12, cartagena', '6056789012'),
('sucursal pereira circunvalar', 'av. circunvalar #15-20, pereira', '6063456789');

create table bodega_f (
    id_bodega_f int auto_increment primary key,
    nombre_bodega_f varchar(100) unique,
    ubicacion_bodega_f varchar(150),
    capacidad_bodega_f int,
    id_sucursal_f int,
    foreign key (id_sucursal_f) references sucursales(id_sucursal)
);

insert into bodega_f (nombre_bodega_f, ubicacion_bodega_f, capacidad_bodega_f, id_sucursal_f)
values
('bodega central bogotá', 'cra 7 #12-34, bogotá', 1000, 1),
('bodega norte bogotá', 'av. 19 #120-45, bogotá', 800, 2),
('bodega medellín poblado', 'cra 43a #6-50, medellín', 600, 3),
('bodega medellín centro', 'calle 50 #45-10, medellín', 500, 4),
('bodega cali norte', 'av. 3n #34-67, cali', 700, 5),
('bodega cali sur', 'cra 66 #13-45, cali', 650, 6),
('bodega barranquilla centro', 'carrera 45 #50-22, barranquilla', 400, 7),
('bodega bucaramanga cabecera', 'calle 36 #33-40, bucaramanga', 550, 8),
('bodega cartagena bocagrande', 'cra 1 #8-12, cartagena', 450, 9),
('bodega pereira circunvalar', 'av. circunvalar #15-20, pereira', 500, 10);

create table tecnicos (
    id_tecnico int auto_increment primary key,
    id_usuario_t int,
    certificacion_t varchar(100),
    cargo_t varchar(50),
    foreign key (id_usuario_t) references usuarios(id_usuario)
);

insert into tecnicos (id_usuario_t, certificacion_t, cargo_t)
values
(1, 'certificación en redes y cableado estructurado', 'junior'),
(2, 'certificación en instalación de domótica', 'junior'),
(3, 'certificación en seguridad electrónica', 'semi senior'),
(4, 'certificación en soporte de sistemas iot', 'junior'),
(5, 'certificación en programación de plcs', 'senior'),
(6, 'certificación en bases de datos y servidores', 'senior'),
(7, 'certificación en automatización de hogares', 'semi senior'),
(8, 'certificación en seguridad informática', 'senior'),
(9, 'certificación en programación backend', 'semi senior'),
(10, 'certificación en gestión de proyectos', 'senior');

create table novedades (
    id_novedad int auto_increment primary key,
    id_tecnico_n int,
    fecha_reporte_novedad datetime,
    tipo_novedad varchar(100),
    descripcion_novedad text,
    estado_novedad varchar(50),
    foreign key (id_tecnico_n) references tecnicos(id_tecnico)
);

insert into novedades (id_tecnico_n, fecha_reporte_novedad, tipo_novedad, descripcion_novedad, estado_novedad)
values
(1, '2025-09-01 09:30:00', 'falla técnica', 'sensor pir no responde', 'pendiente'),
(2, '2025-09-02 10:45:00', 'instalación', 'controlador central defectuoso', 'resuelto'),
(3, '2025-09-03 11:15:00', 'mantenimiento', 'cámara ip con visión parcial', 'pendiente'),
(4, '2025-09-04 12:30:00', 'red wifi', 'router requiere reinicio', 'pendiente'),
(5, '2025-09-05 13:20:00', 'sensores', 'sensor de puerta mal instalado', 'resuelto'),
(6, '2025-09-06 14:10:00', 'plc', 'falla en programación del plc', 'pendiente'),
(7, '2025-09-07 15:50:00', 'mantenimiento', 'fuente de poder 12v fallando', 'pendiente'),
(8, '2025-09-08 16:40:00', 'ase<+soría', 'cliente solicita cambios en configuración', 'pendiente'),
(9, '2025-09-09 17:25:00', 'cámara ip', 'soporte de pared dañado', 'resuelto'),
(10, '2025-09-10 18:05:00', 'baterías', 'batería recargable 18650 no carga', 'pendiente');

create table detalle_ruta (
    id_detaruta int primary key auto_increment,
    id_ruta_dr int,
    id_tecnico int,
    id_bodega_et int
);

insert into detalle_ruta (id_ruta_dr, id_tecnico, id_bodega_et)
values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

create table rutero (
    id_ruta int auto_increment primary key,
    id_detalle_r int,
    fecha_ruta date,
    hora_ruta time,
    direccion_ruta varchar(255),
    estado_ruta varchar(50) default 'pendiente',
    observaciones_ruta text,
    foreign key (id_detalle_r) references detalle_ruta(id_detaruta)
);

insert into rutero (id_detalle_r, fecha_ruta, hora_ruta, direccion_ruta, estado_ruta, observaciones_ruta)
values
(1, '2025-09-01', '09:00:00', 'cra 10 #12-34', 'pendiente', 'revisión inicial del sistema'),
(2, '2025-09-02', '10:00:00', 'av 30 #15-09', 'pendiente', 'instalación de sensores'),
(3, '2025-09-03', '11:00:00', 'mz a casa 10', 'pendiente', 'mantenimiento de cámaras'),
(4, '2025-09-04', '12:00:00', 'cl 8b #20-45', 'pendiente', 'configuración de red wifi'),
(5, '2025-09-05', '13:00:00', 'cl 19 #13-55', 'pendiente', 'prueba de sensores de puerta'),
(6, '2025-09-06', '14:00:00', 'av 68 #54-23', 'pendiente', 'programación de plc'),
(7, '2025-09-07', '15:00:00', 'cl 100 #25-10', 'pendiente', 'mantenimiento general'),
(8, '2025-09-08', '16:00:00', 'cra 7 #89-12', 'pendiente', 'asesoría técnica en domótica'),
(9, '2025-09-09', '17:00:00', 'carrera 9 #80-22', 'pendiente', 'instalación de cámaras ip'),
(10, '2025-09-10', '18:00:00', 'av. 30 de agosto #45-67', 'pendiente', 'revisión de baterías y fuentes');

create table productos (
    id_producto int auto_increment primary key,
    nombre_producto varchar(100),
    referencia_producto varchar(50) unique,
    id_proveedor_pr int,
    precio_compra_producto decimal(10,2),
    precio_venta_producto decimal(10,2),
    fecha_registro_producto datetime,
    foreign key (id_proveedor_pr) references proveedores(id_proveedor)
);

insert into productos (nombre_producto, referencia_producto, id_proveedor_pr, precio_compra_producto, precio_venta_producto, fecha_registro_producto)
values
('sensor de movimiento pir', 'smi-001', 1, 45000.00, 70000.00, '2025-07-01'),
('controlador central domótico', 'ccd-004', 3, 90000.00, 160000.00, '2025-07-03'),
('cinta led rgb', 'led-003', 1, 12000.00, 20000.00, '2025-07-02'),
('kit de automatización básica', 'kit-001', 5, 100000.00, 180000.00, '2025-07-04'),
('cable utp cat6', 'utp6-050', 4, 3000.00, 6000.00, '2025-07-03'),
('sensor de puerta/ventana', 'spd-006', 2, 25000.00, 39000.00, '2025-07-04'),
('enchufe inteligente wifi', 'eiw-007', 1, 34000.00, 58000.00, '2025-07-04'),
('fuente de poder 12v 5a', 'ps12-5a', 4, 28000.00, 50000.00, '2025-07-04'),
('cámara ip 1080p', 'cip-003', 2, 120000.00, 170000.00, '2025-07-04'),
('batería recargable 18650', 'bat18650', 6, 5000.00, 10000.00, '2025-07-05');

create table insumos (
    id_insumo int auto_increment primary key,
    nombre_insumo varchar(100) unique,
    ubicacion_insumo varchar(150),
    capacidad_insumo int,
    id_tecnico_insumo int,
    foreign key (id_tecnico_insumo) references tecnicos(id_tecnico)
);

insert into insumos (nombre_insumo, ubicacion_insumo, capacidad_insumo, id_tecnico_insumo)
values
('bodega técnico 1', 'cra 7 #12-34, bogotá', 100, 1),
('bodega técnico 2', 'av. 19 #120-45, bogotá', 80, 2),
('bodega técnico 3', 'cra 43a #6-50, medellín', 60, 3),
('bodega técnico 4', 'calle 50 #45-10, medellín', 50, 4),
('bodega técnico 5', 'av. 3n #34-67, cali', 70, 5),
('bodega técnico 6', 'cra 66 #13-45, cali', 65, 6),
('bodega técnico 7', 'carrera 45 #50-22, barranquilla', 40, 7),
('bodega técnico 8', 'calle 36 #33-40, bucaramanga', 55, 8),
('bodega técnico 9', 'cra 1 #8-12, cartagena', 45, 9),
('bodega técnico 10', 'av. circunvalar #15-20, pereira', 50, 10);

create table inventario_f (
    id_inventario_f int auto_increment primary key,
    id_producto_if int,
    id_bodega_if int,
    cantidad_if int,
    fecha_registro_if datetime,
    foreign key (id_producto_if) references productos(id_producto),
    foreign key (id_bodega_if) references bodega_f(id_bodega_f)
);

insert into inventario_f (id_producto_if, id_bodega_if, cantidad_if, fecha_registro_if)
values
(1, 1, 50, '2025-07-01'),
(2, 2, 20, '2025-07-02'),
(3, 3, 100, '2025-07-03'),
(4, 4, 15, '2025-07-04'),
(5, 5, 300, '2025-07-05'),
(6, 6, 75, '2025-07-06'),
(7, 7, 40, '2025-07-07'),
(8, 8, 60, '2025-07-08'),
(9, 9, 25, '2025-07-09'),
(10, 10, 120, '2025-07-10');

create table bodega_et (
    id_insumo_et int auto_increment primary key,
    id_producto_et int,
    id_insumos_et int,
    cantidad_et int,
    fecha_registro_et datetime,
    foreign key (id_producto_et) references productos(id_producto)
);

insert into bodega_et (id_producto_et, id_insumos_et, cantidad_et, fecha_registro_et)
values
(1, 1, 10, '2025-07-01'),
(2, 2, 5, '2025-07-02'),
(3, 3, 30, '2025-07-03'),
(4, 4, 2, '2025-07-04'),
(5, 5, 100, '2025-07-05'),
(6, 6, 15, '2025-07-06'),
(7, 7, 8, '2025-07-07'),
(8, 8, 20, '2025-07-08'),
(9, 9, 4, '2025-07-09'),
(10, 10, 50, '2025-07-10');

create table tipos_servicios (
    id_tipo_ser int primary key auto_increment,
    descripcion_tipo varchar(150)
);

insert into tipos_servicios (descripcion_tipo)
values
('instalación'),
('mantenimiento'),
('configuración'),
('soporte'),
('programación'),
('asesoría');

create table servicios (
    id_servicio int auto_increment primary key,
    id_tipo_ser int,
    precio_servicio decimal(10,2),
    total_servicio decimal(10,2),
    id_tecnico_s int,
    foreign key (id_tipo_ser) references tipos_servicios(id_tipo_ser),
    foreign key (id_tecnico_s) references tecnicos(id_tecnico)
);

insert into servicios (id_tipo_ser, precio_servicio, total_servicio, id_tecnico_s)
values
(1, 150000.00, 150000.00, 1),
(2, 80000.00, 80000.00, 2),
(3, 60000.00, 60000.00, 3),
(4, 70000.00, 70000.00, 4),
(1, 50000.00, 50000.00, 5),
(5, 120000.00, 120000.00, 6),
(2, 90000.00, 90000.00, 7),
(6, 100000.00, 100000.00, 8),
(1, 85000.00, 85000.00, 9),
(2, 40000.00, 40000.00, 10);

create table pedidos (
    id_pedido int auto_increment primary key,
    id_cliente_pe int,
    fecha_peedido datetime,
    total_pedido decimal(10,2),
    estado_pedido varchar(50),
    foreign key (id_cliente_pe) references clientes(id_cliente)
);

insert into pedidos (id_cliente_pe, fecha_peedido, total_pedido, estado_pedido)
values
(1, '2025-08-01 09:30:00', 150000.00, 'activo'),
(2, '2025-08-02 11:00:00', 80000.00, 'activo'),
(3, '2025-08-03 11:30:00', 60000.00, 'activo'),
(4, '2025-08-04 14:30:00', 70000.00, 'activo'),
(5, '2025-08-05 16:00:00', 50000.00, 'activo'),
(6, '2025-08-06 08:30:00', 120000.00, 'activo'),
(7, '2025-08-07 10:00:00', 90000.00, 'activo'),
(8, '2025-08-08 10:30:00', 100000.00, 'activo'),
(9, '2025-08-09 13:30:00', 85000.00, 'activo'),
(10, '2025-08-10 16:30:00', 40000.00, 'activo');

create table comisiones (
    id_comision int auto_increment primary key,
    porcentaje_comision decimal(5,2),
    valor_comision decimal(10,2)
);

insert into comisiones (porcentaje_comision, valor_comision)
values
(5.00, 3500.00),
(5.00, 8000.00),
(5.00, 1000.00),
(5.00, 9000.00),
(5.00, 300.00),
(5.00, 1950.00),
(5.00, 2900.00),
(5.00, 2500.00),
(5.00, 8500.00),
(5.00, 500.00);

create table detalle_pedido (
    id_detalle int auto_increment primary key,
    id_pedido_d int,
    id_producto_d int,
    id_servicio_d int,
    id_comision_d int,
    cantidad_detalle int,
    precio_unitario_detalle decimal(10,2),
    subtotal_detalle decimal(10,2),
    foreign key (id_pedido_d) references pedidos(id_pedido),
    foreign key (id_producto_d) references productos(id_producto),
    foreign key (id_servicio_d) references servicios(id_servicio),
    foreign key (id_comision_d) references comisiones(id_comision)
);

insert into detalle_pedido 
(id_pedido_d, id_producto_d, id_servicio_d, id_comision_d, cantidad_detalle, precio_unitario_detalle, subtotal_detalle)
values
(1, 1, 1, 1, 1, 70000.00, 70000.00),
(2, 2, 2, 2, 1, 160000.00, 160000.00),
(3, 3, 3, 3, 1, 20000.00, 20000.00),
(4, 4, 4, 4, 1, 180000.00, 180000.00),
(5, 5, 5, 5, 1, 6000.00, 6000.00),
(6, 6, 6, 6, 1, 39000.00, 39000.00),
(7, 7, 7, 7, 1, 58000.00, 58000.00),
(8, 8, 8, 8, 1, 50000.00, 50000.00),
(9, 9, 9, 9, 1, 170000.00, 170000.00),
(10, 10, 10, 10, 1, 10000.00, 10000.00);

create table password_reset_tokens (
    id int auto_increment primary key,
    email_usuario varchar(100),
    email_cliente varchar(100),
    token varchar(100) null,
    code varchar(6) null,
    created_at datetime default current_timestamp,
    expires_at datetime not null,
    used boolean default false,
    foreign key (email_usuario) references usuarios(correo_usuario),
    foreign key (email_cliente) references clientes(correo_cliente)
);

-- ============================================
-- script completo - neodomus
-- incluye: 15 triggers + 10 out + 5 inout + 10 vistas
-- ============================================

use neodomus;

-- ============================================
-- parte 1: triggers (15 triggers originales + 2 adicionales = 17 total)
-- ============================================

-- asegurar que existe la tabla de auditoría
create table if not exists auditoria (
    id_auditoria int auto_increment primary key,
    tabla varchar(50),
    operacion varchar(10),
    fecha datetime,
    usuario varchar(100),
    datos_antiguos text,
    datos_nuevos text
);

-- trigger 1: before insert on clientes - convertir nombre y apellido a mayúsculas
delimiter //
drop trigger if exists before_insert_clientes//
create trigger before_insert_clientes
before insert on clientes
for each row
begin
    set new.nombre_cliente = upper(new.nombre_cliente);
    set new.apellido_cliente = upper(new.apellido_cliente);
end//
delimiter ;

-- trigger 2: before update on clientes - convertir correo a minúsculas
delimiter //
drop trigger if exists before_update_clientes//
create trigger before_update_clientes
before update on clientes
for each row
begin
    set new.correo_cliente = lower(new.correo_cliente);
end//
delimiter ;

-- trigger 3: before insert on productos - asignar fecha actual
delimiter //
drop trigger if exists before_insert_productos//
create trigger before_insert_productos
before insert on productos
for each row
begin
    set new.fecha_registro_producto = now();
end//
delimiter ;

-- trigger 4: before update on productos - convertir nombre a mayúsculas
delimiter //
drop trigger if exists before_update_productos//
create trigger before_update_productos
before update on productos
for each row
begin
    set new.nombre_producto = upper(new.nombre_producto);
end//
delimiter ;

-- trigger 5: before insert on inventario_f - cantidad no negativa
delimiter //
drop trigger if exists before_insert_inventario_f//
create trigger before_insert_inventario_f
before insert on inventario_f
for each row
begin
    set new.cantidad_if = abs(new.cantidad_if);
end//
delimiter ;

-- trigger 6: before insert on usuarios - convertir nombre y apellido a mayúsculas
delimiter //
drop trigger if exists before_insert_usuarios//
create trigger before_insert_usuarios
before insert on usuarios
for each row
begin
    set new.nombre_usuario = upper(new.nombre_usuario);
    set new.apellido_usuario = upper(new.apellido_usuario);
end//
delimiter ;

-- trigger 7: after insert on clientes - auditoría
delimiter //
drop trigger if exists after_insert_clientes//
create trigger after_insert_clientes
after insert on clientes
for each row
begin
    insert into auditoria (tabla, operacion, fecha, usuario, datos_nuevos)
    values ('clientes', 'insert', now(), user(),
            concat('id=', new.id_cliente, ', nombre=', new.nombre_cliente, 
                   ', apellido=', new.apellido_cliente));
end//
delimiter ;

-- trigger 8: after update on clientes - auditoría
delimiter //
drop trigger if exists after_update_clientes//
create trigger after_update_clientes
after update on clientes
for each row
begin
    insert into auditoria (tabla, operacion, fecha, usuario, datos_antiguos, datos_nuevos)
    values ('clientes', 'update', now(), user(),
            concat('id=', old.id_cliente, ', nombre=', old.nombre_cliente),
            concat('id=', new.id_cliente, ', nombre=', new.nombre_cliente));
end//
delimiter ;

-- trigger 9: after delete on clientes - auditoría
delimiter //
drop trigger if exists after_delete_clientes//
create trigger after_delete_clientes
after delete on clientes
for each row
begin
    insert into auditoria (tabla, operacion, fecha, usuario, datos_antiguos)
    values ('clientes', 'delete', now(), user(),
            concat('id=', old.id_cliente, ', nombre=', old.nombre_cliente));
end//
delimiter ;

-- trigger 10: after insert on productos - auditoría
delimiter //
drop trigger if exists after_insert_productos//
create trigger after_insert_productos
after insert on productos
for each row
begin
    insert into auditoria (tabla, operacion, fecha, usuario, datos_nuevos)
    values ('productos', 'insert', now(), user(),
            concat('id=', new.id_producto, ', nombre=', new.nombre_producto));
end//
delimiter ;

-- trigger 11: after update on productos - auditoría
delimiter //
drop trigger if exists after_update_productos//
create trigger after_update_productos
after update on productos
for each row
begin
    insert into auditoria (tabla, operacion, fecha, usuario, datos_antiguos, datos_nuevos)
    values ('productos', 'update', now(), user(),
            concat('id=', old.id_producto, ', nombre=', old.nombre_producto),
            concat('id=', new.id_producto, ', nombre=', new.nombre_producto));
end//
delimiter ;

-- trigger 12: after delete on productos - auditoría
delimiter //
drop trigger if exists after_delete_productos//
create trigger after_delete_productos
after delete on productos
for each row
begin
    insert into auditoria (tabla, operacion, fecha, usuario, datos_antiguos)
    values ('productos', 'delete', now(), user(),
            concat('id=', old.id_producto, ', nombre=', old.nombre_producto));
end//
delimiter ;

-- trigger 13: after insert on detalle_pedido - actualizar total del pedido
delimiter //
drop trigger if exists after_insert_detalle_pedido//
create trigger after_insert_detalle_pedido
after insert on detalle_pedido
for each row
begin
    update pedidos
    set total_pedido = total_pedido + new.subtotal_detalle
    where id_pedido = new.id_pedido_d;
end//
delimiter ;

-- trigger 14: after update on detalle_pedido - actualizar total del pedido
delimiter //
drop trigger if exists after_update_detalle_pedido//
create trigger after_update_detalle_pedido
after update on detalle_pedido
for each row
begin
    update pedidos
    set total_pedido = total_pedido - old.subtotal_detalle + new.subtotal_detalle
    where id_pedido = new.id_pedido_d;
end//
delimiter ;

-- trigger 15: after delete on detalle_pedido - actualizar total del pedido
delimiter //
drop trigger if exists after_delete_detalle_pedido//
create trigger after_delete_detalle_pedido
after delete on detalle_pedido
for each row
begin
    update pedidos
    set total_pedido = total_pedido - old.subtotal_detalle
    where id_pedido = old.id_pedido_d;
end//
delimiter ;

-- trigger 16: before insert on pedidos - asignar fecha automática
delimiter //
drop trigger if exists before_insert_pedidos//
create trigger before_insert_pedidos
before insert on pedidos
for each row
begin
    if new.fecha_peedido is null then
        set new.fecha_peedido = now();
    end if;
    if new.estado_pedido is null then
        set new.estado_pedido = 'activo';
    end if;
end//
delimiter ;

-- trigger 17: before update on inventario_f - validar stock no negativo
delimiter //
drop trigger if exists before_update_inventario_f//
create trigger before_update_inventario_f
before update on inventario_f
for each row
begin
    if new.cantidad_if < 0 then
        signal sqlstate '45000' set message_text = 'error: la cantidad no puede ser negativa';
    end if;
end//
delimiter ;

-- ============================================
-- parte 2: procedimientos con out (10)
-- ============================================

-- 1. contar clientes activos
delimiter //
drop procedure if exists contar_clientes_activos//
create procedure contar_clientes_activos(out total int)
begin
    select count(*) into total from clientes where is_active = true;
end//
delimiter ;

-- 2. calcular ingresos totales por pedidos
delimiter //
drop procedure if exists calcular_ingresos_totales//
create procedure calcular_ingresos_totales(out total decimal(10,2))
begin
    select ifnull(sum(total_pedido), 0) into total from pedidos;
end//
delimiter ;

-- 3. obtener total de productos en una bodega
delimiter //
drop procedure if exists obtener_total_productos_bodega//
create procedure obtener_total_productos_bodega(in bodega int, out total int)
begin
    select ifnull(sum(cantidad_if), 0) into total from inventario_f where id_bodega_if = bodega;
end//
delimiter ;

-- 4. promedio de precios de venta
delimiter //
drop procedure if exists promedio_precios_productos//
create procedure promedio_precios_productos(out promedio decimal(10,2))
begin
    select avg(precio_venta_producto) into promedio from productos;
end//
delimiter ;

-- 5. máximo pedido de un cliente
delimiter //
drop procedure if exists maximo_pedido_cliente//
create procedure maximo_pedido_cliente(in cliente int, out max_pedido decimal(10,2))
begin
    select ifnull(max(total_pedido), 0) into max_pedido from pedidos where id_cliente_pe = cliente;
end//
delimiter ;

-- 6. total de servicios por técnico
delimiter //
drop procedure if exists total_servicios_tecnico//
create procedure total_servicios_tecnico(in tecnico int, out total int)
begin
    select count(*) into total from servicios where id_tecnico_s = tecnico;
end//
delimiter ;

-- 7. novedades resueltas por técnico
delimiter //
drop procedure if exists novedades_resueltas//
create procedure novedades_resueltas(in tecnico int, out resueltas int)
begin
    select count(*) into resueltas from novedades n
    join tecnicos t on n.id_tecnico_n = t.id_tecnico
    where t.id_tecnico = tecnico and n.estado_novedad = 'resuelto';
end//
delimiter ;

-- 8. cantidad de productos por proveedor
delimiter //
drop procedure if exists cantidad_productos_proveedor//
create procedure cantidad_productos_proveedor(in proveedor int, out cantidad int)
begin
    select count(*) into cantidad from productos where id_proveedor_pr = proveedor;
end//
delimiter ;

-- 9. total de rutas por técnico
delimiter //
drop procedure if exists total_rutas_tecnicos//
create procedure total_rutas_tecnicos(in tecnico int, out rutas int)
begin
    select count(*) into rutas from rutero r
    join detalle_ruta dr on r.id_detalle_r = dr.id_detaruta
    where dr.id_tecnico = tecnico;
end//
delimiter ;

-- 10. total de pedidos activos
delimiter //
drop procedure if exists total_pedidos_activos//
create procedure total_pedidos_activos(out total int)
begin
    select count(*) into total from pedidos where estado_pedido = 'activo';
end//
delimiter ;

-- ============================================
-- parte 3: procedimientos con inout (5)
-- ============================================

-- 1. aplicar descuento a un precio
delimiter //
drop procedure if exists aplicar_descuento_producto//
create procedure aplicar_descuento_producto(inout precio decimal(10,2), in descuento decimal(5,2))
begin
    set precio = precio - (precio * descuento / 100);
end//
delimiter ;

-- 2. ajustar inventario
delimiter //
drop procedure if exists ajustar_inventario//
create procedure ajustar_inventario(inout cantidad int, in ajuste int)
begin
    set cantidad = cantidad + ajuste;
    if cantidad < 0 then set cantidad = 0; end if;
end//
delimiter ;

-- 3. actualizar estado de ruta
delimiter //
drop procedure if exists actualizar_estado_ruta//
create procedure actualizar_estado_ruta(inout estado varchar(50), in nuevo_estado varchar(50))
begin
    set estado = nuevo_estado;
end//
delimiter ;

-- 4. incrementar comisión
delimiter //
drop procedure if exists incrementar_comision//
create procedure incrementar_comision(inout comision decimal(10,2), in incremento decimal(5,2))
begin
    set comision = comision + (comision * incremento / 100);
end//
delimiter ;

-- 5. calcular total con iva
delimiter //
drop procedure if exists calcular_total_con_iva//
create procedure calcular_total_con_iva(inout total decimal(10,2), in iva decimal(5,2))
begin
    set total = total + (total * iva / 100);
end//
delimiter ;

-- ============================================
-- parte 4: vistas (10 con join, where, group by, funciones agregación)
-- ============================================

-- vista 1: ingresos por cliente (join + sum + group by)
drop view if exists vista_ingresos_por_cliente;
create view vista_ingresos_por_cliente as
select 
    c.id_cliente, c.nombre_cliente, c.apellido_cliente,
    ifnull(sum(p.total_pedido), 0) as total_gastado
from clientes c
left join pedidos p on c.id_cliente = p.id_cliente_pe
group by c.id_cliente, c.nombre_cliente, c.apellido_cliente;

-- vista 2: productos más vendidos (join + sum + group by)
drop view if exists vista_productos_mas_vendidos;
create view vista_productos_mas_vendidos as
select 
    pr.id_producto, pr.nombre_producto,
    ifnull(sum(dp.cantidad_detalle), 0) as total_vendido
from productos pr
left join detalle_pedido dp on pr.id_producto = dp.id_producto_d
group by pr.id_producto, pr.nombre_producto;

-- vista 3: técnicos con novedades pendientes (join + count + group by + having)
drop view if exists vista_tecnicos_novedades_pendientes;
create view vista_tecnicos_novedades_pendientes as
select 
    t.id_tecnico, u.nombre_usuario, u.apellido_usuario,
    count(n.id_novedad) as novedades_pendientes
from tecnicos t
join usuarios u on t.id_usuario_t = u.id_usuario
left join novedades n on t.id_tecnico = n.id_tecnico_n and n.estado_novedad = 'pendiente'
group by t.id_tecnico, u.nombre_usuario, u.apellido_usuario
having novedades_pendientes > 0;

-- vista 4: inventario por bodega (join + sum + group by)
drop view if exists vista_inventario_por_bodega;
create view vista_inventario_por_bodega as
select 
    b.id_bodega_f, b.nombre_bodega_f, s.nombre_sucursal,
    ifnull(sum(i.cantidad_if), 0) as total_productos
from bodega_f b
join sucursales s on b.id_sucursal_f = s.id_sucursal
left join inventario_f i on b.id_bodega_f = i.id_bodega_if
group by b.id_bodega_f, b.nombre_bodega_f, s.nombre_sucursal;

-- vista 5: servicios por tipo (join + count + sum + group by)
drop view if exists vista_servicios_por_tipo;
create view vista_servicios_por_tipo as
select 
    ts.id_tipo_ser, ts.descripcion_tipo,
    count(s.id_servicio) as total_servicios,
    ifnull(sum(s.total_servicio), 0) as ingreso_total
from tipos_servicios ts
left join servicios s on ts.id_tipo_ser = s.id_tipo_ser
group by ts.id_tipo_ser, ts.descripcion_tipo;

-- vista 6: clientes con pedidos activos (join + where + count + group by)
drop view if exists vista_clientes_pedidos_activos;
create view vista_clientes_pedidos_activos as
select 
    c.id_cliente, c.nombre_cliente, c.apellido_cliente, c.correo_cliente,
    count(p.id_pedido) as pedidos_activos
from clientes c
join pedidos p on c.id_cliente = p.id_cliente_pe
where p.estado_pedido = 'activo'
group by c.id_cliente, c.nombre_cliente, c.apellido_cliente, c.correo_cliente;

-- vista 7: proveedores con productos (join + count + min + max + group by)
drop view if exists vista_proveedores_productos;
create view vista_proveedores_productos as
select 
    p.id_proveedor, p.nombre_proveedor,
    count(pr.id_producto) as total_productos,
    ifnull(min(pr.precio_venta_producto), 0) as precio_minimo,
    ifnull(max(pr.precio_venta_producto), 0) as precio_maximo
from proveedores p
left join productos pr on p.id_proveedor = pr.id_proveedor_pr
group by p.id_proveedor, p.nombre_proveedor;

-- vista 8: rutas por técnico (join + count + sum + group by)
drop view if exists vista_rutas_por_tecnico;
create view vista_rutas_por_tecnico as
select 
    t.id_tecnico, u.nombre_usuario, u.apellido_usuario,
    count(r.id_ruta) as total_rutas,
    sum(case when r.estado_ruta = 'pendiente' then 1 else 0 end) as rutas_pendientes
from tecnicos t
join usuarios u on t.id_usuario_t = u.id_usuario
left join detalle_ruta dr on t.id_tecnico = dr.id_tecnico
left join rutero r on dr.id_detaruta = r.id_detalle_r
group by t.id_tecnico, u.nombre_usuario, u.apellido_usuario;

-- vista 9: comisiones por pedido (join + sum + group by)
drop view if exists vista_comisiones_por_pedido;
create view vista_comisiones_por_pedido as
select 
    p.id_pedido, c.nombre_cliente, c.apellido_cliente, p.total_pedido,
    ifnull(sum(dp.subtotal_detalle * (com.porcentaje_comision / 100)), 0) as total_comision
from pedidos p
join clientes c on p.id_cliente_pe = c.id_cliente
left join detalle_pedido dp on p.id_pedido = dp.id_pedido_d
left join comisiones com on dp.id_comision_d = com.id_comision
group by p.id_pedido, c.nombre_cliente, c.apellido_cliente, p.total_pedido;

-- vista 10: top 5 técnicos con más servicios (join + count + group by + order by + limit)
drop view if exists vista_top_tecnicos_servicios;
create view vista_top_tecnicos_servicios as
select 
    t.id_tecnico, u.nombre_usuario, u.apellido_usuario,
    count(s.id_servicio) as total_servicios
from tecnicos t
join usuarios u on t.id_usuario_t = u.id_usuario
left join servicios s on t.id_tecnico = s.id_tecnico_s
group by t.id_tecnico, u.nombre_usuario, u.apellido_usuario
order by total_servicios desc
limit 5;

-- ============================================
-- parte 5: ejecución de pruebas
-- ============================================

-- pruebas de procedimientos out
call contar_clientes_activos(@total); select @total as clientesactivos;
call calcular_ingresos_totales(@ingresos); select @ingresos as ingresostotales;
call promedio_precios_productos(@prom); select @prom as preciopromedio;
call total_pedidos_activos(@activos); select @activos as pedidosactivos;

-- pruebas de procedimientos inout
set @precio = 100000; call aplicar_descuento_producto(@precio, 10); select @precio as preciocondescuento;
set @stock = 50; call ajustar_inventario(@stock, -10); select @stock as stockajustado;
set @total = 150000; call calcular_total_con_iva(@total, 19); select @total as totalconiva;

-- pruebas de vistas
select * from vista_ingresos_por_cliente;
select * from vista_productos_mas_vendidos;
select * from vista_tecnicos_novedades_pendientes;
select * from vista_inventario_por_bodega;
select * from vista_servicios_por_tipo;
select * from vista_clientes_pedidos_activos;
select * from vista_proveedores_productos;
select * from vista_rutas_por_tecnico;
select * from vista_comisiones_por_pedido;
select * from vista_top_tecnicos_servicios;