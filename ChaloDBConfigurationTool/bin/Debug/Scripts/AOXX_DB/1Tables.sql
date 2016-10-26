/*
DROP TABLE bgtdb_version;
DROP TABLE hitbgt;
DROP TABLE hitbgt_publish;
 DROP TABLE vbo;
DROP TABLE v_hitbgtpbp_permap;
 DROP TABLE publication;
 DROP TABLE panden;
 DROP TABLE orgpbptmp;
 DROP TABLE orgpbppermap;
 DROP TABLE nummer;
 DROP TABLE measurementmethod;
 DROP TABLE default_pbp_info;
 DROP TABLE orgpbp;
 DROP TABLE hitpbp_publish;
 DROP TABLE hitpbp;
 DROP TABLE bndpbp;
 DROP TABLE hitbgtpbp;
 DROP TABLE hitbgtlnk;
 DROP TABLE hitbgtoth_publish;
 DROP TABLE hitbgtoth;
 DROP TABLE hitmapsets;
 DROP TABLE orgez;
 DROP TABLE hitpinpoints;
 DROP TABLE hitmov;
 DROP TABLE hitcityarea;
 DROP TABLE hitorl_bag;
 DROP TABLE woonplaatsen;
 DROP TABLE openbareruimte;
 DROP TABLE bgtothdomain;
 DROP TABLE hitpbp_publish_incoming;
  DROP TABLE hittasks;
  DROP TABLE report_workflow;
*/

--- Meta information of this database 
COMMENT ON DATABASE "AOXX" IS 'Version:2.4.8';


CREATE TABLE action_mapping
(
  id serial NOT NULL,
  current_actie character varying(50),
  next_actie character varying(50),
  report_code character varying(50),
  CONSTRAINT action_mapping_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE action_mapping
  OWNER TO "AOXX";

 
CREATE TABLE action_settings
(
  actie character varying(25) NOT NULL,
  actie_process_duration character varying(10),
  afdeling character varying(25),
  CONSTRAINT action_settings_pkey PRIMARY KEY (actie)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE action_settings
  OWNER TO "AOXX";




/*-**************************************** 
BOR-Sytem // Tables/views/triggers..... 
******************************************/
-- Table: bgt_pinpoints
-- DROP TABLE bgt_pinpoints;

CREATE TABLE bgt_pinpoints
(
  id serial NOT NULL,
  bgtgvt character varying(5),
  bgttype character varying(20),
  crtdate character varying(16),
  creator character varying(50),
  receiver character varying(50),
  refnumber character varying(50),
  identification character varying(50),
  x double precision,
  y double precision,
  active_status character varying(1),
  ref_document text,
  zoom_scale numeric,
  pinpoint_summary text,
  description text,
  reply_comment text,
  last_edited_by character varying(50),
  lastupdate character varying(15),
  geotype character varying(1),
  geotxt character varying(200000),
  the_geom geometry(Geometry,28992),
  extra1 character varying(10000),
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
 
  CONSTRAINT bgt_pinpoints_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bgt_pinpoints
  OWNER TO "AOXX";



 
-- Table: bgt_reports
-- DROP TABLE bgt_reports;

CREATE TABLE bgt_reports
(
  id serial NOT NULL,
  name character varying(20),
  description character varying(200),
  view_name character varying(20),
  CONSTRAINT pk_bgt_reports PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bgt_reports
  OWNER TO "AOXX";


-- Table: bgtdb_version

CREATE TABLE bgtdb_version
(
  id serial NOT NULL,
  version character varying(12),
  version_release_date date,
  changes text,
  CONSTRAINT pk_bgtdb_version PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bgtdb_version
  OWNER TO "AOXX";
  

-- TABLE bgtfulldomain;
CREATE TABLE bgtfulldomain
(
  code character varying(4) NOT NULL,
  description character varying(50),
  CONSTRAINT pk_bgtfulldomain PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bgtfulldomain
  OWNER TO "AOXX";
  

-- TABLE bgtothdomain;
CREATE TABLE bgtothdomain
(
  bgttype character varying(3) NOT NULL,
  code character varying(4) NOT NULL,
  geotype character varying(3),
  description character varying(60),
  CONSTRAINT pk_bgtothdomain PRIMARY KEY (bgttype, code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bgtothdomain
  OWNER TO "AOXX";
  
-- Table: bndpbp



CREATE TABLE bndpbp
(
  mapnr character varying(2),
  bgtgvt character varying(5),
  dwgname character varying(20),
  x double precision,
  y double precision
);
ALTER TABLE bndpbp
  OWNER TO "AOXX";
  
-- Table: bor_beheerder

-- DROP TABLE bor_beheerder;

CREATE TABLE bor_beheerder
(
  bgttype character varying(3) NOT NULL,
  beheerder character varying(2),
  CONSTRAINT bor_beheerder_pkey PRIMARY KEY (bgttype)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bor_beheerder
  OWNER TO "AOXX";

 
-- Table: bor_mutation_incoming

-- DROP TABLE bor_mutation_incoming;

CREATE TABLE bor_mutation_incoming
(
  id serial NOT NULL,
  borid character varying(50),
  talud character varying(10),
  bgtgvt character varying(5),
  crtdate character varying(10),
  beheerder character varying(2),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  lastupdate character varying(15),
  pub_code character varying(2),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  end_date character varying(16),
  publication_date character varying(16),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  refnumber character varying(50) ,
  identification character varying(50),
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  the_geom geometry(Geometry,28992),
  CONSTRAINT pk_bor_mutation_incoming PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bor_mutation_incoming
  OWNER TO "AOXX";


-- Table: default_pbp_info
CREATE TABLE default_pbp_info
(
  id serial NOT NULL,
  layername character varying(20) NOT NULL,
  layerformat character varying(300) NOT NULL,
  organization character varying(50),
  methodcode integer,
  method character varying(100),
  prec integer,
  date character varying(10),
  CONSTRAINT default_pbp_info_pkey PRIMARY KEY (id)
);
ALTER TABLE default_pbp_info
  OWNER TO "AOXX";  
 
 
CREATE TABLE departments
(
  id serial NOT NULL,
  department character varying(100),
  email text,
  CONSTRAINT deparments_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE departments
  OWNER TO "AOXX";

   
-- Table: errorinfo
-- DROP TABLE errorinfo;
CREATE TABLE errorinfo
(
  id serial NOT NULL,
  err_code character varying(100),
  err_desc character varying(100),
  err_value character varying(100000),
  cadid character varying(25),
  mapnr character varying(25),
  fieldname character varying(50),
  tablename character varying(50)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE errorinfo
  OWNER TO "AOXX";  
  
  
CREATE TABLE gv_temp_process
(
  id serial NOT NULL,
  name character varying(50),
  remark character varying(200),
  date character varying(15),
  extra1 text,
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  the_geom geometry,
  CONSTRAINT gv_temp_process_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE gv_temp_process
  OWNER TO "AOXX";  
  
  
  
-- Table: hitbgt
CREATE TABLE hitbgt
(
  cadid character varying(10) NOT NULL,
  blk character varying(6) DEFAULT ''::character varying,
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(200000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  extra1 character varying(100000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  CONSTRAINT pk_hitbgt PRIMARY KEY (cadid)
);
SELECT AddGeometryColumn ('hitbgt','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitbgt
  OWNER TO "AOXX";  
  
-- Table: hitbgt_checkout
CREATE TABLE hitbgt_checkout
(
  id serial NOT NULL,
  checkout_date character varying(10),
  checkout_user character varying(50),
  checkout_description character varying(200),
  checkback_in_status character varying(2),
  cadid character varying(10) NOT NULL,
  blk character varying(6) DEFAULT ''::character varying,
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  the_geom geometry(Geometry,28992),
  
  CONSTRAINT hitbgt_checkout_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgt_checkout
  OWNER TO "AOXX";  
  
  
-- Table: hitbgt_publish
CREATE TABLE hitbgt_publish
(
  cadid character varying(10) NOT NULL,
  startdate character varying(16) NOT NULL,
  enddate character varying(16),
  blk character varying(6) DEFAULT ''::character varying,
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  publication_date character varying(16),
  pub_code character varying(2),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(100000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  CONSTRAINT hitbgt_publish_pkey PRIMARY KEY (cadid, startdate)
);
SELECT AddGeometryColumn ('hitbgt_publish','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitbgt_publish
  OWNER TO "AOXX";  
  
  
  
-- Table: hitbgt_publish_incoming

-- DROP TABLE hitbgt_publish_incoming;

CREATE TABLE hitbgt_publish_incoming
(
  cadid character varying(10) NOT NULL,
  blk character varying(6) DEFAULT ''::character varying,
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  pub_code character varying(2),
  end_date character varying(16),
  publication_date character varying(16),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(100000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  the_geom geometry(Geometry,28992),
  CONSTRAINT pk_hitbgt_publish_incomming PRIMARY KEY (cadid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgt_publish_incoming
  OWNER TO "AOXX";  
  
  

-- Table: hitbgt_publish_tobor
-- DROP TABLE hitbgt_publish_tobor;
CREATE TABLE hitbgt_publish_tobor
(
  cadid character varying(10) NOT NULL,
  startdate character varying(16) NOT NULL,
  enddate character varying(16),
  blk character varying(6) DEFAULT ''::character varying,
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  publication_date character varying(16),
  pub_code character varying(2),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
 extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  the_geom geometry(Geometry,28992),
  CONSTRAINT hitbgt_publish_tobor_pkey PRIMARY KEY (cadid, startdate)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgt_publish_tobor
  OWNER TO "AOXX";
  
  
-- Table: hitbgtlnk
CREATE TABLE hitbgtlnk
(
  cadid character varying(10) NOT NULL,
  mapnr character varying(2),
  layer character varying(32),
  laygroup character varying(16),
  geotxt character varying(200000),
  lastupdate character varying(15),
  CONSTRAINT pk_hitbgtlnk PRIMARY KEY (cadid)
);
ALTER TABLE hitbgtlnk
  OWNER TO "AOXX";
-- Table: hitbgtpbp
  
  
-- Table: hitbgtoth

CREATE TABLE hitbgtoth
(
  cadid character varying(10) NOT NULL,
  blk character varying(6) DEFAULT ''::character varying,
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  CONSTRAINT pk_hitbgtoth PRIMARY KEY (cadid)
);
SELECT AddGeometryColumn ('hitbgtoth','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitbgtoth
  OWNER TO "AOXX";  
  
 CREATE TABLE hitbgtoth_checkout
(
  id serial NOT NULL,
  checkout_date character varying(10),
  checkout_user character varying(50),
  checkout_description character varying(200),
  checkback_in_status character varying(2),
  cadid character varying(10) NOT NULL,
  blk character varying(6) DEFAULT ''::character varying,
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  the_geom geometry(Geometry,28992),
  CONSTRAINT hitbgtoth_checkout_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgtoth_checkout
  OWNER TO "AOXX"; 
  
  
-- Table: hitbgtoth_publish

CREATE TABLE hitbgtoth_publish
(
  cadid character varying(10) NOT NULL,
  startdate character varying(16) NOT NULL,
  enddate character varying(16),
  blk character varying(6) DEFAULT ''::character varying,
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  publication_date character varying(16),
  pub_code character varying(2),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  CONSTRAINT hitbgtoth_publish_pkey PRIMARY KEY (cadid, startdate)
);
SELECT AddGeometryColumn ('hitbgtoth_publish','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitbgtoth_publish
  OWNER TO "AOXX";  
  
  
  
-- Table: hitbgtoth_publish_incoming
-- DROP TABLE hitbgtoth_publish_incoming;

CREATE TABLE hitbgtoth_publish_incoming
(
  cadid character varying(10) NOT NULL,
  blk character varying(6) DEFAULT ''::character varying,
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  pub_code character varying(2),
  end_date character varying(16),
  publication_date character varying(16),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  the_geom geometry(Geometry,28992),
  CONSTRAINT pk_hitbgtoth_publish_incomming PRIMARY KEY (cadid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgtoth_publish_incoming
  OWNER TO "AOXX";  
  
  
  
-- Table: hitbgtoth_publish_tobor

-- DROP TABLE hitbgtoth_publish_tobor;

CREATE TABLE hitbgtoth_publish_tobor
(
  cadid character varying(10) NOT NULL,
  startdate character varying(16) NOT NULL,
  enddate character varying(16),
  blk character varying(6) DEFAULT ''::character varying,
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  publication_date character varying(16),
  pub_code character varying(2),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  the_geom geometry(Geometry,28992),
  CONSTRAINT hitbgtoth_publish_tobor_pkey PRIMARY KEY (cadid, startdate)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgtoth_publish_tobor
  OWNER TO "AOXX";  
  
  

CREATE TABLE hitbgtpbp
(
  cadid character varying(18) NOT NULL,
  mapnr character varying(2) NOT NULL,
  lnkcadid character varying(10) NOT NULL,
  x double precision,
  y double precision,
  parentcadid character varying(18),
  lastupdate character varying(15),
  methodcode integer,
  mdate character varying(10),
  morg character varying,
  prec integer,
  snpgroup character varying(10),
  CONSTRAINT pk_hitbgtpbp PRIMARY KEY (cadid, mapnr, lnkcadid)
);
ALTER TABLE hitbgtpbp
  OWNER TO "AOXX";
  
  
-- Table: hitbgtpbp_permap
CREATE TABLE hitbgtpbp_permap
(
  cadid character varying(18),
  mapnr character varying(2),
  lnkcadid character varying(10),
  x double precision,
  y double precision,
  parentcadid character varying(18),
  lastupdate character varying(15),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  laygroup character varying(16),
  morg character varying(50),
  id serial NOT NULL,
  snpgroup character varying(10)
);
SELECT AddGeometryColumn ('hitbgtpbp_permap','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitbgtpbp_permap
  OWNER TO "AOXX";


CREATE TABLE hitcityarea
(
  cadid character varying(10) NOT NULL,
  mapnr character varying(2),
  layer character varying(32),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  CONSTRAINT pk_hitcityarea PRIMARY KEY (cadid)
);
SELECT AddGeometryColumn ('hitcityarea','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitcityarea
  OWNER TO "AOXX";  
  
-- Table: hitmapsets
CREATE TABLE hitmapsets
(
  mapsetid serial  NOT NULL ,
  setname character varying(100),
  mapnumbers text,
  CONSTRAINT hitmapsets_pkey PRIMARY KEY (mapsetid)
);
ALTER TABLE hitmapsets
  OWNER TO "AOXX";  
  
  
CREATE TABLE hitmov
(
  cadid character varying(10) NOT NULL,
  mapnr character varying(2),
  layer character varying(32),
  geotxt character varying(200000),
  geotxtlin character varying(400000),
  lastupdate character varying(15),
  CONSTRAINT pk_hitmov PRIMARY KEY (cadid)
);
SELECT AddGeometryColumn ('hitmov','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitmov
  OWNER TO "AOXX";  
  
  

--TABLE hitorl_bag;
CREATE TABLE hitorl_bag
(
  cadid character varying(10) NOT NULL,
  gbkn_name character varying(100),
  opr_id character varying(20),
  bag_name character varying(100),
  update_code character varying(1),
  update_description text,
  x double precision,
  y double precision,
  woonplaats character varying(80),
  CONSTRAINT pk_hitorl_bag PRIMARY KEY (cadid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitorl_bag
  OWNER TO "AOXX";  
  
  
-- Table: hitpbp
CREATE TABLE hitpbp
(
  id serial NOT NULL,
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  snapped smallint NOT NULL DEFAULT 0,
  lastupdate character varying(15),
  snappeddistance numeric,
  xy character varying(100),
  CONSTRAINT hitpbp_pkey PRIMARY KEY (id)
);
ALTER TABLE hitpbp
  OWNER TO "AOXX";  
  
  
CREATE TABLE hitpbp_checkout
(
  id serial NOT NULL,
  checkout_date character varying(10),
  checkout_user character varying(50),
  checkout_description character varying(200),
  checkback_in_status character varying(2),
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  snapped smallint NOT NULL DEFAULT 0,
  lastupdate character varying(15),
  snappeddistance numeric,
  xy character varying(100),
  extra1 character varying(10000) DEFAULT ''::character varying,
  extra2 character varying(10000) DEFAULT ''::character varying,
  extra3 character varying(10000) DEFAULT ''::character varying,
  extra4 character varying(10000) DEFAULT ''::character varying,
  extra5 character varying(10000) DEFAULT ''::character varying,
  CONSTRAINT hitpbp_checkout_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitpbp_checkout
  OWNER TO "AOXX"; 
  
  
 -- Table: hitpbp_missing
-- DROP TABLE hitpbp_missing;

-- Replaced by Monowar (06.06.16)
CREATE TABLE hitpbp_missing
(
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  lastupdate character varying(15)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitpbp_missing
  OWNER TO "AOXX";
 
  
-- Table: hitpbp_publish


CREATE TABLE hitpbp_publish
(
  id serial NOT NULL,
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  snapped smallint NOT NULL DEFAULT 0,
  lastupdate character varying(15),
  snappeddistance numeric,
  publication_date character varying(16),
  CONSTRAINT hitpbp_publish_pkey PRIMARY KEY (id)
);
ALTER TABLE hitpbp_publish
  OWNER TO "AOXX";  
  
  
-- TABLE hitpbp_publish_incoming;
CREATE TABLE hitpbp_publish_incoming
(
    id serial NOT NULL,
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  snapped smallint NOT NULL DEFAULT 0,
  lastupdate character varying(15),
  snappeddistance numeric,
  publication_date character varying(16),
  xy character varying(100),
  CONSTRAINT hitpbp_publish_incoming_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitpbp_publish_incoming
  OWNER TO "AOXX";  
  
  
-- Table: hitpbp_replaced_history

-- DROP TABLE hitpbp_replaced_history;

-- Replaced by Monowar (06.06.16)
CREATE TABLE hitpbp_replaced_history
(
  id serial NOT NULL,
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  snapped smallint NOT NULL DEFAULT 0,
  lastupdate character varying(15),
  snappeddistance numeric,
  replaced_time character varying(15),
  CONSTRAINT hitpbp_replaced_history_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitpbp_replaced_history
  OWNER TO "AOXX";
  
  
CREATE TABLE hitpinpoints
(
  cadid character varying(10) NOT NULL,
  mapnr character varying(2),
  layer character varying(32),
  remark  character varying(500),
  ctimestamp character varying(15),
  operator character varying(10),
  x float,
  y float,
  lastupdate character varying(15),
  CONSTRAINT pk_hitpinpoints PRIMARY KEY (cadid)
);
SELECT AddGeometryColumn ('hitpinpoints','the_geom',28992,'GEOMETRY',2);
ALTER TABLE hitpinpoints
  OWNER TO "AOXX";  
  
  
-- Table: hittasks
-- Replaced by Monowar (06.06.16)
CREATE TABLE hittasks
(
  id character varying(15) NOT NULL,
  taaktype character varying(5),
  taaktitle character varying(100),
  omschrijving character varying(100),
  ingevoerd date,
  einddatum date,
  status character varying(12),
  statusupd date,
  actie character varying(20),
  afdeling character varying(20),
  actiedatum date,
  opmerking character varying(200),
  statuslog text,
  center_x numeric,
  center_y numeric,
  zoom_scale numeric,
  geomarker_type character varying(15),
  opened_by character varying(50),
  last_edited_by character varying(1000),
  the_geom geometry(Geometry,28992),
  -- Newly added
  workpkgid character varying(15),
  CONSTRAINT hittasks_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hittasks
  OWNER TO "AOXX";  
  
  
CREATE TABLE hittasks_settings
(
  id serial NOT NULL,
  taaktype character varying(5),
  set_einddatum_in character varying(4),
  min_time_inbetween_actie_enddate character varying(4),
  actie_day_preference character varying(10),
  end_day_preference character varying(10),
  CONSTRAINT hittasks_settings_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hittasks_settings
  OWNER TO "AOXX";  
  
  
-- Table: hitworkpackage

-- DROP TABLE hitworkpackage;

-- Replaced by Monowar (06.06.16)
CREATE TABLE hitworkpackage
(
  id character varying(15) NOT NULL,
  title character varying(100),
  description character varying(250),
  ingevoerd date,
  einddatum date,
  status character varying(12),
  statusupd date,
  actie character varying(20),
  afdeling character varying(20),
  actiedatum date,
  opmerking character varying(200),
  statuslog text,
  center_x numeric,
  center_y numeric,
  zoom_scale numeric,
  opened_by character varying(50),
  the_geom geometry(Geometry,28992),
  remark character varying(200),
  extra1 text,
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  CONSTRAINT hitworkpackage_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitworkpackage
  OWNER TO "AOXX";
  
  
-- Table: incoming_announcement

-- DROP TABLE incoming_announcement;

-- Replaced by Monowar (06.06.16)
CREATE TABLE incoming_announcement
(
  id serial NOT NULL,
  msg_id integer,
  msg_type character varying(10),
  description text,
  geotxt text,
  bgtgvt character varying(5),
  the_geom geometry,
  CONSTRAINT incoming_announcement_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE incoming_announcement
  OWNER TO "AOXX";
  
  
 -- Table: measurementmethod


CREATE TABLE measurementmethod
(
  methodcode integer NOT NULL,
  method character varying(50),
  gbkncode integer,
  CONSTRAINT pk_msrmethod PRIMARY KEY (methodcode)
);
ALTER TABLE measurementmethod
  OWNER TO "AOXX"; 
  
  
  
-- Table: messages
-- DROP TABLE messages;

-- Replaced by Monowar (06.06.16)
CREATE TABLE messages
(
  msg_id serial NOT NULL,
  proj_code character varying(5) NOT NULL DEFAULT 'AOXX'::character varying,
  bgtgvt character varying(5) NOT NULL DEFAULT ''::character varying,
  msg_dir character varying(3) NOT NULL DEFAULT 'IN'::character varying,
  msg_type character varying(10) NOT NULL DEFAULT ''::character varying,
  msg_ref character varying(40) NOT NULL DEFAULT ''::character varying,
  msg_crossref character varying(40) NOT NULL DEFAULT ''::character varying,
  msg_timestamp character varying(50) NOT NULL DEFAULT ''::character varying,
  request_id character varying(40) NOT NULL DEFAULT ''::character varying,
  request_ref character varying(40) NOT NULL DEFAULT ''::character varying,
  request_timestamp character varying(50) NOT NULL DEFAULT ''::character varying,
  request_descr character varying(500) NOT NULL DEFAULT ''::character varying,
  msg_xml text NOT NULL DEFAULT ''::text,
  status character varying(3) NOT NULL DEFAULT ''::character varying,
  response_ref character varying(40) NOT NULL DEFAULT ''::character varying,
  response_crossref character varying(40) NOT NULL DEFAULT ''::character varying,
  response_xml text NOT NULL DEFAULT ''::text,
  attachment text NOT NULL DEFAULT ''::text,
  extra1 text NOT NULL DEFAULT ''::text,
  extra2 text NOT NULL DEFAULT ''::text,
  record_log text NOT NULL DEFAULT ''::text,
  CONSTRAINT pk_messages_new PRIMARY KEY (msg_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE messages
  OWNER TO "AOXX";
    

-- Table: nummer
CREATE TABLE nummer
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry(Point),
  nummer_id character varying(16),
  straatnaam character varying(80),
  huisnummer numeric(8,0),
  huisletter character varying(1),
  toevoeging character varying(4),
  woonplaats character varying(80),
  postcode character varying(6),
  gem_code character varying(4),
  gem_naam character varying(80),
  type character varying(20),
  status character varying(80),
  datum_strt numeric(8,0),
  datum_eind numeric(8,0),
  document character varying(20),
  datum_doc numeric(8,0),
  onderzoek character varying(1),
  indicatie character varying(1),
  inactief character varying(1),
  CONSTRAINT nummer_pkey PRIMARY KEY (ogc_fid)
);
ALTER TABLE nummer
  OWNER TO "AOXX";  
  
 
--  TABLE openbareruimte;
CREATE TABLE openbareruimte
(
  ogc_fid serial NOT NULL,
  opr_id character varying(16),
  naam character varying(80),
  woonplaats character varying(80),
  status character varying(80),
  datum_strt numeric(8,0),
  datum_eind numeric(8,0),
  document character varying(20),
  datum_doc numeric(8,0),
  onderzoek character varying(1),
  indicatie character varying(1),
  inactief character varying(1),
  CONSTRAINT openbareruimte_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE openbareruimte
  OWNER TO "AOXX";


CREATE TABLE orgez
(
  ogc_fid serial NOT NULL,
  gml_id character varying(80),
  creationda character varying(10),
  namespace character varying(8),
  lokaalid character varying(38),
  tijdstipre character varying(26),
  bronhouder character varying(5),
  inonderzoe numeric(10,0),
  relatieveh numeric(10,0),
  bgt_status character varying(8),
  class character varying(18),
  begroeidte numeric(10,0),
  orgid character varying(40),
  orginf character varying(100),
  area numeric(24,15),
  CONSTRAINT orgez_pkey PRIMARY KEY (ogc_fid)
);
SELECT AddGeometryColumn ('orgez','wkb_geometry',28992,'GEOMETRY',2);
ALTER TABLE orgez
  OWNER TO "AOXX";


-- Table: orgpbp

CREATE TABLE orgpbp
(
  id serial NOT NULL,
  src character varying(40),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  methodcode integer
);
SELECT AddGeometryColumn ('orgpbp','the_geom',28992,'GEOMETRY',2);
ALTER TABLE orgpbp
  OWNER TO "AOXX";



CREATE TABLE orgpbppermapmultipoint
(
  id serial NOT NULL,
  snpgroup character varying(10),
  CONSTRAINT pk_orgpbppermapmultipoint PRIMARY KEY (id)
);
SELECT AddGeometryColumn ('orgpbppermapmultipoint','the_geom',28992,'GEOMETRY',2);
ALTER TABLE orgpbppermapmultipoint
  OWNER TO "AOXX";


-- Table: orgpbptmp
CREATE TABLE orgpbptmp
(
  id integer,
  src character varying(40),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  methodcode integer,
  "row" bigint,
  mapnr character varying(2),
  snpgroup character varying(10)
);
SELECT AddGeometryColumn ('orgpbptmp','the_geom',28992,'GEOMETRY',2);
ALTER TABLE orgpbptmp
  OWNER TO "AOXX";


-- Table: panden
CREATE TABLE panden
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry(Polygon),
  pand_id character varying(16),
  bouwjaar numeric(4,0),
  status character varying(80),
  datum_strt numeric(8,0),
  datum_eind numeric(8,0),
  document character varying(20),
  datum_doc numeric(8,0),
  onderzoek character varying(1),
  indicatie character varying(1),
  inactief character varying(1),
  CONSTRAINT panden_pkey PRIMARY KEY (ogc_fid)
);
ALTER TABLE panden
  OWNER TO "AOXX";


-- Table: publication
CREATE TABLE publication
(
  pub_time character varying(16) NOT NULL,
  publisher character varying(254),
  islatest character varying(1),
  published_report character varying(254),
  accepted_by_lv boolean,
  msg_id integer,
  CONSTRAINT publication_pkey PRIMARY KEY (pub_time)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE publication
  OWNER TO "AOXX";
  
  
-- Table: publication_bor
-- DROP TABLE publication_bor;
CREATE TABLE publication_bor
(
  pub_time character varying(16) NOT NULL,
  publisher character varying(254),
  islatest character varying(1),
  published_report character varying(254),
  accepted_by_lv boolean,
  msg_id integer,
  CONSTRAINT publication_bor_pkey PRIMARY KEY (pub_time)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE publication_bor
  OWNER TO "AOXX";


-- Table: stuf_msg_config
-- DROP TABLE stuf_msg_config;
-- Replaced by Monowar (06.06.16)
CREATE TABLE stuf_msg_config
(
  id serial NOT NULL,
  sender_bronhouder character varying(5) NOT NULL DEFAULT ''::character varying,
  sender_application character varying(50) NOT NULL DEFAULT ''::character varying,
  sender_administration character varying(20) NOT NULL DEFAULT ''::character varying,
  msg_ref_prefix character varying(16) NOT NULL DEFAULT ''::character varying,
  msg_identification_prefix character varying(16) NOT NULL DEFAULT ''::character varying,
  toelichting text,
  extra1 text,
  extra2 text,
  CONSTRAINT stuf_msg_config_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE stuf_msg_config
  OWNER TO "AOXX";



CREATE TABLE vbo
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry(Point),
  vbo_id character varying(16),
  pand_id character varying(16),
  h_adres character varying(16),
  n_adres character varying(16),
  gebr_doel1 character varying(80),
  gebr_doel2 character varying(80),
  oppervlak numeric(10,0),
  status character varying(80),
  datum_strt numeric(8,0),
  datum_eind numeric(8,0),
  document character varying(20),
  datum_doc numeric(8,0),
  onderzoek character varying(1),
  indicatie character varying(1),
  inactief character varying(1),
  CONSTRAINT vbo_pkey PRIMARY KEY (ogc_fid)
);
ALTER TABLE vbo
  OWNER TO "AOXX";

--TABLE woonplaatsen;
CREATE TABLE woonplaatsen
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry(Polygon,28992),
  wpl_id character varying(4),
  naam character varying(80),
  gem_code character varying(4),
  gem_naam character varying(80),
  status character varying(80),
  datum_strt numeric(8,0),
  datum_eind numeric(8,0),
  document character varying(20),
  datum_doc numeric(8,0),
  onderzoek character varying(1),
  indicatie character varying(1),
  inactief character varying(1),
  CONSTRAINT woonplaatsen_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE woonplaatsen
  OWNER TO "AOXX";
 

-- Added by Monowar (06.06.16)
CREATE TABLE bgtdomains
(
  dname character varying(5) NOT NULL,
  bgtcode character varying(4) NOT NULL,
  bgttype character varying(3),
  CONSTRAINT bgtdomains_pkey PRIMARY KEY (dname, bgtcode)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bgtdomains
  OWNER TO "AOXX";
 
 
-- Added by Monowar (06.06.16)
CREATE TABLE bor_exploration_request
(
  id integer NOT NULL DEFAULT nextval('bgt_pinpoints_id_seq'::regclass),
  bgtgvt character varying(5),
  crtdate character varying(16),
  creator character varying(50),
  receiver character varying(50),
  refnumber character varying(50),
  identification character varying(50),
  x double precision,
  y double precision,
  active_status character varying(1),
  ref_document text,
  zoom_scale numeric,
  pinpoint_summary text,
  description text,
  reply_comment text,
  last_edited_by character varying(50),
  lastupdate character varying(15),
  geotype character varying(1),
  geotxt character varying(200000),
  the_geom geometry(Geometry,28992),
  extra1 character varying(10000),
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  bgttype character varying(20),
  taskid character varying(15),
  stufobjxml character varying(200000),
  CONSTRAINT bor_exploration_request_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bor_exploration_request
  OWNER TO "AOXX";

  
-- Added by Monowar (06.06.16)  
CREATE TABLE config_bgtobj_edit
(
  id serial NOT NULL,
  cross_bgttypes character varying(100),
  editable_fields character varying(100) NOT NULL,
  CONSTRAINT pk_config_bgtobj_edit PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE config_bgtobj_edit
  OWNER TO "AOXX";
  
  
-- Added by Monowar (06.06.16)
CREATE TABLE hitbgt_history
(
  id serial NOT NULL,
  history_time character varying(15),
  cadid character varying(10) NOT NULL,
  blk character varying(6),
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(30),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(200000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  extra1 character varying(10000),
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  the_geom geometry(Geometry,28992),
  CONSTRAINT pk_hitbgt_history PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgt_history
  OWNER TO "AOXX";
  
  
-- Added by Monowar (06.06.16) 
CREATE TABLE hitpbp_mutation_incoming
(
  id serial NOT NULL,
  cadid character varying(18) NOT NULL,
  mapnr character varying(2),
  x double precision,
  y double precision,
  bgtid character varying(40),
  method character varying(20),
  methodcode integer,
  prec integer,
  mdate character varying(10),
  morg character varying(10),
  layer character varying(100),
  snapped smallint NOT NULL DEFAULT 0,
  lastupdate character varying(15),
  snappeddistance numeric,
  publication_date character varying(16),
  xy character varying(100),
  geotxt character varying(50),
  CONSTRAINT hitpbp_mutation_incoming_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitpbp_mutation_incoming
  OWNER TO "AOXX";
  
  
-- Added by Monowar (06.06.16)
CREATE TABLE hitbgtoth_mutation_incoming
(
  cadid character varying(10) NOT NULL,
  blk character varying(6),
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(200000),
  lastupdate character varying(15),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  pub_code character varying(2),
  the_geom geometry(Geometry,28992),
  end_date character varying(16),
  publication_date character varying(16),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(10000),
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  CONSTRAINT pk_hitbgtoth_mutation_incoming PRIMARY KEY (cadid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgtoth_mutation_incoming
  OWNER TO "AOXX";
  
  
  
-- Added by Monowar (06.06.16)
CREATE TABLE hitbgt_mutation_incoming
(
  cadid character varying(10) NOT NULL,
  blk character varying(6),
  rfunc character varying(4),
  otype character varying(4),
  talud character varying(10),
  orgid character varying(100),
  orginf character varying(200),
  bsrc character varying(4),
  baginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(100),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  area character varying(10),
  ctimestamp character varying(15),
  operator character varying(10),
  x double precision,
  y double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  fmain character varying(50),
  fsub character varying(50),
  bagid character varying(32),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(200000),
  bagnrgml character varying(200000),
  lastupdate character varying(15),
  geomarea double precision DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  pub_code character varying(2),
  the_geom geometry(Geometry,28992),
  end_date character varying(16),
  publication_date character varying(16),
  prevpublication_date character varying(16),
  stufobjxml character varying(200000),
  extra1 character varying(100000),
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  CONSTRAINT pk_hitbgt_mutation_incoming PRIMARY KEY (cadid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgt_mutation_incoming
  OWNER TO "AOXX";
  
  
  
------------------------------
-- Added by Monowar (06.06.16)
------------------------------
CREATE TABLE aoi_mutation_incoming
(
  id character varying(15) NOT NULL,
  dbname text,
  the_geom geometry(Geometry,28992),
   CONSTRAINT aoi_mutation_incoming_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE

);
ALTER TABLE aoi_mutation_incoming
  OWNER TO "AOXX";
  
 
------------------------------
-- Added by Monowar (27.09.16)
------------------------------ 
CREATE TABLE hitbgtoth_history
(
  id serial NOT NULL,
  history_time character varying(15),
  cadid character varying(10) NOT NULL,
  blk character varying(6),
  otype character varying(4),
  name character varying(50),
  plusfunc character varying(50),
  canmove character varying(1),
  orgid character varying(100),
  orginf character varying(200),
  remark character varying(100),
  mapnr character varying(2),
  gvt character varying(10),
  bgtgvt character varying(5),
  qacode character varying(2),
  crtdate character varying(10),
  geotype character varying(20),
  ctimestamp character varying(15),
  operator character varying(35),
  x double precision,
  y double precision,
  rotation double precision,
  bgtid character varying(40),
  bgttype character varying(3),
  tmain character varying(50),
  tsub character varying(50),
  level character varying(3),
  geotxt character varying(200000),
  geotxtlin character varying(200000),
  lastupdate character varying(15),
  geomarea double precision DEFAULT 0,
  nrpoints integer DEFAULT 0,
  nrrings integer DEFAULT 0,
  incityarea smallint NOT NULL DEFAULT 0,
  the_geom geometry,
  status character varying(100),
  plusstatus character varying(100),
  inonderzoek character varying(10),
  extra1 character varying(10000),
  extra2 character varying(10000),
  extra3 character varying(10000),
  extra4 character varying(10000),
  extra5 character varying(10000),
  CONSTRAINT pk_hitbgtoth_history PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hitbgtoth_history
  OWNER TO "AOXX";

  