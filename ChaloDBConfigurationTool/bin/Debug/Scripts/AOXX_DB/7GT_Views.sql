/*--------------------------------------------
RNa:20160125
Views for GeoTopo to help export as GT feature class format
Version: 1.2.5.0

Important:::
OBD,KWD and SHD can be BGT and Oth-BGT as well.

OBD: Polygon object
KWD: Point, Line and Polygon
SHD: Line and Polygon

For polygon type objects query used as union from hitbgt and hitbgtoth
------------------------------------------------*/
/* ******************************    
             Inrichtend
********************************/

/* 
DROP VIEW v_gt_bak_p;
DROP VIEW v_gt_paal_p;
DROP VIEW  v_gt_put_p;
DROP VIEW  v_gt_vegetatieobject_l;
DROP VIEW v_gt_vegetatieobject_p;
DROP VIEW v_gt_vegetatieobject_v;
DROP VIEW v_gt_weginrichting_l;

DROP VIEW v_gt_weginrichting_p;
DROP VIEW v_gt_weginrichting_v;
DROP VIEW v_gt_waterinrichting_l;
DROP VIEW v_gt_waterinrichting_p;
DROP VIEW v_gt_bord_p;
DROP VIEW v_gt_gebouwInstallatie_v;
DROP VIEW v_gt_installatie_p;
DROP VIEW v_gt_kast_p;
DROP VIEW v_gt_kunstwerk_l;
DROP VIEW v_gt_kunstwerk_p;
DROP VIEW v_gt_mast_p;
DROP VIEW v_gt_scheiding_l;
DROP VIEW v_gt_scheidingOverig_l;
DROP VIEW v_gt_scheidingOverig_v;
DROP VIEW v_gt_sensor_l;
DROP VIEW v_gt_sensor_p;
DROP VIEW v_gt_spoor_l;
DROP VIEW v_gt_straatmeubilair_p;
DROP VIEW v_gt_tunneldeel_v;
DROP VIEW v_gt_overbruggingsdeel_v;
DROP VIEW v_gt_overigBouwwerk_v;
DROP VIEW v_gt_terreinbegroeid_v;
DROP VIEW v_gt_terreinonbegroeid_v;
DROP VIEW v_gt_wegdeel_v;
DROP VIEW v_gt_wegondersteunend_v;
DROP VIEW v_gt_waterdeel_v;
DROP VIEW v_gt_waterondersteunend_v;
DROP VIEW v_gt_pandmaaiveld_v;
DROP VIEW v_gt_ongeclassificeerd_v;
DROP VIEW v_gt_scheiding_v;
DROP VIEW v_gt_kunstwerk_v;
DROP VIEW v_gt_kruinlijn_l;
DROP VIEW v_gt_functioneelGebied_v;
DROP VIEW v_gt_plaatsbepalingspunt_p;

DROP VIEW v_gt_project_gebied_v;

*/

--- Feature Class:: bak_p

CREATE OR REPLACE VIEW v_gt_bak_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'BAK'::text;

ALTER TABLE v_gt_bak_p
  OWNER TO "AOXX";

--- Feature Class:: paal_p
CREATE OR REPLACE VIEW v_gt_paal_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'PAL'::text;

ALTER TABLE v_gt_paal_p
  OWNER TO "AOXX";


--- Feature Class:: put_p
CREATE OR REPLACE VIEW v_gt_put_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'PUT'::text;

ALTER TABLE v_gt_put_p
  OWNER TO "AOXX";


  
--- Feature Clas:: vegetatieObject_l  
  
CREATE OR REPLACE VIEW v_gt_vegetatieobject_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'VGO'::text AND lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_vegetatieobject_l
  OWNER TO "AOXX"; 
 


--- Feature Clas:: vegetatieObject_p

CREATE OR REPLACE VIEW v_gt_vegetatieobject_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'VGO'::text AND lower("substring"(geotype::text, 1, 1)) = 'p'::text;

ALTER TABLE v_gt_vegetatieobject_p
  OWNER TO "AOXX";


--- Feature Clas:: vegetatieObject_v
  
CREATE OR REPLACE VIEW v_gt_vegetatieobject_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'VGO'::text AND lower("substring"(geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_gt_vegetatieobject_v
  OWNER TO "AOXX";

  
--- Feature Clas:: weginrichting_l 
  
CREATE OR REPLACE VIEW v_gt_weginrichting_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'WGI'::text AND lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_weginrichting_l
  OWNER TO "AOXX";  
  
 
--- Feature Clas:: weginrichting_lp
  
CREATE OR REPLACE VIEW v_gt_weginrichting_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'WGI'::text AND lower("substring"(geotype::text, 1, 1)) = 'p'::text;

ALTER TABLE v_gt_weginrichting_p
  OWNER TO "AOXX";
  
 
--- Feature Clas:: weginrichting_v 
  
CREATE OR REPLACE VIEW v_gt_weginrichting_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'WGI'::text AND lower("substring"(geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_gt_weginrichting_v
  OWNER TO "AOXX";
 
 
--- Feature Clas:: waterinrichting_l
  
CREATE OR REPLACE VIEW v_gt_waterinrichting_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'WTI'::text AND lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_waterinrichting_l
  OWNER TO "AOXX";  
 

--- Feature Clas:: waterinrichting_p
  
CREATE OR REPLACE VIEW v_gt_waterinrichting_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'WTI'::text AND lower("substring"(geotype::text, 1, 1)) = 'p'::text;

ALTER TABLE v_gt_waterinrichting_p
  OWNER TO "AOXX"; 
 
 
-- Feature Class:: bord_p

CREATE OR REPLACE VIEW v_gt_bord_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'BRD'::text;

ALTER TABLE v_gt_bord_p
  OWNER TO "AOXX";
  
  
--- Feature Clas:: gebouwInstallatie_v 
  
CREATE OR REPLACE VIEW v_gt_gebouwInstallatie_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'GBI'::text;

ALTER TABLE v_gt_gebouwInstallatie_v
  OWNER TO "AOXX";
 

-- Feature Class:: installatie_p

CREATE OR REPLACE VIEW v_gt_installatie_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'INS'::text;

ALTER TABLE v_gt_installatie_p
  OWNER TO "AOXX"; 
 

-- Feature Class:: kast_p

CREATE OR REPLACE VIEW v_gt_kast_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'KST'::text;

ALTER TABLE v_gt_kast_p
  OWNER TO "AOXX";  
 
 
--- Feature Clas:: kunstwerk_l  
  
CREATE OR REPLACE VIEW v_gt_kunstwerk_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'KWD'::text AND lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_kunstwerk_l
  OWNER TO "AOXX"; 

  
--- Feature Clas:: kunstwerk_p
  
CREATE OR REPLACE VIEW v_gt_kunstwerk_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'KWD'::text AND lower("substring"(geotype::text, 1, 1)) = 'p'::text;

ALTER TABLE v_gt_kunstwerk_p
  OWNER TO "AOXX";   


 
--- Feature Clas:: mast_p
  
CREATE OR REPLACE VIEW v_gt_mast_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'MST'::text;

ALTER TABLE v_gt_mast_p
  OWNER TO "AOXX";   

 
--- Feature Clas:: scheiding_l
  
CREATE OR REPLACE VIEW v_gt_scheiding_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'SHD'::text AND  lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_scheiding_l
  OWNER TO "AOXX";   
  
  
--- Feature Clas:: scheidingOverig_l
  
CREATE OR REPLACE VIEW v_gt_scheidingOverig_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'OSH'::text  AND lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_scheidingOverig_l
  OWNER TO "AOXX";  
  

  
--- Feature Clas:: scheidingOverig_v
  
CREATE OR REPLACE VIEW v_gt_scheidingOverig_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'OSH'::text  AND lower("substring"(geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_gt_scheidingOverig_v
  OWNER TO "AOXX";    
  
  
 
--- Feature Clas:: sensor_l
  
CREATE OR REPLACE VIEW v_gt_sensor_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'SNS'::text  AND lower("substring"(geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_gt_sensor_l
  OWNER TO "AOXX";  

  --- Feature Clas:: sensor_l
  
CREATE OR REPLACE VIEW v_gt_sensor_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'SNS'::text  AND lower("substring"(geotype::text, 1, 1)) = 'p'::text;

ALTER TABLE v_gt_sensor_p
  OWNER TO "AOXX";
  
--- Feature Clas:: spoor_l
  
CREATE OR REPLACE VIEW v_gt_spoor_l AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'SPR'::text ;

ALTER TABLE v_gt_spoor_l
  OWNER TO "AOXX";     
  
  
  

--- Feature Clas:: straatmeubilair_p
  
CREATE OR REPLACE VIEW v_gt_straatmeubilair_p AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'STM'::text ;

ALTER TABLE v_gt_straatmeubilair_p
  OWNER TO "AOXX";  
  

  
--- Feature Clas:: tunneldeel_v
  
CREATE OR REPLACE VIEW v_gt_tunneldeel_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'TND';

ALTER TABLE v_gt_tunneldeel_v
  OWNER TO "AOXX";   
  
  
--- Feature Clas:: overbruggingsdeel_v
  
CREATE OR REPLACE VIEW v_gt_overbruggingsdeel_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text)  AS typeOverbrugging, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, 
	tsub AS typeOverbruggingsdeel,
	geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'OBD'::text
  UNION
  SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text)  AS typeOverbrugging, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, 
	tsub AS typeOverbruggingsdeel,
	geotxt AS shape
   FROM hitbgtoth_checkout
  WHERE bgttype::text = 'OBD'::text;

ALTER TABLE v_gt_overbruggingsdeel_v
  OWNER TO "AOXX";
  
  
  
/* **********************************************************************************   
             Opdelend
************************************************************************************/


--- Feature Clas:: overigBouwwerk_v

CREATE OR REPLACE VIEW v_gt_overigBouwwerk_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
	COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
	tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::unknown AS eindregistratie, 
    NULL::unknown AS lv_publicatiedatum, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'OBW'::text;

ALTER TABLE v_gt_overigBouwwerk_v
  OWNER TO "AOXX";

--- Feature Clas:: terreinbegroeid_v

CREATE OR REPLACE VIEW v_gt_terreinbegroeid_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::unknown AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS fysiekvoorkomen, 
    NULL::unknown AS lv_publicatiedatum, 
        CASE
            WHEN talud::text = '0'::text THEN 'Nee'::text
            ELSE NULL::text
        END AS optalud, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'BTD'::text;

ALTER TABLE v_gt_terreinbegroeid_v
  OWNER TO "AOXX";
  
  

--- Feature Clas:: terreinonbegroeid_v
  
CREATE OR REPLACE VIEW v_gt_terreinonbegroeid_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::unknown AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS fysiekvoorkomen, 
    NULL::unknown AS lv_publicatiedatum, 
        CASE
            WHEN talud::text = '0'::text THEN 'Nee'::text
            ELSE NULL::text
        END AS optalud, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'OTD'::text;

ALTER TABLE v_gt_terreinonbegroeid_v
  OWNER TO "AOXX";  

  
--- Feature Clas:: wegdeel_v
  
CREATE OR REPLACE VIEW v_gt_wegdeel_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::unknown AS eindregistratie, 
    fmain::text || COALESCE(': '::text || NULLIF(fsub::text, ''::text), ''::text) AS functie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS fysiekvoorkomen, 
    NULL::unknown AS lv_publicatiedatum, 
        CASE
            WHEN talud::text = '0'::text THEN 'Nee'::text
            ELSE NULL::text
        END AS optalud, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'WGD'::text;

ALTER TABLE v_gt_wegdeel_v
  OWNER TO "AOXX";  
  
 
--- Feature Clas:: v_gt_wegondersteunend_v

CREATE OR REPLACE VIEW v_gt_wegondersteunend_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::unknown AS eindregistratie, 
    fmain::text || COALESCE(': '::text || NULLIF(fsub::text, ''::text), ''::text) AS functie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS fysiekvoorkomen, 
    NULL::unknown AS lv_publicatiedatum, 
        CASE
            WHEN talud::text = '0'::text THEN 'Nee'::text
            ELSE NULL::text
        END AS optalud, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'OWG'::text;

ALTER TABLE v_gt_wegondersteunend_v
  OWNER TO "AOXX";  
  
  
--- Feature Clas:: waterdeel_v
  
CREATE OR REPLACE VIEW v_gt_waterdeel_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
	(tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type,
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::unknown AS eindregistratie, NULL::unknown AS lv_publicatiedatum, 
        CASE
            WHEN talud::text = '0'::text THEN 'Nee'::text
            ELSE NULL::text
        END AS optalud, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'WTD'::text;

ALTER TABLE v_gt_waterdeel_v
  OWNER TO "AOXX";


--- Feature Clas:: waterondersteunend_v
 
CREATE OR REPLACE VIEW v_gt_waterondersteunend_v AS 
 SELECT mapnr, extra5 as prjid , bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::unknown AS objecteindtijd, bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    0 AS relatievehoogteligging, 
	(tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type,
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::unknown AS eindregistratie, NULL::unknown AS lv_publicatiedatum, 
        CASE
            WHEN talud::text = '0'::text THEN 'Nee'::text
            ELSE NULL::text
        END AS optalud, 
    NULL::unknown AS bor_id, NULL::unknown AS globalid, 
	
    NULL::unknown AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Ja' AS isbgt, geotxt AS shape
   FROM hitbgt_checkout
  WHERE bgttype::text = 'OWT'::text;

ALTER TABLE v_gt_waterondersteunend_v
  OWNER TO "AOXX";
  


--Feature Class v_gt_pandmaaiveld
CREATE OR REPLACE VIEW v_gt_pandmaaiveld_v AS 
 SELECT hitbgt_checkout.mapnr,
    hitbgt_checkout.extra5 AS prjid,
    hitbgt_checkout.bgtid AS identificatie,
    hitbgt_checkout.status,
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd,
    NULL::timestamp with time zone AS objecteindtijd,
    hitbgt_checkout.bgtgvt AS bronhouder,
    COALESCE(NULLIF(hitbgt_checkout.inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek,
    0::smallint AS relatievehooteligging,
    to_timestamp(hitbgt_checkout.lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie,
    NULL::timestamp with time zone AS eindregistratie,
    hitbgt_checkout.bagid AS identificatiebagpnd,
    Trim(both ',' from (COALESCE(NULLIF(split_part(hitbgt_checkout.extra1::text, ','::text, 3), ''::text), ''::text) || ','::text) || COALESCE(NULLIF(split_part(hitbgt_checkout.extra1::text, ','::text, 4), ''::text), ''::text)) AS nummeraanduidingreeks,
    NULL::timestamp with time zone AS lv_publicatiedatum,
    COALESCE(NULLIF(split_part(hitbgt_checkout.extra1::text, ','::text, 5), ''::text), ''::text) AS identificatiebagvbolaagstehnr,
    COALESCE(NULLIF(split_part(COALESCE(NULLIF(split_part(extra1::text, ';'::text, 1), ''::text), ''::text)::text, ','::text, 6), ''::text), ''::text) AS identificatiebagvbohoogstehnr,
    NULL::text AS globalid,
    to_date(hitbgt_checkout.crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date,
    hitbgt_checkout.operator AS last_edited_user,
    to_timestamp(hitbgt_checkout.lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date,
    COALESCE(NULLIF(split_part(hitbgt_checkout.extra1::text, ','::text, 1), ''::text), ''::text) AS position_x,
    COALESCE(NULLIF(split_part(hitbgt_checkout.extra1::text, ','::text, 2), ''::text), ''::text) AS position_y,
    'Ja' AS isbgt,
    hitbgt_checkout.geotxt::text AS shape
   FROM hitbgt_checkout
  WHERE hitbgt_checkout.bgttype::text = 'PND'::text;


ALTER TABLE v_gt_pandmaaiveld_v OWNER TO "AOXX";


-- Feature Class v_gt_ongeclassificeerd

CREATE OR REPLACE VIEW v_gt_ongeclassificeerd_v AS
	SELECT  mapnr, extra5 as prjid , bgtid AS identificatie, status, 
	to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
	(null::TIMESTAMP WITH TIME ZONE) AS objecteindtijd, bgtgvt AS bronhouder,
		COALESCE(NULLIF(inonderzoek,''), 'Nee') AS inonderzoek, 
		0::SMALLINT AS relatievehoogteligging, 
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie,
		(null::TIMESTAMP WITH TIME ZONE) AS eindregistratie, 
		(tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type, 
		(null::TIMESTAMP WITH TIME ZONE) AS lv_publicatiedatum,
		null::text AS bor_id, null::text AS globalid, 
		null::text AS created_user,
		to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, operator AS last_edited_user,
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
		'Ja' AS isbgt,geotxt AS shape
	FROM hitbgt_checkout
	WHERE bgttype = 'OCO';

ALTER TABLE v_gt_ongeclassificeerd_v OWNER TO "AOXX";


--- Feature Clas:: scheiding

CREATE OR REPLACE VIEW v_gt_scheiding_v AS
	SELECT  mapnr, extra5 as prjid , bgtid AS identificatie, status, to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
	(null::TIMESTAMP WITH TIME ZONE) AS objecteindtijd, bgtgvt AS bronhouder,
		COALESCE(NULLIF(inonderzoek,''), 'Nee') AS inonderzoek, 
		0::SMALLINT AS relatievehoogteligging, 
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie,
		(null::TIMESTAMP WITH TIME ZONE) AS eindregistratie, (tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type,
		(null::TIMESTAMP WITH TIME ZONE) AS lv_publicatiedatum,
		null::text AS bor_id, null::text AS globalid, 
		null::text AS created_user, 
		to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date,
		operator AS last_edited_user,
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
		'Ja' AS isbgt,
		geotxt AS shape
	FROM hitbgt_checkout
	WHERE bgttype = 'SHD'
UNION
SELECT  mapnr, extra5 as prjid , bgtid AS identificatie, status, to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
	(null::TIMESTAMP WITH TIME ZONE) AS objecteindtijd, bgtgvt AS bronhouder,
		COALESCE(NULLIF(inonderzoek,''), 'Nee') AS inonderzoek, 
		0::SMALLINT AS relatievehoogteligging, 
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie,
		(null::TIMESTAMP WITH TIME ZONE) AS eindregistratie, (tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type,
		(null::TIMESTAMP WITH TIME ZONE) AS lv_publicatiedatum,
		null::text AS bor_id, null::text AS globalid, 
		null::text AS created_user, 
		to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date,
		operator AS last_edited_user,
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
		'Nee' AS isbgt,
		geotxt AS shape
	FROM hitbgtoth_checkout
	WHERE bgttype = 'SHD' AND lower("substring"(geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_gt_scheiding_v OWNER TO "AOXX";


--- Feature Clas:: kunstwerk

CREATE OR REPLACE VIEW v_gt_kunstwerk_v AS
SELECT  mapnr, extra5 as prjid , bgtid AS identificatie, status, to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, (null::TIMESTAMP WITH TIME ZONE) AS objecteindtijd, bgtgvt AS bronhouder,
		COALESCE(NULLIF(inonderzoek,''), 'Nee') AS inonderzoek, 0::SMALLINT AS relatievehoogteligging, 
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie,
		(null::TIMESTAMP WITH TIME ZONE) AS eindregistratie, (tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type, (null::TIMESTAMP WITH TIME ZONE) AS lv_publicatiedatum,
		null::text AS bor_id, null::text AS globalid, null::text AS created_user, 
		to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
		operator AS last_edited_user,
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
		'Ja' AS isbgt,geotxt AS shape
	FROM hitbgt_checkout
	WHERE bgttype = 'KWD'
UNION
SELECT  mapnr, extra5 as prjid , bgtid AS identificatie, status, to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, (null::TIMESTAMP WITH TIME ZONE) AS objecteindtijd, bgtgvt AS bronhouder,
		COALESCE(NULLIF(inonderzoek,''), 'Nee') AS inonderzoek, 0::SMALLINT AS relatievehoogteligging, 
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie,
		(null::TIMESTAMP WITH TIME ZONE) AS eindregistratie, (tmain || COALESCE(': ' || NULLIF(tsub,''), '')) AS type, (null::TIMESTAMP WITH TIME ZONE) AS lv_publicatiedatum,
		null::text AS bor_id, null::text AS globalid, null::text AS created_user, 
		to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
		operator AS last_edited_user,
		to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
		'Nee' AS isbgt,geotxt AS shape
	FROM hitbgtoth_checkout
	WHERE bgttype = 'KWD' AND lower("substring"(geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_gt_kunstwerk_v OWNER TO "AOXX";



/* ******************************    
             OverigIMGEO
********************************/

--- Feature Class:: kruinlijn_l
 
CREATE OR REPLACE VIEW v_gt_kruinlijn_l AS 
 SELECT hitbgt_checkout.mapnr, hitbgt_checkout.extra5 AS prjid, 
    hitbgt_checkout.bgtid AS BGT_ObjectID,
    hitbgt_checkout.bgttype::text BGT_Objecttype,    
    hitbgt_checkout.extra1::text  AS shape
   FROM hitbgt_checkout
  WHERE bgttype in ( 'BTD','OTD','WGD','OWG' ) and extra1 != '' and extra1 is not null;

ALTER TABLE v_gt_kruinlijn_l
  OWNER TO "AOXX"; 
  
  
--- Feature Clas:: functioneelGebied_v
  
CREATE OR REPLACE VIEW v_gt_functioneelGebied_v AS 
 SELECT mapnr, extra5 as prjid,  bgtid AS identificatie, status, 
    to_timestamp(crtdate , 'YYYYMMDD'::text)::timestamp  without time zone AS objectbegintijd, 
    NULL::timestamp with time zone AS objecteindtijd, 
    bgtgvt AS bronhouder, 
    COALESCE(NULLIF(inonderzoek::text, ''::text), 'Nee'::text) AS inonderzoek, 
    COALESCE(NULLIF(level::text, ''::text), '0'::text)::smallint AS relatievehoogteligging, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS tijdstipregistratie, 
    NULL::timestamp with time zone AS eindregistratie, 
    tmain::text || COALESCE(': '::text || NULLIF(tsub::text, ''::text), ''::text) AS type, 
    NULL::timestamp with time zone AS lv_publicatiedatum, NULL::text AS bor_id, 
    NULL::text AS globalid, NULL::text AS created_user, 
    to_date(crtdate::text, 'YYYYMMDD'::text)::timestamp without time zone::text AS created_date, 
    operator AS last_edited_user, 
    to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
    'Nee' AS isbgt, geotxt AS shape
   FROM hitbgtoth_checkout 
  WHERE bgttype::text = 'FUG';

ALTER TABLE v_gt_functioneelGebied_v
  OWNER TO "AOXX"; 
  

CREATE OR REPLACE VIEW v_gt_project_gebied_v AS 
 SELECT id,
    current_database() AS dbname,
    (id::text || '-'::text) || title::text AS aoiname,
    st_astext(the_geom) AS shape
   FROM hitworkpackage;

ALTER TABLE v_gt_project_gebied_v
  OWNER TO "AOXX";
  
  
 CREATE OR REPLACE VIEW v_gt_plaatsbepalingspunt_p AS 
	 SELECT mapnr, extra5 as prjid,
	 bgtid AS identificatie, 
	 'Nee' AS isbgt, 
	 'POINT(' || x || ' ' || y || ')' AS shape,
	 to_timestamp(lastupdate::text, 'YYYYMMDDHH24MI'::text)::timestamp without time zone::text AS last_edited_date, 
	 prec as nauwkeurigheid,
	 mdate as datumInwinning,
	 morg as inwinnendeInstantie,
	 method as inwinningsmethode
FROM hitpbp_checkout;

ALTER TABLE v_gt_plaatsbepalingspunt_p
  OWNER TO "AOXX";
  
  