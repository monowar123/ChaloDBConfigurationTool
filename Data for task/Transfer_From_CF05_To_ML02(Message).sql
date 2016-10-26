Alter table  hitpbp_publish
add column  publication_date character varying(16);

-- DROP FUNCTION fn_create_bgtid_revision(character varying);

CREATE OR REPLACE FUNCTION fn_create_bgtid_revision(arg_bgtid character varying)
  RETURNS character varying AS
$BODY$
Declare new_bgtid_ret text;
BEGIN
	--- This query will create next version of BGTID from the current one
	Select 	CASE WHEN length(next_revision) = 3 THEN overlay(cur_bgtid placing next_revision from 18 for 3) ELSE overlay(cur_bgtid placing next_revision from 7 for 14) END 
        new_bgtid into new_bgtid_ret from (
	Select cur_bgtid,upper(to_hex(new_bgtid_revision)) next_revision from (
		Select arg_bgtid as cur_bgtid  , CASE WHEN substring(upper(arg_bgtid),7,11) = '8ABEACD5439' then 
			('x'||lpad(substring(arg_bgtid,18,3),16,'0'))::bit(64)::bigint +1
			else ('x'||lpad('8ABEACD5439B75',16,'0'))::bit(64)::bigint
		End as new_bgtid_revision) fo ) foo;
        Return new_bgtid_ret;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_create_bgtid_revision(character varying)
  OWNER TO "AOXX";
  
  -- DROP FUNCTION fn_create_missing_pbp(character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION fn_create_missing_pbp(
    morg_arg character varying,
    methodcode_arg character varying,
    method_arg character varying,
    prec_arg character varying,
    mdate_arg character varying,
    lastupdate_arg character varying)
  RETURNS boolean AS
$BODY$
    BEGIN
        INSERT INTO hitpbp(cadid, mapnr, x, y, bgtid, method, methodcode, prec, mdate, morg, layer, lastupdate)
	-- check for missing pbps
	Select a.cadid,a.mapnr,a.x,a.y,a.bgtid,a.method,a.methodcode,a.prec,a.mdate,a.morg,'default',lastupdate_arg from
	  (select distinct
	    lpad(cast(ST_X((dp).geom) * 1000 as text),9,'0') || lpad(cast(ST_Y(((dp).geom)) * 1000 as text),9,'0') as cadid,
	    substr(lnkcadid,1,2) as mapnr,
	    ST_X((dp).geom) as x,
	    ST_Y((dp).geom) as y,
	    morg_arg ||'.8ABEACD5439B75' || lpad(cast(ST_X((dp).geom) * 1000 as text),9,'0') || lpad(cast(ST_Y(((dp).geom)) * 1000 as text),9,'0')  as bgtid,
	    method_arg as method,
	    methodcode_arg  as prec,
	    prec_arg as method,
	    mdate_arg as mdate
	   
	  from
	  ( select mapnr,dp,lnkcadid,lastupdate from
	    (
	      select mapnr,ST_DumpPoints(st_geomfromtext(geotxt)) as dp,mapnr || 'HitBgt' as lnkcadid, lastupdate from hitbgt 
	      union
	      select mapnr,ST_DumpPoints(st_geomfromtext(geotxt)) as dp,mapnr || 'HitBgtOth' as lnkcadid, lastupdate from hitbgtoth  
										 Where substring(geotype,1,1) in ('l','v') OR lower(tmain) = 'hoogspanningsmast'
	    ) x
	    
	  ) sub
	  ) a
	  left join
	  (Select distinct mapnr,cadid from hitpbp) b
	  on a.mapnr=b.mapnr and a.cadid=b.cadid 
	  where b.cadid is null;      

    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_create_missing_pbp(character varying, character varying, character varying, character varying, character varying, character varying)
  OWNER TO "AOXX";
  
-- DROP FUNCTION fn_create_tmp_missing_pbp();

CREATE OR REPLACE FUNCTION fn_create_tmp_missing_pbp()
  RETURNS boolean AS
$BODY$

BEGIN
    
     BEGIN
        truncate hitpbp_missing;
        INSERT INTO hitpbp_missing(cadid, x, y,mapnr)
	
	Select a.cadid,a.x,a.y ,a.mapnr from
	  (select distinct
	    lpad(cast(ST_X((dp).geom) * 1000 as text),9,'0') || lpad(cast(ST_Y(((dp).geom)) * 1000 as text),9,'0') as cadid,
	    substr(lnkcadid,1,2) as mapnr,
	    ST_X((dp).geom) as x,
	    ST_Y((dp).geom) as y
	    
	   
	   
	  from
	  ( select dp,lnkcadid,lastupdate from
	    (
	      select mapnr,ST_DumpPoints(st_geomfromtext(geotxt)) as dp,mapnr || 'HitBgt' as lnkcadid, lastupdate from hitbgt 
	      union
	      select mapnr,ST_DumpPoints(st_geomfromtext(geotxt)) as dp,mapnr || 'HitBgtOth' as lnkcadid, lastupdate from hitbgtoth  
										 Where substring(geotype,1,1) in ('l','v') OR lower(tmain) = 'hoogspanningsmast'
	    ) x
	    
	  ) sub
	  ) a
	  left join
	  (Select distinct mapnr,cadid from hitpbp) b
	  on a.cadid=b.cadid 
	  where b.cadid is null;
        
      EXCEPTION WHEN OTHERS THEN
		Return false;
	
	END;	
      
Return true;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_create_tmp_missing_pbp()
  OWNER TO "AOXX";
  
  

-- DROP TABLE hitpbp_missing;

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
  
-- DROP TABLE hitpbp_replaced_history;

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
  
  

-- DROP TABLE hittasks;
-- new field added
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
  
-- DROP TABLE hitworkpackage;

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

-- DROP TABLE incoming_announcement;

CREATE TABLE incoming_announcement
(
  id serial NOT NULL,
  msg_id integer,
  msg_type character varying(10),
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

-- DROP TABLE messages;

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
  
-- DROP TABLE stuf_msg_config;

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
  
  
-- DROP VIEW v_lv_messages;

CREATE OR REPLACE VIEW v_lv_messages AS 
 SELECT messages.msg_id,
    messages.proj_code,
    messages.bgtgvt,
    messages.msg_dir,
    messages.msg_type,
    messages.msg_ref,
    messages.msg_crossref,
    messages.msg_timestamp,
    messages.request_id,
    messages.request_ref,
    messages.request_timestamp,
    messages.request_descr,
    messages.msg_xml,
    messages.status,
    messages.response_ref,
    messages.response_crossref,
    messages.response_xml,
    messages.attachment,
    messages.extra1,
    messages.extra2,
    messages.record_log
   FROM messages
  WHERE messages.msg_type::text = ANY (ARRAY['MTE'::character varying::text, 'MTI'::character varying::text])
  ORDER BY messages.request_timestamp;

ALTER TABLE v_lv_messages
  OWNER TO "AOXX";


-- DROP VIEW v_messages;

CREATE OR REPLACE VIEW v_messages AS 
 SELECT messages.msg_id,
    messages.proj_code,
    messages.bgtgvt,
    messages.msg_dir,
    messages.msg_type,
    messages.msg_ref,
    messages.msg_crossref,
    messages.status,
    messages.request_id,
    messages.request_ref,
    messages.request_timestamp,
    messages.request_descr,
    messages.msg_xml,
    messages.msg_timestamp,
    messages.response_ref,
    messages.response_crossref,
    messages.response_xml,
        CASE
            WHEN lower(messages.msg_dir::text) = 'in'::text THEN '/Incoming/'::text || messages.attachment
            ELSE '/Outgoing/'::text || messages.attachment
        END AS relfilename,
    messages.record_log,
    messages.extra1,
    messages.extra2
   FROM messages
  ORDER BY messages.msg_id;

ALTER TABLE v_messages
  OWNER TO "AOXX";



