
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
  
  
  

CREATE OR REPLACE FUNCTION fn_hitgv_tooltip(
    bgttype character varying,
    bgtid character varying,
    bgtgvt character varying,
    rfunc character varying,
    otype character varying,
    bagid character varying,
    talud character varying,
    extra1 character varying)
  RETURNS text AS
$BODY$
	Declare tooltip text;
	Declare rtype_desc text;
	Declare otype_desc text;
BEGIN
	
        tooltip = '';
        rtype_desc = '';
	otype_desc = '';
       
	BEGIN
        
         IF extra1 is null THEN
		extra1 = '';
	 END IF;	
         
         IF bagid is null THEN
		bagid = '';
	 END IF;
        

        -- BGTTYPE
	IF bgttype is null or bgttype = '' THEN
		bgttype = '-';
	END IF;	
	tooltip = tooltip || 'BGT-Type: ' || bgttype;
   
	-- bgtid
	tooltip = tooltip || '\n';
	IF bgtid is null or bgtid = '' THEN
		bgtid = '-';
	END IF;	
	tooltip = tooltip || 'BGT-Id:   '|| bgtid;
   

	-- bgtgvt
	tooltip = tooltip || '\n';
	IF bgtgvt is null or bgtgvt = '' THEN
		bgtgvt = '-';
	END IF;	
	tooltip = tooltip || 'BGT-Gvt:  ' || bgtgvt;

	-- rfunc
	IF bgttype = 'OWG' OR bgttype = 'WGD' THEN
		Select description into rtype_desc from bgtfulldomain where code = rfunc limit 1;
		IF rtype_desc is null or rtype_desc = '' THEN
			rtype_desc = '-';
				
		END IF;	
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'R-Func:   ' || rtype_desc;
	END IF;
	
	-- otype
	IF bgttype <> '-' AND bgttype <> 'PND' THEN
		Select description into otype_desc from bgtfulldomain where code = otype limit 1;
		IF otype_desc is null or otype_desc = '' THEN
			otype_desc = '-';
				
		END IF;	
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'O-Type:   ' || otype_desc;
	END IF;


	-- bagid
	IF bgttype = 'PND' THEN
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'BAG-Id:   ' || bagid  || '\n';
                tooltip = tooltip || 'NAR Info:   ' || extra1;
	END IF;	
	

	-- talud
	IF bgttype = 'OTD' OR bgttype = 'BTD' OR bgttype = 'OWG' OR bgttype = 'WGD' THEN
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'Talud:    ' || talud;
	END IF;	

	EXCEPTION WHEN OTHERS THEN
		tooltip = '-';
	END;

	IF tooltip = '' THEN
		tooltip = '-';
	END IF;

    RETURN tooltip;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_hitgv_tooltip(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
  OWNER TO "AOXX";
  

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
  
  
  
INSERT INTO stuf_msg_config(
            sender_bronhouder, sender_application, sender_administration, 
            msg_ref_prefix, msg_identification_prefix, toelichting)
    --VALUES ('G0400','ChaloIS-BGTLink','ML02','8ABEA','G0400.8A','BGT');
	VALUES ('msgconfig_sender_bronhouder','msgconfig_sender_application','msgconfig_sender_administration','msgconfig_msg_ref_prefix','msgconfig_msg_identification_prefix','msgconfig_toelichting');
	-- Sender bronhouder : GXXXX
	-- Sender application name : ChaloIS-BGTLink
	-- Sender administration: AOXX
	-- Reference prefix: 8ABEA
	-- Identification prefix: GXXXX.8A
	-- Msg toelichting : BGT
	
	
	