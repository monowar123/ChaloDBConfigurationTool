
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
  

-- DROP TABLE config_bgtobj_edit;

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
 

-- DROP TABLE hitbgt_history;

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
  
  

CREATE OR REPLACE VIEW v_hitbgt_lev0 AS 
 SELECT hitbgt.cadid,
    hitbgt.blk,
    hitbgt.rfunc,
    hitbgt.otype,
    hitbgt.talud,
    hitbgt.orgid,
    hitbgt.orginf,
    hitbgt.bsrc,
    hitbgt.baginf,
    hitbgt.remark,
    hitbgt.mapnr,
    hitbgt.gvt,
    hitbgt.bgtgvt,
    hitbgt.qacode,
    hitbgt.crtdate,
    hitbgt.area,
    hitbgt.ctimestamp,
    hitbgt.operator,
    hitbgt.x,
    hitbgt.y,
    hitbgt.bgtid,
    hitbgt.bgttype,
    hitbgt.tmain,
    hitbgt.tsub,
    hitbgt.fmain,
    hitbgt.fsub,
    hitbgt.bagid,
    hitbgt.level,
    hitbgt.geotxt,
    hitbgt.geotxtlin,
    hitbgt.bagnrgml,
    hitbgt.lastupdate,
    hitbgt.status,
    hitbgt.plusstatus,
    hitbgt.inonderzoek,
    hitbgt.geomarea,
    hitbgt.incityarea,
    hitbgt.nrpoints,
    hitbgt.nrrings,
    hitbgt.extra1,
    hitbgt.extra2,
    hitbgt.extra3,
    hitbgt.extra4,
    hitbgt.extra5,
    hitbgt.the_geom,
    fn_hitgv_tooltip(hitbgt.bgttype, hitbgt.bgtid, hitbgt.bgtgvt, hitbgt.rfunc, hitbgt.otype, hitbgt.bagid, hitbgt.talud, hitbgt.extra1) AS tooltiptext
   FROM hitbgt
  WHERE hitbgt.level::text = '0'::text AND COALESCE(NULLIF(blk::text, ''::text), ''::text) <> 'MAPCTR'::text;

ALTER TABLE v_hitbgt_lev0
  OWNER TO "AOXX";  
  
  
  
CREATE OR REPLACE VIEW v_hitbgt_lev1 AS 
 SELECT hitbgt.cadid,
    hitbgt.blk,
    hitbgt.rfunc,
    hitbgt.otype,
    hitbgt.talud,
    hitbgt.orgid,
    hitbgt.orginf,
    hitbgt.bsrc,
    hitbgt.baginf,
    hitbgt.remark,
    hitbgt.mapnr,
    hitbgt.gvt,
    hitbgt.bgtgvt,
    hitbgt.qacode,
    hitbgt.crtdate,
    hitbgt.area,
    hitbgt.ctimestamp,
    hitbgt.operator,
    hitbgt.x,
    hitbgt.y,
    hitbgt.bgtid,
    hitbgt.bgttype,
    hitbgt.tmain,
    hitbgt.tsub,
    hitbgt.fmain,
    hitbgt.fsub,
    hitbgt.bagid,
    hitbgt.level,
    hitbgt.geotxt,
    hitbgt.geotxtlin,
    hitbgt.bagnrgml,
    hitbgt.lastupdate,
    hitbgt.status,
    hitbgt.plusstatus,
    hitbgt.inonderzoek,
    hitbgt.geomarea,
    hitbgt.incityarea,
    hitbgt.nrpoints,
    hitbgt.nrrings,
    hitbgt.extra1,
    hitbgt.extra2,
    hitbgt.extra3,
    hitbgt.extra4,
    hitbgt.extra5,
    hitbgt.the_geom,
    fn_hitgv_tooltip(hitbgt.bgttype, hitbgt.bgtid, hitbgt.bgtgvt, hitbgt.rfunc, hitbgt.otype, hitbgt.bagid, hitbgt.talud, hitbgt.extra1) AS tooltiptext
   FROM hitbgt
  WHERE COALESCE(NULLIF(level::text, ''::text), '0'::text) <> '0'::text;

ALTER TABLE v_hitbgt_lev1
  OWNER TO "AOXX";




CREATE OR REPLACE VIEW v_hitbgtoth_point AS 
 SELECT hitbgtoth.cadid,
    hitbgtoth.blk,
    hitbgtoth.otype,
    hitbgtoth.name,
    hitbgtoth.plusfunc,
    hitbgtoth.canmove,
    hitbgtoth.orgid,
    hitbgtoth.orginf,
    hitbgtoth.remark,
    hitbgtoth.mapnr,
    hitbgtoth.gvt,
    hitbgtoth.bgtgvt,
    hitbgtoth.qacode,
    hitbgtoth.crtdate,
    hitbgtoth.geotype,
    hitbgtoth.ctimestamp,
    hitbgtoth.operator,
    hitbgtoth.x,
    hitbgtoth.y,
    hitbgtoth.rotation,
    hitbgtoth.bgtid,
    hitbgtoth.bgttype,
    hitbgtoth.tmain,
    hitbgtoth.tsub,
    hitbgtoth.level,
    hitbgtoth.geotxt,
    hitbgtoth.geotxtlin,
    hitbgtoth.lastupdate,
    hitbgtoth.status,
    hitbgtoth.plusstatus,
    hitbgtoth.inonderzoek,
    hitbgtoth.geomarea,
    hitbgtoth.nrpoints,
    hitbgtoth.nrrings,
    hitbgtoth.incityarea,
    hitbgtoth.extra1,
    hitbgtoth.extra2,
    hitbgtoth.extra3,
    hitbgtoth.extra4,
    hitbgtoth.extra5,
    hitbgtoth.the_geom,
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth
  WHERE lower("substring"(hitbgtoth.geotype::text, 1, 1)) = 'p'::text AND COALESCE(NULLIF(blk::text, ''::text), ''::text) <> 'BGTORL'::text;

ALTER TABLE v_hitbgtoth_point
  OWNER TO "AOXX";



CREATE OR REPLACE VIEW v_hitbgtoth_orl AS 
 SELECT hitbgtoth.cadid,
    hitbgtoth.blk,
    hitbgtoth.otype,
    hitbgtoth.name,
    hitbgtoth.plusfunc,
    hitbgtoth.canmove,
    hitbgtoth.orgid,
    hitbgtoth.orginf,
    hitbgtoth.remark,
    hitbgtoth.mapnr,
    hitbgtoth.gvt,
    hitbgtoth.bgtgvt,
    hitbgtoth.qacode,
    hitbgtoth.crtdate,
    hitbgtoth.geotype,
    hitbgtoth.ctimestamp,
    hitbgtoth.operator,
    hitbgtoth.x,
    hitbgtoth.y,
    hitbgtoth.rotation,
    hitbgtoth.bgtid,
    hitbgtoth.bgttype,
    hitbgtoth.tmain,
    hitbgtoth.tsub,
    hitbgtoth.level,
    hitbgtoth.geotxt,
    hitbgtoth.geotxtlin,
    hitbgtoth.lastupdate,
    hitbgtoth.status,
    hitbgtoth.plusstatus,
    hitbgtoth.inonderzoek,
    hitbgtoth.geomarea,
    hitbgtoth.nrpoints,
    hitbgtoth.nrrings,
    hitbgtoth.incityarea,
    hitbgtoth.extra1,
    hitbgtoth.extra2,
    hitbgtoth.extra3,
    hitbgtoth.extra4,
    hitbgtoth.extra5,
    hitbgtoth.the_geom,
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth
  WHERE COALESCE(NULLIF(blk::text, ''::text), ''::text) = 'BGTORL'::text;

ALTER TABLE v_hitbgtoth_orl
  OWNER TO "AOXX";
  
Alter table hitpbp_mutation_incoming
Add column geotxt character varying(50);


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
  extra1 character varying(10000),
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
  
CREATE OR REPLACE VIEW v_baginfo AS 
 SELECT table_from_split.cadid,
    table_from_split.bgtid,
    table_from_split.bgttype,
    table_from_split.mapnr,
    table_from_split.bagid,
    split_part(table_from_split.fsplit, ','::text, 1) AS x,
    split_part(table_from_split.fsplit, ','::text, 2) AS y,
    split_part(table_from_split.fsplit, ','::text, 3) AS housetext,
        CASE
            WHEN split_part(table_from_split.fsplit, ','::text, 4) = ''::text OR split_part(table_from_split.fsplit, ','::text, 4) IS NULL THEN '0'::text
            ELSE split_part(table_from_split.fsplit, ','::text, 4)
        END AS rotation,
    split_part(table_from_split.fsplit, ','::text, 5) AS lowestvboid,
    split_part(table_from_split.fsplit, ','::text, 6) AS highestvboid,
    st_geomfromtext(((('POINT('::text || split_part(table_from_split.fsplit, ','::text, 1)) || ' '::text) || split_part(table_from_split.fsplit, ','::text, 2)) || ')'::text, 28992) AS the_geom
   FROM ( SELECT hitbgt.cadid,
            hitbgt.bgtid,
            hitbgt.bgttype,
            hitbgt.mapnr,
            hitbgt.bagid,
            regexp_split_to_table(hitbgt.extra1::text, ';'::text) AS fsplit
           FROM hitbgt
          WHERE hitbgt.bgttype::text = 'PND'::text AND hitbgt.extra1 IS NOT NULL AND hitbgt.extra1::text <> ''::text) table_from_split where fsplit is not null and fsplit <> '';

ALTER TABLE v_baginfo
  OWNER TO "AOXX";
  
  
Alter table hitpbp_publish_incoming
add column publication_date character varying(16),
add column  xy character varying(100);


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
  
CREATE OR REPLACE FUNCTION hitbgt_mutation_incoming_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.geotxt IS NOT NULL  THEN
		Update hitbgt_mutation_incoming set the_geom = St_curvetoline(St_GeomFromText(geotxt,28992)) Where cadid = NEW.cadid;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
		Update hitbgt_mutation_incoming set the_geom = null
		Where cadid = NEW.cadid;
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitbgt_mutation_incoming_autofldupdate()
  OWNER TO "AOXX";

  =======================================================
CREATE TRIGGER hitbgt_mutation_incoming_changed
  AFTER INSERT OR UPDATE OF geotxt
  ON hitbgt_mutation_incoming
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgt_mutation_incoming_autofldupdate();

  
CREATE OR REPLACE FUNCTION hitbgtoth_mutation_incoming_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.geotxt IS NOT NULL  THEN
		Update hitbgtoth_mutation_incoming set the_geom = St_curvetoline(St_GeomFromText(geotxt,28992)) Where cadid = NEW.cadid;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
		Update hitbgtoth_mutation_incoming set the_geom = null
		Where cadid = NEW.cadid;
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitbgtoth_mutation_incoming_autofldupdate()
  OWNER TO "AOXX";

CREATE TRIGGER hitbgtoth_mutation_incoming_autofldupdate
  AFTER INSERT OR UPDATE OF geotxt
  ON hitbgtoth_mutation_incoming
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgtoth_mutation_incoming_autofldupdate();
