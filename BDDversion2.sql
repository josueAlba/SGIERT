/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     10/07/2018 20:19:07                          */
/*==============================================================*/


drop index i_idcalificacion;

alter table calificacion_trabajo
   drop constraint PK_CALIFICACION_TRABAJO;

drop table calificacion_trabajo;

drop index i_idcargo;

alter table cargo
   drop constraint PK_CARGO;

drop table cargo;

drop index i_idcategoria;

alter table categoria_material
   drop constraint PK_CATEGORIA_MATERIAL;

drop table categoria_material;

drop index i_idciudad;

alter table ciudad
   drop constraint PK_CIUDAD;

drop table ciudad;

drop index i_idcliente;

alter table cliente
   drop constraint PK_CLIENTE;

drop table cliente;

drop index i_detallematerial;

alter table detalle_material
   drop constraint PK_DETALLE_MATERIAL;

drop table detalle_material;

drop index i_idempleado;

alter table empleado
   drop constraint PK_EMPLEADO;

drop table empleado;

drop index i_idmaterial;

alter table material
   drop constraint PK_MATERIAL;

drop table material;

drop index i_idordentrabajo;

alter table ordentrabajo
   drop constraint PK_ORDENTRABAJO;

drop table ordentrabajo;

drop index i_idprovincia;

alter table provincia
   drop constraint PK_PROVINCIA;

drop table provincia;

drop index i_idrol;

alter table rol
   drop constraint PK_ROL;

drop table rol;

drop index i_idtipo;

alter table tipoinstalacion
   drop constraint PK_TIPOINSTALACION;

drop table tipoinstalacion;

drop index i_unidadmedida;

alter table unidad_medida
   drop constraint PK_UNIDAD_MEDIDA;

drop table unidad_medida;

drop index i_idusuario;

alter table usuario
   drop constraint PK_USUARIO;

drop table usuario;

/*==============================================================*/
/* Table: calificacion_trabajo                                  */
/*==============================================================*/
create table calificacion_trabajo (
   id_calificacion      NUMERIC(5)           not null,
   id_ordentrabajo      NUMERIC(10)          null,
   calificacion_trabajo NUMERIC(1)           not null,
   observaciones        VARCHAR(100)         null,
   estado_calificacion  CHAR(1)              not null
);

alter table calificacion_trabajo
   add constraint PK_CALIFICACION_TRABAJO primary key (id_calificacion);

/*==============================================================*/
/* Index: i_idcalificacion                                      */
/*==============================================================*/
create unique index i_idcalificacion on calificacion_trabajo (
id_calificacion
);

/*==============================================================*/
/* Table: cargo                                                 */
/*==============================================================*/
create table cargo (
   id_cargo             NUMERIC(5)           not null,
   nombre_cargo         VARCHAR(50)          null,
   descripcion          VARCHAR(100)         null,
   estado_cargo         CHAR(1)              not null
);

alter table cargo
   add constraint PK_CARGO primary key (id_cargo);

/*==============================================================*/
/* Index: i_idcargo                                             */
/*==============================================================*/
create unique index i_idcargo on cargo (
id_cargo
);

/*==============================================================*/
/* Table: categoria_material                                    */
/*==============================================================*/
create table categoria_material (
   id_categoria         NUMERIC(3)           not null,
   nombre_categoria     VARCHAR(50)          not null,
   descripcion_categoria VARCHAR(150)         null,
   estado_categoria     CHAR(1)              not null
);

alter table categoria_material
   add constraint PK_CATEGORIA_MATERIAL primary key (id_categoria);

/*==============================================================*/
/* Index: i_idcategoria                                         */
/*==============================================================*/
create unique index i_idcategoria on categoria_material (
id_categoria
);

/*==============================================================*/
/* Table: ciudad                                                */
/*==============================================================*/
create table ciudad (
   id_ciudad            NUMERIC(3)           not null,
   id_provincia         NUMERIC(2)           null,
   nombre_ciudad        VARCHAR(50)          not null,
   estado_ciudad        CHAR(1)              not null
);

alter table ciudad
   add constraint PK_CIUDAD primary key (id_ciudad);

/*==============================================================*/
/* Index: i_idciudad                                            */
/*==============================================================*/
create unique index i_idciudad on ciudad (
id_ciudad
);

/*==============================================================*/
/* Table: cliente                                               */
/*==============================================================*/
create table cliente (
   id_cliente           VARCHAR(10)          not null,
   nombre_cliente       VARCHAR(50)          not null,
   apellido_cliente     VARCHAR(50)          not null,
   provincia_cliente    VARCHAR(50)          null,
   ciudad_cliente       VARCHAR(50)          null,
   direccion_cliente    VARCHAR(200)         null,
   telefono_cliente     VARCHAR(50)          null,
   email_cliente        VARCHAR(50)          null,
   estado_cliente       CHAR(1)              not null
);

alter table cliente
   add constraint PK_CLIENTE primary key (id_cliente);

/*==============================================================*/
/* Index: i_idcliente                                           */
/*==============================================================*/
create unique index i_idcliente on cliente (
id_cliente
);

/*==============================================================*/
/* Table: detalle_material                                      */
/*==============================================================*/
create table detalle_material (
   id_detallematerial   NUMERIC(5)           not null,
   id_ordentrabajo      NUMERIC(10)          null,
   id_material          NUMERIC(5)           null,
   cantidad             NUMERIC(10)          not null,
   precio_unitario      DECIMAL(7,2)         not null,
   estado_detalle       CHAR(1)              not null
);

alter table detalle_material
   add constraint PK_DETALLE_MATERIAL primary key (id_detallematerial);

/*==============================================================*/
/* Index: i_detallematerial                                     */
/*==============================================================*/
create unique index i_detallematerial on detalle_material (
id_detallematerial
);

/*==============================================================*/
/* Table: empleado                                              */
/*==============================================================*/
create table empleado (
   id_empleado          VARCHAR(10)          not null,
   id_cargo             NUMERIC(5)           null,
   nombre_empleado      VARCHAR(50)          not null,
   apellido_empleado    VARCHAR(50)          not null,
   provincia_empleado   VARCHAR(50)          null,
   ciudad_empleado      VARCHAR(50)          null,
   direccion_empleado   VARCHAR(200)         null,
   telefono_empleado    VARCHAR(50)          null,
   email_empleado       VARCHAR(50)          null,
   reputacion_empleado  NUMERIC(1)           null default 6,
   estado_empleado      CHAR(1)              not null
);

alter table empleado
   add constraint PK_EMPLEADO primary key (id_empleado);

/*==============================================================*/
/* Index: i_idempleado                                          */
/*==============================================================*/
create unique index i_idempleado on empleado (
id_empleado
);

/*==============================================================*/
/* Table: material                                              */
/*==============================================================*/
create table material (
   id_material          NUMERIC(5)           not null,
   id_categoria         NUMERIC(3)           null,
   id_unidadmedida      NUMERIC(3)           null,
   nombre_material      VARCHAR(50)          not null,
   descripcion_material VARCHAR(150)         null,
   stock_material       NUMERIC(8)           not null,
   precio_unitario      DECIMAL(7,2)         null,
   estado_material      CHAR(1)              not null
);

alter table material
   add constraint PK_MATERIAL primary key (id_material);

/*==============================================================*/
/* Index: i_idmaterial                                          */
/*==============================================================*/
create unique index i_idmaterial on material (
id_material
);

/*==============================================================*/
/* Table: ordentrabajo                                          */
/*==============================================================*/
create table ordentrabajo (
   id_ordentrabajo      NUMERIC(10)          not null,
   id_tipo              NUMERIC(3)           null,
   id_cliente           VARCHAR(10)          null,
   id_empleado          VARCHAR(10)          null,
   estado               VARCHAR(50)          not null,
   fecha                DATE                 null,
   observaciones        VARCHAR(200)         null,
   estado_orden         CHAR(1)              not null
);

alter table ordentrabajo
   add constraint PK_ORDENTRABAJO primary key (id_ordentrabajo);

/*==============================================================*/
/* Index: i_idordentrabajo                                      */
/*==============================================================*/
create unique index i_idordentrabajo on ordentrabajo (
id_ordentrabajo
);

/*==============================================================*/
/* Table: provincia                                             */
/*==============================================================*/
create table provincia (
   id_provincia         NUMERIC(2)           not null,
   nombre_provincia     VARCHAR(50)          not null,
   estado_provincia     CHAR(1)              not null
);

alter table provincia
   add constraint PK_PROVINCIA primary key (id_provincia);

/*==============================================================*/
/* Index: i_idprovincia                                         */
/*==============================================================*/
create unique index i_idprovincia on provincia (
id_provincia
);

/*==============================================================*/
/* Table: rol                                                   */
/*==============================================================*/
create table rol (
   id_rol               NUMERIC(2)           not null,
   nombre_rol           VARCHAR(50)          not null,
   descripcion_rol      VARCHAR(100)         null,
   estado_rol           CHAR(1)              not null
);

alter table rol
   add constraint PK_ROL primary key (id_rol);

/*==============================================================*/
/* Index: i_idrol                                               */
/*==============================================================*/
create unique index i_idrol on rol (
id_rol
);

/*==============================================================*/
/* Table: tipoinstalacion                                       */
/*==============================================================*/
create table tipoinstalacion (
   id_tipo              NUMERIC(3)           not null,
   nombre_tipo          VARCHAR(50)          not null,
   descripcion          VARCHAR(100)         null,
   estado_tipo          CHAR(1)              not null
);

alter table tipoinstalacion
   add constraint PK_TIPOINSTALACION primary key (id_tipo);

/*==============================================================*/
/* Index: i_idtipo                                              */
/*==============================================================*/
create unique index i_idtipo on tipoinstalacion (
id_tipo
);

/*==============================================================*/
/* Table: unidad_medida                                         */
/*==============================================================*/
create table unidad_medida (
   id_unidadmedida      NUMERIC(3)           not null,
   nombre_unidadmedida  VARCHAR(50)          null,
   descripcion_unidadmedida VARCHAR(150)         null,
   estado_unidad        CHAR(1)              not null
);

alter table unidad_medida
   add constraint PK_UNIDAD_MEDIDA primary key (id_unidadmedida);

/*==============================================================*/
/* Index: i_unidadmedida                                        */
/*==============================================================*/
create unique index i_unidadmedida on unidad_medida (
id_unidadmedida
);

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario (
   id_usuario           NUMERIC(10)          not null,
   id_rol               NUMERIC(2)           null,
   id_empleado          VARCHAR(10)          null,
   nombre_usuario       VARCHAR(50)          not null,
   password_usuario     VARCHAR(50)          not null,
   estado_usuario       CHAR(1)              not null
);

alter table usuario
   add constraint PK_USUARIO primary key (id_usuario);

/*==============================================================*/
/* Index: i_idusuario                                           */
/*==============================================================*/
create unique index i_idusuario on usuario (
id_usuario
);

alter table calificacion_trabajo
   add constraint FK_CALIFICA_REFERENCE_ORDENTRA foreign key (id_ordentrabajo)
      references ordentrabajo (id_ordentrabajo)
      on delete restrict on update restrict;

alter table ciudad
   add constraint FK_CIUDAD_REFERENCE_PROVINCI foreign key (id_provincia)
      references provincia (id_provincia)
      on delete restrict on update restrict;

alter table detalle_material
   add constraint FK_DETALLE__REFERENCE_MATERIAL foreign key (id_material)
      references material (id_material)
      on delete restrict on update restrict;

alter table detalle_material
   add constraint FK_DETALLE__REFERENCE_ORDENTRA foreign key (id_ordentrabajo)
      references ordentrabajo (id_ordentrabajo)
      on delete restrict on update restrict;

alter table empleado
   add constraint FK_EMPLEADO_REFERENCE_CARGO foreign key (id_cargo)
      references cargo (id_cargo)
      on delete restrict on update restrict;

alter table material
   add constraint FK_MATERIAL_REFERENCE_CATEGORI foreign key (id_categoria)
      references categoria_material (id_categoria)
      on delete restrict on update restrict;

alter table material
   add constraint FK_MATERIAL_REFERENCE_UNIDAD_M foreign key (id_unidadmedida)
      references unidad_medida (id_unidadmedida)
      on delete restrict on update restrict;

alter table ordentrabajo
   add constraint FK_ORDENTRA_REFERENCE_EMPLEADO foreign key (id_empleado)
      references empleado (id_empleado)
      on delete restrict on update restrict;

alter table ordentrabajo
   add constraint FK_ORDENTRA_REFERENCE_CLIENTE foreign key (id_cliente)
      references cliente (id_cliente)
      on delete restrict on update restrict;

alter table ordentrabajo
   add constraint FK_ORDENTRA_REFERENCE_TIPOINST foreign key (id_tipo)
      references tipoinstalacion (id_tipo)
      on delete restrict on update restrict;

alter table usuario
   add constraint FK_USUARIO_REFERENCE_EMPLEADO foreign key (id_empleado)
      references empleado (id_empleado)
      on delete restrict on update restrict;

alter table usuario
   add constraint FK_USUARIO_REFERENCE_ROL foreign key (id_rol)
      references rol (id_rol)
      on delete restrict on update restrict;

