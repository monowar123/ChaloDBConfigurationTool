----------------------------------------------------------------------------VIEWS-------------------------------------------------------------------------------
/* ********************
DROP VIEW v_vborange_per_pand;
DROP VIEW v_hitbgtpbp;
DROP VIEW v_hitbgt;
DROP VIEW v_hitbgt_lev0;
DROP VIEW v_hitbgt_lev1;
DROP VIEW v_hitbgtkr;
DROP VIEW v_hitbgtoth_orl;
DROP VIEW v_hitbgtoth;
DROP VIEW v_hitbgtoth_polygon;
DROP VIEW v_hitbgtoth_line;
DROP VIEW v_hitbgtoth_point;
DROP VIEW v_hitpbp;
DROP VIEW v_orgpbp;
DROP VIEW v_ws_code;
DROP VIEW v_bore_code;
DROP VIEW v_ez_ww1;
DROP VIEW v_ez_ww2;
DROP VIEW hittasks_v;
***********************/



CREATE OR REPLACE VIEW v_pinline AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.omschrijving,
    hittasks.ingevoerd,
    hittasks.einddatum,
    hittasks.status,
    hittasks.statusupd,
    hittasks.actie,
    hittasks.afdeling,
    hittasks.actiedatum,
    hittasks.opmerking,
    hittasks.statuslog,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
    hittasks.geomarker_type,
    hittasks.the_geom,
    hittasks.taaktitle,
    hittasks.opened_by,
    hittasks.last_edited_by
   FROM hittasks
   WHERE lower(COALESCE(NULLIF(hittasks.geomarker_type::text, ''::text), '-'::text)) = 'line' AND 
      lower(COALESCE(NULLIF(hittasks.status::text, ''::text), '-'::text)) <>  'close';
ALTER TABLE v_pinline
  OWNER TO "AOXX";

  
CREATE OR REPLACE VIEW v_pinpoint AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.omschrijving,
    hittasks.ingevoerd,
    hittasks.einddatum,
    hittasks.status,
    hittasks.statusupd,
    hittasks.actie,
    hittasks.afdeling,
    hittasks.actiedatum,
    hittasks.opmerking,
    hittasks.statuslog,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
    hittasks.geomarker_type,
    hittasks.the_geom,
    hittasks.taaktitle,
    hittasks.opened_by,
    hittasks.last_edited_by
   FROM hittasks
  WHERE lower(COALESCE(NULLIF(hittasks.geomarker_type::text, ''::text), '-'::text)) = 'point' AND 
      lower(COALESCE(NULLIF(hittasks.status::text, ''::text), '-'::text)) <>  'close';
	  
ALTER TABLE v_pinpoint
  OWNER TO "AOXX";

  
  
CREATE OR REPLACE VIEW v_pinpolygon AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.omschrijving,
    hittasks.ingevoerd,
    hittasks.einddatum,
    hittasks.status,
    hittasks.statusupd,
    hittasks.actie,
    hittasks.afdeling,
    hittasks.actiedatum,
    hittasks.opmerking,
    hittasks.statuslog,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
    hittasks.geomarker_type,
    hittasks.the_geom,
    hittasks.taaktitle,
    hittasks.opened_by,
    hittasks.last_edited_by
   FROM hittasks
  WHERE lower(COALESCE(NULLIF(hittasks.geomarker_type::text, ''::text), '-'::text)) = 'polygon' OR 
               lower(COALESCE(NULLIF(hittasks.geomarker_type::text, ''::text), '-'::text)) = 'v'  
      AND lower(COALESCE(NULLIF(hittasks.status::text, ''::text), '-'::text)) <>  'close';
ALTER TABLE v_pinpolygon
  OWNER TO "AOXX";



CREATE OR REPLACE VIEW v_hitbgtpbp AS 
 SELECT hp.cadid, hp.mapnr, hp.lnkcadid, hp.x, hp.y, hp.parentcadid, 
    hp.lastupdate, hp.the_geom, hp.snpgroup, bgtlnk.methodcode, bgtlnk.prec, 
    bgtlnk.date AS mdate, bgtlnk.laygroup, bgtlnk.organization AS morg
   FROM ( SELECT hitbgtpbp.cadid, hitbgtpbp.mapnr, hitbgtpbp.lnkcadid, 
            hitbgtpbp.x, hitbgtpbp.y, hitbgtpbp.parentcadid, 
            hitbgtpbp.lastupdate, hitbgtpbp.snpgroup, 
            st_geomfromtext(((('Point('::text || hitbgtpbp.x) || ' '::text) || hitbgtpbp.y) || ')'::text, 28992) AS the_geom
           FROM hitbgtpbp) hp
   LEFT JOIN ( SELECT lnk.cadid, lnk.mapnr, lnk.layer, lnk.laygroup, lnk.geotxt, 
            lnk.lastupdate, d.id, d.layername, d.layerformat, d.organization, 
            d.methodcode, d.method, d.prec, d.date
           FROM hitbgtlnk lnk
      LEFT JOIN default_pbp_info d ON d.layername::text = lnk.laygroup::text) bgtlnk ON bgtlnk.cadid::text = hp.lnkcadid::text;

  ALTER TABLE v_hitbgtpbp
  OWNER TO "AOXX";



CREATE OR REPLACE VIEW v_hitbgt AS 
 SELECT hitbgt.cadid, hitbgt.blk AS rfunc, hitbgt.otype, hitbgt.talud, 
    hitbgt.orgid, hitbgt.orginf, hitbgt.bsrc, hitbgt.baginf, hitbgt.remark, 
    hitbgt.mapnr, hitbgt.gvt, hitbgt.bgtgvt, hitbgt.qacode, hitbgt.crtdate, 
    hitbgt.area, hitbgt.ctimestamp, hitbgt.operator, hitbgt.x, hitbgt.y, 
    hitbgt.bgtid, hitbgt.bgttype, hitbgt.tmain, hitbgt.tsub, hitbgt.fmain, 
    hitbgt.fsub, hitbgt.bagid, hitbgt.level, hitbgt.lastupdate, 
    st_geomfromtext(hitbgt.geotxtlin::text) AS the_geom
   FROM hitbgt;
   
  ALTER TABLE v_hitbgt
  OWNER TO "AOXX";  
  
--hitbgt_lev0

-- Replaced by Monowar (06.06.16)
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
  
  
 --hitbgt_lev1  
 -- Replaced by Monowar (06.06.16)
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
  
  
--hitbgtoth_orl   
-- Replaced by Monowar (17.06.16)
CREATE OR REPLACE VIEW v_hitbgtoth_orl AS 
 SELECT hitbgtoth.cadid,
    hitbgtoth.blk,
    hitbgtoth.otype,
        CASE
            WHEN hitbgtoth.extra3 IS NULL OR hitbgtoth.extra3::text = ''::text THEN COALESCE(NULLIF(hitbgtoth.name::text, ''::text), ''::text)::character varying
            ELSE hitbgtoth.extra3
        END AS name,
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
        CASE
            WHEN hitbgtoth.extra1 IS NULL OR hitbgtoth.extra1::text = ''::text THEN COALESCE(NULLIF(hitbgtoth.rotation::text, ''::text), '0'::text)::character varying::text
            ELSE btrim(split_part(hitbgtoth.extra1::text, ';'::text, 1), ';'::text)
        END AS rotation,
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
  WHERE COALESCE(NULLIF(hitbgtoth.blk::text, ''::text), ''::text) = 'BGTORL'::text;

ALTER TABLE v_hitbgtoth_orl
  OWNER TO "AOXX"; 
  
   
--hitbgtoth

CREATE OR REPLACE VIEW v_hitbgtoth AS 
 SELECT hitbgtoth.cadid, hitbgtoth.blk, hitbgtoth.otype, hitbgtoth.name, 
    hitbgtoth.plusfunc, hitbgtoth.canmove, hitbgtoth.orgid, hitbgtoth.orginf, 
    hitbgtoth.remark, hitbgtoth.mapnr, hitbgtoth.gvt, hitbgtoth.bgtgvt, 
    hitbgtoth.qacode, hitbgtoth.crtdate, hitbgtoth.geotype, 
    hitbgtoth.ctimestamp, hitbgtoth.operator, hitbgtoth.x, hitbgtoth.y, 
    hitbgtoth.rotation, hitbgtoth.bgtid, hitbgtoth.bgttype, hitbgtoth.tmain, 
    hitbgtoth.tsub, hitbgtoth.level, hitbgtoth.lastupdate, 
    hitbgtoth.the_geom
   FROM hitbgtoth;

    ALTER TABLE v_hitbgtoth
  OWNER TO "AOXX"; 
   
CREATE OR REPLACE VIEW v_hitpbp AS 
 SELECT hitpbp.id, hitpbp.cadid, hitpbp.mapnr, hitpbp.x, hitpbp.y, hitpbp.bgtid, 
    hitpbp.method, hitpbp.methodcode, hitpbp.prec, hitpbp.mdate, hitpbp.morg, 
    hitpbp.layer, hitpbp.snapped, hitpbp.lastupdate, hitpbp.snappeddistance, 
    st_geomfromtext(((('POINT('::text || hitpbp.x) || ' '::text) || hitpbp.y) || ')'::text) AS the_geom
   FROM hitpbp;

     ALTER TABLE v_hitpbp
  OWNER TO "AOXX";
   
      CREATE OR REPLACE VIEW v_orgpbp AS 
 SELECT orgpbp.id, orgpbp.src, orgpbp.x, orgpbp.y, orgpbp.bgtid, 
    orgpbp.method, orgpbp.methodcode, orgpbp.prec, orgpbp.mdate, orgpbp.morg, 
    st_geomfromtext(((('POINT('::text || orgpbp.x) || ' '::text) || orgpbp.y) || ')'::text) AS the_geom
   FROM orgpbp;

     ALTER TABLE v_orgpbp
  OWNER TO "AOXX";
   
CREATE OR REPLACE VIEW v_hitbgtoth_polygon AS 
 SELECT *, 
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth
  WHERE lower("substring"(hitbgtoth.geotype::text, 1, 1)) = 'v'::text;

   ALTER TABLE v_hitbgtoth_polygon
  OWNER TO "AOXX";
  

CREATE OR REPLACE VIEW v_hitbgtoth_line AS 
 SELECT *, 
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth
  WHERE lower("substring"(hitbgtoth.geotype::text, 1, 1)) = 'l'::text;

  ALTER TABLE v_hitbgtoth_line
  OWNER TO "AOXX";
  
  
-- Replaced by Monowar (06.06.16)  
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
  
   
 CREATE OR REPLACE VIEW v_ws_code AS 
 SELECT hitbgt.orgid, hitbgt.bgtid, hitbgt.orginf, hitbgt.rfunc, hitbgt.otype, 
    hitbgt.area
   FROM hitbgt
  WHERE hitbgt.bgtid::text ~~ 'W%'::text AND hitbgt.orgid::text <> ''::text
  ORDER BY hitbgt.orgid;

  ALTER TABLE v_ws_code
  OWNER TO "AOXX";
  
  
 CREATE OR REPLACE VIEW v_bore_code AS 
 SELECT hitbgt.orgid, hitbgt.bgtid, hitbgt.orginf, hitbgt.rfunc, hitbgt.otype, 
    hitbgt.area
   FROM hitbgt
  WHERE hitbgt.bgtid::text ~~ 'G%'::text AND hitbgt.orgid::text <> ''::text
  ORDER BY hitbgt.orgid;

  ALTER TABLE v_bore_code
  OWNER TO "AOXX";
  
 CREATE OR REPLACE VIEW v_ez_ww1 AS 
 SELECT a.gml_id, a.lokaalid,a.orginf, b.bgtid, b.bgttype, b.area
   FROM orgez a
   LEFT JOIN hitbgt b ON a.lokaalid::text = b.bgtid::text;

  ALTER TABLE v_ez_ww1
  OWNER TO "AOXX";
   
 CREATE OR REPLACE VIEW v_ez_ww2 AS 
 SELECT a.gml_id, a.lokaalid,a.orginf, b.bgtid, b.bgttype, b.area
   FROM orgez a
   RIGHT JOIN hitbgt b ON b.bgtid::text = a.lokaalid::text
  WHERE b.bgtid::text ~~ 'L0001%'::text;

  ALTER TABLE v_ez_ww2
  OWNER TO "AOXX";
  
CREATE OR REPLACE VIEW v_hitbgtkr AS 
 SELECT hitbgt.cadid, hitbgt.mapnr, hitbgt.bgttype, 'BGTKRL'::text AS layer, 
    hitbgt.lastupdate, st_curvetoline(st_geomfromtext(hitbgt.extra1::text, 28992)) AS the_geom
   FROM hitbgt
  WHERE hitbgt.extra1 IS NOT NULL AND hitbgt.extra1::text <> ''::text AND (hitbgt.bgttype::text = ANY (ARRAY['BTD'::character varying::text, 'OTD'::character varying::text, 'WGD'::character varying::text, 'OWG'::character varying::text]));

ALTER TABLE v_hitbgtkr
  OWNER TO "AOXX";
 

-- Replaced by Monowar (06.06.16)
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
  


CREATE OR REPLACE VIEW hittasks_v AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.taaktitle,
    hittasks.omschrijving,
    to_char(hittasks.ingevoerd::timestamp with time zone, 'yyyy-mm-dd'::text) AS ingevoerd,
    to_char(hittasks.einddatum::timestamp with time zone, 'yyyy-mm-dd'::text) AS einddatum,
    hittasks.status,
    to_char(hittasks.statusupd::timestamp with time zone, 'yyyy-mm-dd'::text) AS statusupd,
    hittasks.actie,
    hittasks.afdeling,
    to_char(hittasks.actiedatum::timestamp with time zone, 'yyyy-mm-dd'::text) AS actiedatum,
    hittasks.opmerking,
    to_char(hittasks.ingevoerd::timestamp with time zone, 'yyyy'::text) AS jaar,
    to_char(hittasks.ingevoerd::timestamp with time zone, 'yyyy_mm'::text) AS maand,
    hittasks.statuslog,
        CASE
            WHEN hittasks.status::text = 'Open'::text THEN now()::date - hittasks.ingevoerd
            ELSE 0
        END AS daysopen,
        CASE
            WHEN hittasks.status::text = 'Open'::text THEN hittasks.actiedatum - now()::date
            ELSE 0
        END AS daysleft,
    to_char(hittasks.ingevoerd::timestamp with time zone, 'yyyy'::text) || to_char(date_part('week'::text, hittasks.actiedatum), '00'::text) AS actieweek,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
	hittasks.geomarker_type
   FROM hittasks;

ALTER TABLE hittasks_v
  OWNER TO "AOXX";  
  
  
CREATE OR REPLACE VIEW v_baghousenr AS 
 SELECT DISTINCT v.pand_id,
    v.vbo_id,
    v.status AS vbo_status,
    'Main'::text AS adrestype,
    n.status AS nr_status,
    n.straatnaam,
    ('['::text || n.huisnummer) || ']'::text AS huisnummer,
    ('['::text || COALESCE(n.huisletter, ''::character varying)::text) || ']'::text AS huisletter,
    ('['::text || COALESCE(n.toevoeging, ''::character varying)::text) || ']'::text AS toevoeging,
    (lpad(n.huisnummer::text, 5, '0'::text) || lpad(COALESCE(n.huisletter, ''::character varying)::text, 5, '_'::text)) || lpad(COALESCE(n.toevoeging, ''::character varying)::text, 5, '_'::text) AS bgtsortnr,
    (n.huisnummer::text || COALESCE(n.huisletter, ''::character varying)::text) ||
        CASE
            WHEN COALESCE(n.toevoeging, ''::character varying)::text <> ''::text THEN '/'::text || n.toevoeging::text
            ELSE ''::text
        END AS bgtnr,
    (ltrim(to_char(st_x(v.wkb_geometry), '999999.999'::text), ' '::text) || ','::text) || ltrim(to_char(st_y(v.wkb_geometry), '999999.999'::text), ' '::text) AS vboxy,
    v.wkb_geometry AS geom
   FROM nummer n,
    vbo v
  WHERE n.nummer_id::text = v.h_adres::text AND v.status::text !~~* 'Verblijfsobject%ingetrokken'::text AND v.status::text !~~* 'Niet%gerealiseerd%verblijfsobject'::text AND n.status::text !~~* 'Naamgeving%ingetrokken'::text AND v.inactief::text = 'N'::text
AND v.datum_eind is null AND n.datum_eind is null

UNION
 SELECT v.pand_id,
    v.vbo_id,
    v.status AS vbo_status,
    'Sub'::text AS adrestype,
    n.status AS nr_status,
    n.straatnaam,
    ('['::text || n.huisnummer) || ']'::text AS huisnummer,
    ('['::text || COALESCE(n.huisletter, ''::character varying)::text) || ']'::text AS huisletter,
    ('['::text || COALESCE(n.toevoeging, ''::character varying)::text) || ']'::text AS toevoeging,
    (lpad(n.huisnummer::text, 5, '0'::text) || lpad(COALESCE(n.huisletter, ''::character varying)::text, 5, '_'::text)) || lpad(COALESCE(n.toevoeging, ''::character varying)::text, 5, '_'::text) AS bgtsortnr,
    (n.huisnummer::text || COALESCE(n.huisletter, ''::character varying)::text) ||
        CASE
            WHEN COALESCE(n.toevoeging, ''::character varying)::text <> ''::text THEN '/'::text || n.toevoeging::text
            ELSE ''::text
        END AS bgtnr,
    (ltrim(to_char(st_x(v.wkb_geometry), '999999.999'::text), ' '::text) || ','::text) || ltrim(to_char(st_y(v.wkb_geometry), '999999.999'::text), ' '::text) AS vboxy,
    v.wkb_geometry AS geom
   FROM nummer n,
    vbo v
  WHERE n.nummer_id::text = v.n_adres::text AND v.status::text !~~* 'Verblijfsobject%ingetrokken'::text AND v.status::text !~~* 'Niet%gerealiseerd%verblijfsobject'::text AND n.status::text !~~* 'Naamgeving%ingetrokken'::text AND v.inactief::text = 'N'::text
AND v.datum_eind is null AND n.datum_eind is null
;

ALTER TABLE v_baghousenr
  OWNER TO "AOXX";
  

CREATE OR REPLACE VIEW v_baghousenrgrouped AS 
  SELECT baghousenr.pand_id, baghousenr.adrestype, baghousenr.straatnaam, 
    min(baghousenr.bgtsortnr) AS minbgtsornr, 
    max(baghousenr.bgtsortnr) AS maxbgtsornr
  FROM v_baghousenr baghousenr
  GROUP BY baghousenr.pand_id, baghousenr.adrestype, baghousenr.straatnaam;
ALTER TABLE v_baghousenrgrouped
  OWNER TO "AOXX";
 
  

Create or replace view v_BagNars
As Select amin.pand_id,amin.adrestype,amin.straatnaam,row_number() over (partition by amin.pand_id order by amin.adrestype) as rnum, amin.vbo_id as minid,amin.vboxy as minvboxy,amax.vbo_id as maxid,amax.vboxy as maxvboxy, amin.bgtnr as minnr,amax.bgtnr as maxnr
from v_baghousenr amin,v_baghousenr amax, v_baghousenrgrouped hmin,v_baghousenrgrouped hmax
where amin.pand_id = hmin.pand_id and amin.adrestype = hmin.adrestype and amin.straatnaam = hmin.straatnaam 
  and amax.pand_id = hmax.pand_id and amax.adrestype = hmax.adrestype and amax.straatnaam = hmax.straatnaam 
  and amax.pand_id = amin.pand_id and amax.adrestype = amin.adrestype and amax.straatnaam = amin.straatnaam 
  and amin.bgtsortnr = hmin.minbgtsornr 
  and amax.bgtsortnr = hmax.maxbgtsornr;

ALTER TABLE v_BagNars
  OWNER TO "AOXX";
  
  
 -- View: v_pinpointtasks

-- DROP VIEW v_pinpointtasks;

CREATE OR REPLACE VIEW v_pinpointtasks AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.omschrijving,
    hittasks.ingevoerd,
    hittasks.einddatum,
    hittasks.status,
    hittasks.statusupd,
    hittasks.actie,
    hittasks.afdeling,
    hittasks.actiedatum,
    hittasks.opmerking,
    hittasks.statuslog,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
    hittasks.geomarker_type,
    hittasks.the_geom,
    hittasks.taaktitle,
    hittasks.opened_by,
    hittasks.last_edited_by,
    hittasks.workpkgid
   FROM hittasks
  WHERE hittasks.taaktype::text = 'SIG'::text AND hittasks.status::text <> 'Close'::text;

ALTER TABLE v_pinpointtasks
  OWNER TO "AOXX";
  
  -- View: v_projecttasks

-- DROP VIEW v_projecttasks;

CREATE OR REPLACE VIEW v_projecttasks AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.omschrijving,
    hittasks.ingevoerd,
    hittasks.einddatum,
    hittasks.status,
    hittasks.statusupd,
    hittasks.actie,
    hittasks.afdeling,
    hittasks.actiedatum,
    hittasks.opmerking,
    hittasks.statuslog,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
    hittasks.geomarker_type,
    hittasks.the_geom,
    hittasks.taaktitle,
    hittasks.opened_by,
    hittasks.last_edited_by,
    hittasks.workpkgid
   FROM hittasks
  WHERE hittasks.taaktype::text = 'PRJ'::text AND hittasks.status::text <> 'Close'::text;

ALTER TABLE v_projecttasks
  OWNER TO "AOXX";
  
  -- View: v_messages

-- DROP VIEW v_messages;

-- Replaced by Monowar (06.06.16)
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


-- Added by Monowar (06.06.16)
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
  
  
-- Added by Monowar (26.09.16)
CREATE OR REPLACE VIEW public.v_vlakobjecten AS 
 SELECT hitbgt.cadid,
    hitbgt.bgtgvt,
    hitbgt.crtdate,
    hitbgt.bgtid,
    hitbgt.bgttype,
    hitbgt.tmain,
    hitbgt.tsub,
    hitbgt.fmain,
    hitbgt.fsub,
    0::double precision AS float8,
    hitbgt.level,
    hitbgt.bagid,
    hitbgt.geotxt,
    hitbgt.geotxtlin,
    hitbgt.lastupdate,
    hitbgt.status,
    hitbgt.plusstatus,
    hitbgt.inonderzoek,
    hitbgt.extra1,
    hitbgt.extra2,
    hitbgt.extra3,
    hitbgt.extra4,
    hitbgt.the_geom,
    fn_hitgv_tooltip(hitbgt.bgttype, hitbgt.bgtid, hitbgt.bgtgvt, hitbgt.rfunc, hitbgt.otype, hitbgt.bagid, hitbgt.talud, hitbgt.extra1) AS tooltiptext
   FROM hitbgt
  WHERE COALESCE(NULLIF(hitbgt.level::text, ''::text), '0'::text) <> '0'::text
UNION
 SELECT hitbgtoth.cadid,
    hitbgtoth.bgtgvt,
    hitbgtoth.crtdate,
    hitbgtoth.bgtid,
    hitbgtoth.bgttype,
    hitbgtoth.tmain,
    hitbgtoth.tsub,
    ''::character varying AS fmain,
    ''::character varying AS fsub,
    hitbgtoth.rotation AS float8,
    hitbgtoth.level,
    ''::character varying AS bagid,
    hitbgtoth.geotxt,
    hitbgtoth.geotxtlin,
    hitbgtoth.lastupdate,
    hitbgtoth.status,
    hitbgtoth.plusstatus,
    hitbgtoth.inonderzoek,
    hitbgtoth.extra1,
    hitbgtoth.extra2,
    hitbgtoth.extra3,
    hitbgtoth.extra4,
    hitbgtoth.the_geom,
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptext
   FROM hitbgtoth
  WHERE lower("substring"(hitbgtoth.geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE public.v_vlakobjecten
  OWNER TO "AOXX";


CREATE OR REPLACE VIEW public.v_property_viewer AS 
SELECT 'BGT Opdelend' as layer_name,
	hitbgt.cadid,
    hitbgt.bgtgvt,
    hitbgt.crtdate,
    hitbgt.bgtid,
    hitbgt.bgttype,
    hitbgt.tmain,
    hitbgt.tsub,
    hitbgt.fmain,
    hitbgt.fsub,
    0::double precision AS float8,
    hitbgt.level,
    hitbgt.bagid,
    hitbgt.lastupdate,
    hitbgt.status,
    hitbgt.plusstatus,
    hitbgt.inonderzoek,
    hitbgt.the_geom,
    ST_AsText(hitbgt.the_geom) as wkt,
    fn_hitgv_tooltip(hitbgt.bgttype, hitbgt.bgtid, hitbgt.bgtgvt, hitbgt.rfunc, hitbgt.otype, hitbgt.bagid, hitbgt.talud, hitbgt.extra1) AS tooltiptext
   FROM hitbgt
  WHERE hitbgt.level::text = '0'::text AND COALESCE(NULLIF(hitbgt.blk::text, ''::text), ''::text) <> 'MAPCTR'::text
UNION
SELECT 'Vlakobjecten' as layer_name,
	v_vlakobjecten.cadid,
    v_vlakobjecten.bgtgvt,
    v_vlakobjecten.crtdate,
    v_vlakobjecten.bgtid,
    v_vlakobjecten.bgttype,
    v_vlakobjecten.tmain,
    v_vlakobjecten.tsub,
    v_vlakobjecten.fmain,
    v_vlakobjecten.fsub,
    v_vlakobjecten.float8,
    v_vlakobjecten.level,
    v_vlakobjecten.bagid,
    v_vlakobjecten.lastupdate,
    v_vlakobjecten.status,
    v_vlakobjecten.plusstatus,
    v_vlakobjecten.inonderzoek,
    v_vlakobjecten.the_geom,
    ST_AsText(v_vlakobjecten.the_geom) as wkt,
    v_vlakobjecten.tooltiptext
   FROM v_vlakobjecten
UNION
 SELECT 'Puntobjecten' as layer_name,
	hitbgtoth.cadid,
    hitbgtoth.bgtgvt,
    hitbgtoth.crtdate,
    hitbgtoth.bgtid,
    hitbgtoth.bgttype,
    hitbgtoth.tmain,
    hitbgtoth.tsub,
    ''::character varying AS fmain,
    ''::character varying AS fsub,
    hitbgtoth.rotation AS float8,
    hitbgtoth.level,
    ''::character varying AS bagid,
    hitbgtoth.lastupdate,
    hitbgtoth.status,
    hitbgtoth.plusstatus,
    hitbgtoth.inonderzoek,
    hitbgtoth.the_geom,
    ST_AsText(hitbgtoth.the_geom) as wkt,
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptext
   FROM hitbgtoth
  WHERE lower("substring"(hitbgtoth.geotype::text, 1, 1)) = 'p'::text AND COALESCE(NULLIF(hitbgtoth.blk::text, ''::text), ''::text) <> 'BGTORL'::text AND hitbgtoth.bgttype::text <> 'ORL'::text
UNION
 SELECT 'Lijnobjecten' as layer_name,
	hitbgtoth.cadid,
    hitbgtoth.bgtgvt,
    hitbgtoth.crtdate,
    hitbgtoth.bgtid,
    hitbgtoth.bgttype,
    hitbgtoth.tmain,
    hitbgtoth.tsub,
    ''::character varying AS fmain,
    ''::character varying AS fsub,
    hitbgtoth.rotation AS float8,
    hitbgtoth.level,
    ''::character varying AS bagid,
    hitbgtoth.lastupdate,
    hitbgtoth.status,
    hitbgtoth.plusstatus,
    hitbgtoth.inonderzoek,
    hitbgtoth.the_geom,
    ST_AsText(hitbgtoth.the_geom) as wkt,
    fn_hitothgv_tooltip(hitbgtoth.bgttype, hitbgtoth.bgtid, hitbgtoth.bgtgvt, ''::character varying, hitbgtoth.otype, ''::character varying, ''::character varying) AS tooltiptext
   FROM hitbgtoth
  WHERE lower("substring"(hitbgtoth.geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE public.v_property_viewer
  OWNER TO "AOXX";

 
 
-- Added by Monowar (27.09.16)
 CREATE OR REPLACE VIEW hitworkpackage_v AS 
 SELECT hitworkpackage.id,
    'WPK'::text AS taaktype,
    hitworkpackage.title AS taaktitle,
    hitworkpackage.description AS omschrijving,
    to_char(hitworkpackage.ingevoerd::timestamp with time zone, 'yyyy-mm-dd'::text) AS ingevoerd,
    to_char(hitworkpackage.einddatum::timestamp with time zone, 'yyyy-mm-dd'::text) AS einddatum,
    hitworkpackage.status,
    to_char(hitworkpackage.statusupd::timestamp with time zone, 'yyyy-mm-dd'::text) AS statusupd,
    hitworkpackage.actie,
    hitworkpackage.afdeling,
    to_char(hitworkpackage.actiedatum::timestamp with time zone, 'yyyy-mm-dd'::text) AS actiedatum,
    hitworkpackage.opmerking,
    to_char(hitworkpackage.ingevoerd::timestamp with time zone, 'yyyy'::text) AS jaar,
    to_char(hitworkpackage.ingevoerd::timestamp with time zone, 'yyyy_mm'::text) AS maand,
    hitworkpackage.statuslog,
        CASE
            WHEN hitworkpackage.status::text = 'Open'::text THEN now()::date - hitworkpackage.ingevoerd
            ELSE 0
        END AS daysopen,
        CASE
            WHEN hitworkpackage.status::text = 'Open'::text THEN hitworkpackage.actiedatum - now()::date
            ELSE 0
        END AS daysleft,
    to_char(hitworkpackage.ingevoerd::timestamp with time zone, 'yyyy'::text) || to_char(date_part('week'::text, hitworkpackage.actiedatum), '00'::text) AS actieweek,
    hitworkpackage.center_x,
    hitworkpackage.center_y,
    hitworkpackage.zoom_scale
   FROM hitworkpackage;

ALTER TABLE hitworkpackage_v
  OWNER TO "AOXX";

 
-- Added by Monowar (27.09.16) 
CREATE OR REPLACE VIEW incoming_data AS 
 SELECT hittasks.id,
    hittasks.taaktype,
    hittasks.taaktitle,
    hittasks.omschrijving,
    hittasks.ingevoerd,
    hittasks.einddatum,
    hittasks.status,
    hittasks.statusupd,
    hittasks.actie,
    hittasks.afdeling,
    hittasks.actiedatum,
    hittasks.opmerking,
    hittasks.statuslog,
    hittasks.center_x,
    hittasks.center_y,
    hittasks.zoom_scale,
    hittasks.geomarker_type,
    hittasks.opened_by,
    hittasks.last_edited_by,
    hittasks.the_geom,
    hittasks.workpkgid
   FROM hittasks
  WHERE hittasks.id::text <> ALL (ARRAY['S20160623001'::character varying, 'S20160623002'::character varying]::text[]);

ALTER TABLE incoming_data
  OWNER TO "AOXX";
  
  
-- Added by Monowar (27.09.16) 
CREATE OR REPLACE VIEW v_hitbgt_lev0_checkout AS 
 SELECT hitbgt_checkout.cadid,
    hitbgt_checkout.blk,
    hitbgt_checkout.rfunc,
    hitbgt_checkout.otype,
    hitbgt_checkout.talud,
    hitbgt_checkout.orgid,
    hitbgt_checkout.orginf,
    hitbgt_checkout.bsrc,
    hitbgt_checkout.baginf,
    hitbgt_checkout.remark,
    hitbgt_checkout.mapnr,
    hitbgt_checkout.gvt,
    hitbgt_checkout.bgtgvt,
    hitbgt_checkout.qacode,
    hitbgt_checkout.crtdate,
    hitbgt_checkout.area,
    hitbgt_checkout.ctimestamp,
    hitbgt_checkout.operator,
    hitbgt_checkout.x,
    hitbgt_checkout.y,
    hitbgt_checkout.bgtid,
    hitbgt_checkout.bgttype,
    hitbgt_checkout.tmain,
    hitbgt_checkout.tsub,
    hitbgt_checkout.fmain,
    hitbgt_checkout.fsub,
    hitbgt_checkout.bagid,
    hitbgt_checkout.level,
    hitbgt_checkout.geotxt,
    hitbgt_checkout.geotxtlin,
    hitbgt_checkout.bagnrgml,
    hitbgt_checkout.lastupdate,
    hitbgt_checkout.status,
    hitbgt_checkout.plusstatus,
    hitbgt_checkout.inonderzoek,
    hitbgt_checkout.geomarea,
    hitbgt_checkout.incityarea,
    hitbgt_checkout.nrpoints,
    hitbgt_checkout.nrrings,
    hitbgt_checkout.extra1,
    hitbgt_checkout.extra2,
    hitbgt_checkout.extra3,
    hitbgt_checkout.extra4,
    hitbgt_checkout.extra5,
    hitbgt_checkout.the_geom,
    fn_hitgv_tooltip(hitbgt_checkout.bgttype, hitbgt_checkout.bgtid, hitbgt_checkout.bgtgvt, hitbgt_checkout.rfunc, hitbgt_checkout.otype, hitbgt_checkout.bagid, hitbgt_checkout.talud, hitbgt_checkout.extra1) AS tooltiptext
   FROM hitbgt_checkout
  WHERE hitbgt_checkout.level::text = '0'::text AND COALESCE(NULLIF(hitbgt_checkout.blk::text, ''::text), ''::text) <> 'MAPCTR'::text;

ALTER TABLE v_hitbgt_lev0_checkout
  OWNER TO "AOXX";
  
  
CREATE OR REPLACE VIEW v_hitbgt_lev1_checkout AS 
 SELECT hitbgt_checkout.cadid,
    hitbgt_checkout.blk,
    hitbgt_checkout.rfunc,
    hitbgt_checkout.otype,
    hitbgt_checkout.talud,
    hitbgt_checkout.orgid,
    hitbgt_checkout.orginf,
    hitbgt_checkout.bsrc,
    hitbgt_checkout.baginf,
    hitbgt_checkout.remark,
    hitbgt_checkout.mapnr,
    hitbgt_checkout.gvt,
    hitbgt_checkout.bgtgvt,
    hitbgt_checkout.qacode,
    hitbgt_checkout.crtdate,
    hitbgt_checkout.area,
    hitbgt_checkout.ctimestamp,
    hitbgt_checkout.operator,
    hitbgt_checkout.x,
    hitbgt_checkout.y,
    hitbgt_checkout.bgtid,
    hitbgt_checkout.bgttype,
    hitbgt_checkout.tmain,
    hitbgt_checkout.tsub,
    hitbgt_checkout.fmain,
    hitbgt_checkout.fsub,
    hitbgt_checkout.bagid,
    hitbgt_checkout.level,
    hitbgt_checkout.geotxt,
    hitbgt_checkout.geotxtlin,
    hitbgt_checkout.bagnrgml,
    hitbgt_checkout.lastupdate,
    hitbgt_checkout.status,
    hitbgt_checkout.plusstatus,
    hitbgt_checkout.inonderzoek,
    hitbgt_checkout.geomarea,
    hitbgt_checkout.incityarea,
    hitbgt_checkout.nrpoints,
    hitbgt_checkout.nrrings,
    hitbgt_checkout.extra1,
    hitbgt_checkout.extra2,
    hitbgt_checkout.extra3,
    hitbgt_checkout.extra4,
    hitbgt_checkout.extra5,
    hitbgt_checkout.the_geom,
    fn_hitgv_tooltip(hitbgt_checkout.bgttype, hitbgt_checkout.bgtid, hitbgt_checkout.bgtgvt, hitbgt_checkout.rfunc, hitbgt_checkout.otype, hitbgt_checkout.bagid, hitbgt_checkout.talud, hitbgt_checkout.extra1) AS tooltiptext
   FROM hitbgt_checkout
  WHERE COALESCE(NULLIF(hitbgt_checkout.level::text, ''::text), '0'::text) <> '0'::text;

ALTER TABLE v_hitbgt_lev1_checkout
  OWNER TO "AOXX";
  
  
CREATE OR REPLACE VIEW v_hitbgtoth_line_checkout AS 
 SELECT hitbgtoth_checkout.cadid,
    hitbgtoth_checkout.blk,
    hitbgtoth_checkout.otype,
    hitbgtoth_checkout.name,
    hitbgtoth_checkout.plusfunc,
    hitbgtoth_checkout.canmove,
    hitbgtoth_checkout.orgid,
    hitbgtoth_checkout.orginf,
    hitbgtoth_checkout.remark,
    hitbgtoth_checkout.mapnr,
    hitbgtoth_checkout.gvt,
    hitbgtoth_checkout.bgtgvt,
    hitbgtoth_checkout.qacode,
    hitbgtoth_checkout.crtdate,
    hitbgtoth_checkout.geotype,
    hitbgtoth_checkout.ctimestamp,
    hitbgtoth_checkout.operator,
    hitbgtoth_checkout.x,
    hitbgtoth_checkout.y,
    hitbgtoth_checkout.rotation,
    hitbgtoth_checkout.bgtid,
    hitbgtoth_checkout.bgttype,
    hitbgtoth_checkout.tmain,
    hitbgtoth_checkout.tsub,
    hitbgtoth_checkout.level,
    hitbgtoth_checkout.geotxt,
    hitbgtoth_checkout.geotxtlin,
    hitbgtoth_checkout.lastupdate,
    hitbgtoth_checkout.status,
    hitbgtoth_checkout.plusstatus,
    hitbgtoth_checkout.inonderzoek,
    hitbgtoth_checkout.geomarea,
    hitbgtoth_checkout.nrpoints,
    hitbgtoth_checkout.nrrings,
    hitbgtoth_checkout.incityarea,
    hitbgtoth_checkout.extra1,
    hitbgtoth_checkout.extra2,
    hitbgtoth_checkout.extra3,
    hitbgtoth_checkout.extra4,
    hitbgtoth_checkout.extra5,
    hitbgtoth_checkout.the_geom,
    fn_hitothgv_tooltip(hitbgtoth_checkout.bgttype, hitbgtoth_checkout.bgtid, hitbgtoth_checkout.bgtgvt, ''::character varying, hitbgtoth_checkout.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth_checkout
  WHERE lower("substring"(hitbgtoth_checkout.geotype::text, 1, 1)) = 'l'::text;

ALTER TABLE v_hitbgtoth_line_checkout
  OWNER TO "AOXX";

  
CREATE OR REPLACE VIEW v_hitbgtoth_point_checkout AS 
 SELECT hitbgtoth_checkout.cadid,
    hitbgtoth_checkout.blk,
    hitbgtoth_checkout.otype,
    hitbgtoth_checkout.name,
    hitbgtoth_checkout.plusfunc,
    hitbgtoth_checkout.canmove,
    hitbgtoth_checkout.orgid,
    hitbgtoth_checkout.orginf,
    hitbgtoth_checkout.remark,
    hitbgtoth_checkout.mapnr,
    hitbgtoth_checkout.gvt,
    hitbgtoth_checkout.bgtgvt,
    hitbgtoth_checkout.qacode,
    hitbgtoth_checkout.crtdate,
    hitbgtoth_checkout.geotype,
    hitbgtoth_checkout.ctimestamp,
    hitbgtoth_checkout.operator,
    hitbgtoth_checkout.x,
    hitbgtoth_checkout.y,
    hitbgtoth_checkout.rotation,
    hitbgtoth_checkout.bgtid,
    hitbgtoth_checkout.bgttype,
    hitbgtoth_checkout.tmain,
    hitbgtoth_checkout.tsub,
    hitbgtoth_checkout.level,
    hitbgtoth_checkout.geotxt,
    hitbgtoth_checkout.geotxtlin,
    hitbgtoth_checkout.lastupdate,
    hitbgtoth_checkout.status,
    hitbgtoth_checkout.plusstatus,
    hitbgtoth_checkout.inonderzoek,
    hitbgtoth_checkout.geomarea,
    hitbgtoth_checkout.nrpoints,
    hitbgtoth_checkout.nrrings,
    hitbgtoth_checkout.incityarea,
    hitbgtoth_checkout.extra1,
    hitbgtoth_checkout.extra2,
    hitbgtoth_checkout.extra3,
    hitbgtoth_checkout.extra4,
    hitbgtoth_checkout.extra5,
    hitbgtoth_checkout.the_geom,
    fn_hitothgv_tooltip(hitbgtoth_checkout.bgttype, hitbgtoth_checkout.bgtid, hitbgtoth_checkout.bgtgvt, ''::character varying, hitbgtoth_checkout.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth_checkout
  WHERE lower("substring"(hitbgtoth_checkout.geotype::text, 1, 1)) = 'p'::text AND COALESCE(NULLIF(hitbgtoth_checkout.blk::text, ''::text), ''::text) <> 'BGTORL'::text AND hitbgtoth_checkout.bgttype::text <> 'ORL'::text;

ALTER TABLE v_hitbgtoth_point_checkout
  OWNER TO "AOXX";
  
  
CREATE OR REPLACE VIEW v_hitbgtoth_polygon_checkout AS 
 SELECT hitbgtoth_checkout.cadid,
    hitbgtoth_checkout.blk,
    hitbgtoth_checkout.otype,
    hitbgtoth_checkout.name,
    hitbgtoth_checkout.plusfunc,
    hitbgtoth_checkout.canmove,
    hitbgtoth_checkout.orgid,
    hitbgtoth_checkout.orginf,
    hitbgtoth_checkout.remark,
    hitbgtoth_checkout.mapnr,
    hitbgtoth_checkout.gvt,
    hitbgtoth_checkout.bgtgvt,
    hitbgtoth_checkout.qacode,
    hitbgtoth_checkout.crtdate,
    hitbgtoth_checkout.geotype,
    hitbgtoth_checkout.ctimestamp,
    hitbgtoth_checkout.operator,
    hitbgtoth_checkout.x,
    hitbgtoth_checkout.y,
    hitbgtoth_checkout.rotation,
    hitbgtoth_checkout.bgtid,
    hitbgtoth_checkout.bgttype,
    hitbgtoth_checkout.tmain,
    hitbgtoth_checkout.tsub,
    hitbgtoth_checkout.level,
    hitbgtoth_checkout.geotxt,
    hitbgtoth_checkout.geotxtlin,
    hitbgtoth_checkout.lastupdate,
    hitbgtoth_checkout.status,
    hitbgtoth_checkout.plusstatus,
    hitbgtoth_checkout.inonderzoek,
    hitbgtoth_checkout.geomarea,
    hitbgtoth_checkout.nrpoints,
    hitbgtoth_checkout.nrrings,
    hitbgtoth_checkout.incityarea,
    hitbgtoth_checkout.extra1,
    hitbgtoth_checkout.extra2,
    hitbgtoth_checkout.extra3,
    hitbgtoth_checkout.extra4,
    hitbgtoth_checkout.extra5,
    hitbgtoth_checkout.the_geom,
    fn_hitothgv_tooltip(hitbgtoth_checkout.bgttype, hitbgtoth_checkout.bgtid, hitbgtoth_checkout.bgtgvt, ''::character varying, hitbgtoth_checkout.otype, ''::character varying, ''::character varying) AS tooltiptxt
   FROM hitbgtoth_checkout
  WHERE lower("substring"(hitbgtoth_checkout.geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_hitbgtoth_polygon_checkout
  OWNER TO "AOXX";
  
  
CREATE OR REPLACE VIEW v_hitworkpackage_gv AS 
 SELECT hitworkpackage.id,
    hitworkpackage.title,
    hitworkpackage.description,
    hitworkpackage.ingevoerd,
    hitworkpackage.einddatum,
    hitworkpackage.status,
    hitworkpackage.statusupd,
    hitworkpackage.actie,
    hitworkpackage.afdeling,
    hitworkpackage.actiedatum,
    hitworkpackage.opmerking,
    hitworkpackage.statuslog,
    hitworkpackage.center_x,
    hitworkpackage.center_y,
    hitworkpackage.zoom_scale,
    hitworkpackage.opened_by,
    hitworkpackage.the_geom,
    hitworkpackage.remark,
    hitworkpackage.extra1,
    hitworkpackage.extra2,
    hitworkpackage.extra3,
    hitworkpackage.extra4,
    hitworkpackage.extra5
   FROM hitworkpackage
  WHERE upper(hitworkpackage.status::text) <> 'CLOSE'::text;

ALTER TABLE v_hitworkpackage_gv
  OWNER TO "AOXX";

  
CREATE OR REPLACE VIEW v_vlakobjecten_checkout AS 
 SELECT hitbgt_checkout.cadid,
    hitbgt_checkout.bgtgvt,
    hitbgt_checkout.crtdate,
    hitbgt_checkout.bgtid,
    hitbgt_checkout.bgttype,
    hitbgt_checkout.tmain,
    hitbgt_checkout.tsub,
    hitbgt_checkout.fmain,
    hitbgt_checkout.fsub,
    0::double precision AS float8,
    hitbgt_checkout.level,
    hitbgt_checkout.bagid,
    hitbgt_checkout.geotxt,
    hitbgt_checkout.geotxtlin,
    hitbgt_checkout.lastupdate,
    hitbgt_checkout.status,
    hitbgt_checkout.plusstatus,
    hitbgt_checkout.inonderzoek,
    hitbgt_checkout.extra1,
    hitbgt_checkout.extra2,
    hitbgt_checkout.extra3,
    hitbgt_checkout.extra4,
    hitbgt_checkout.extra5,
    hitbgt_checkout.the_geom,
    fn_hitgv_tooltip(hitbgt_checkout.bgttype, hitbgt_checkout.bgtid, hitbgt_checkout.bgtgvt, hitbgt_checkout.rfunc, hitbgt_checkout.otype, hitbgt_checkout.bagid, hitbgt_checkout.talud, hitbgt_checkout.extra1) AS tooltiptext
   FROM hitbgt_checkout
  WHERE COALESCE(NULLIF(hitbgt_checkout.level::text, ''::text), '0'::text) <> '0'::text
UNION
 SELECT hitbgtoth_checkout.cadid,
    hitbgtoth_checkout.bgtgvt,
    hitbgtoth_checkout.crtdate,
    hitbgtoth_checkout.bgtid,
    hitbgtoth_checkout.bgttype,
    hitbgtoth_checkout.tmain,
    hitbgtoth_checkout.tsub,
    ''::character varying AS fmain,
    ''::character varying AS fsub,
    hitbgtoth_checkout.rotation AS float8,
    hitbgtoth_checkout.level,
    ''::character varying AS bagid,
    hitbgtoth_checkout.geotxt,
    hitbgtoth_checkout.geotxtlin,
    hitbgtoth_checkout.lastupdate,
    hitbgtoth_checkout.status,
    hitbgtoth_checkout.plusstatus,
    hitbgtoth_checkout.inonderzoek,
    hitbgtoth_checkout.extra1,
    hitbgtoth_checkout.extra2,
    hitbgtoth_checkout.extra3,
    hitbgtoth_checkout.extra4,
    hitbgtoth_checkout.extra5,
    hitbgtoth_checkout.the_geom,
    fn_hitothgv_tooltip(hitbgtoth_checkout.bgttype, hitbgtoth_checkout.bgtid, hitbgtoth_checkout.bgtgvt, ''::character varying, hitbgtoth_checkout.otype, ''::character varying, ''::character varying) AS tooltiptext
   FROM hitbgtoth_checkout
  WHERE lower("substring"(hitbgtoth_checkout.geotype::text, 1, 1)) = 'v'::text;

ALTER TABLE v_vlakobjecten_checkout
  OWNER TO "AOXX";
