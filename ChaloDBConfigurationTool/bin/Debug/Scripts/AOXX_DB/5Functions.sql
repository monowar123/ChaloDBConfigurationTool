------------------------------------------------------------------------FUNCTIONS----------------------------------------------------------------------------
-- Function: func_insert_errorinfo()

-- DROP FUNCTION func_insert_errorinfo();

CREATE OR REPLACE FUNCTION func_insert_errorinfo()
  RETURNS boolean AS
$BODY$
BEGIN
     truncate table errorinfo;
 --Check if any morg is empty
   Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
   Select 'morg-null','some morg empty in the hitpbp table','Total:'||count(*) ,null,mapnr,'morg','hitpbp' from hitpbp where morg is null or morg = ''
   group by mapnr;

 --Check if any bgtid is empty
   Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
   Select 'bgtid-null','some bgtid empty in the hitpbp table','Total:'||count(*) ,null,mapnr,'bgtid','hitpbp' from hitpbp where bgtid is null or bgtid = ''
   group by mapnr;
   
 --Check if any method name is empty
   Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
   Select 'method-null','some method name empty in the hitpbp table','Total:'||count(*) ,null,mapnr,'method','hitpbp' from hitpbp where method is null or method = ''
   group by mapnr;
   
 -- Hex Char in ORL-Name
    Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
  Select 'HEX_CHAR','Hexadecimal Char found. Not compatible with xml',name,cadid,mapnr,'name','hitbgtoth' from hitbgtoth
    where strpos(name,'') > 0;

-- empty crtdate hitbgt
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'NULL-crtdate','crtdate is null','Total:'|| count(cadid),'*',mapnr,'crtdate','hitbgt' from hitbgt
where crtdate is null or crtdate='' group by mapnr;

-- empty crtdate hitbgtoth
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'NULL-crtdate','crtdate is null','Total:'|| count(cadid),'*',mapnr,'crtdate','hitbgtoth' from hitbgtoth
where crtdate is null or crtdate='' group by mapnr;

-- default pbp empty check
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'No-DefaultPBP','Default PBP info is empty',null,null,null,null,'default_pbp_info' from 
(Select count(*) total from default_pbp_info ) tmp where total = 0;


-- Layer group value is null in link table
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'NULL-LayGrp','Some Layer group is null in bgtlnk','Total:'|| count(cadid),'*',mapnr,'laygroup','hitbgtlnk' from HITBGTLNK
where LAYGROUP IS NULL OR LAYGROUP='' group by mapnr;

-- Laygroup found in link table that is undefined in default pbp info
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'Undefined-Laygroup','Laygroup found in link table that is undefined in default pbp info',l.laygroup,l.cadid,l.mapnr,'laygroup','hitbgtlnk' from 
hitbgtlnk l left join default_pbp_info d on l.laygroup=d.layername
where layername is null;

-- Actual bgt null geom check
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'Null-Geom','Found null value in geom field',null,cadid,mapnr,'the_geom','hitbgt' from hitbgt where the_geom is null;

-- Actual bgt invalid geom check
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'Invalid-Geom',st_isvalidreason(the_geom),geotxt,cadid,mapnr,'the_geom','hitbgt' from hitbgt where st_isvalid(the_geom)=false;

-- Other bgt null geom check
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'Null-Geom','Found null value in geom field',null,cadid,mapnr,'the_geom','hitbgtoth' from hitbgtoth where the_geom is null;

-- Other bgt invalid geom check
Insert into errorinfo(err_code,err_desc,err_value,cadid,mapnr,fieldname,tablename)
Select 'Invalid-Geom',st_isvalidreason(the_geom),geotxt,cadid,mapnr,'the_geom','hitbgtoth' from hitbgtoth where st_isvalid(the_geom)=false;                
    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION func_insert_errorinfo()
  OWNER TO "AOXX";
  
-- Function: fn_hitgv_tooltip(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION fn_hitgv_tooltip(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

---------------------------------
-- Replaced by Monowar (17.06.16)
---------------------------------
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
  
  


-- Function: fn_hitothgv_tooltip(character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION fn_hitothgv_tooltip(character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION fn_hitothgv_tooltip(
    bgttype character varying,
    bgtid character varying,
    bgtgvt character varying,
    rfunc character varying,
    otype character varying,
    bagid character varying,
    talud character varying)
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
		Select description into rtype_desc from bgtothdomain where code = rfunc limit 1;
		IF rtype_desc is null or rtype_desc = '' THEN
			rtype_desc = '-';
				
		END IF;	
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'R-Func:   ' || rtype_desc;
	END IF;
	
	-- otype
	IF bgttype <> '-' AND bgttype <> 'PND' THEN
		Select description into otype_desc from bgtothdomain d where d.code = otype and d.bgttype =  $1 limit 1;
		IF otype_desc is null or otype_desc = '' THEN
			otype_desc = '-';
				
		END IF;	
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'O-Type:   ' || otype_desc;
	END IF;


	-- bagid
	IF bgttype = 'PND' THEN
		tooltip = tooltip || '\n';
		tooltip = tooltip || 'BAG-Id:   ' || bagid;
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
ALTER FUNCTION fn_hitothgv_tooltip(character varying, character varying, character varying, character varying, character varying, character varying, character varying)
  OWNER TO "AOXX";
  
  
-- Function: func_update_streetname(boolean)

-- DROP FUNCTION func_update_streetname(boolean);

CREATE OR REPLACE FUNCTION func_update_streetname(override_all boolean)
  RETURNS boolean AS
$BODY$
BEGIN
   	 
    
    BEGIN
		 IF ( override_all = true ) THEN
			truncate table hitorl_bag;
			Insert into hitorl_bag(cadid,gbkn_name,opr_id,bag_name,update_code,update_description,x,y,woonplaats)
				Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '1' end,
				case when obr.naam is null then '' else 'Full Matching' end ,orl.x,orl.y,orl.woonplaats from (
				Select hitbgtORL.*,wp.naam as woonplaats from (
				Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
				hitbgtORL
				JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
				left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and obr.naam = orl.gbkn_name;
				
		Else
			delete from hitorl_bag where update_code <> 'M';
			-- Full Matching -> 1
			Insert into hitorl_bag(cadid,gbkn_name,opr_id,bag_name,update_code,update_description,x,y,woonplaats)
				Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '1' end,
				case when obr.naam is null then '' else 'Full Matching' end ,orl.x,orl.y,orl.woonplaats from (
				Select hitbgtORL.*,wp.naam as woonplaats from (
				Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
				hitbgtORL
				JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
				left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and obr.naam = orl.gbkn_name
				Where orl.cadid not in (Select cadid from hitorl_bag);
		End If;
		
		

		-- Uppercase Matching -> 2
		Update hitorl_bag hb
		Set gbkn_name = orltmp.gbkn_name, opr_id = orltmp.opr_id,bag_name = orltmp.bag_name,update_code = orltmp.upd_code,update_description = orltmp.upd_desc,x=orltmp.x,y=orltmp.y,woonplaats=orltmp.woonplaats
		from (
                        Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '2' end as upd_code,
			case when obr.naam is null then '' else 'Uppercase Matching' end as upd_desc,orl.x,orl.y,orl.woonplaats from (
                        Select hitbgtORL.*,wp.naam as woonplaats from (
                        Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
                        hitbgtORL
                        JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
                        left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and   upper(obr.naam) = upper(orl.gbkn_name)
                        ) orltmp
                        Where  hb.cadid = orltmp.cadid and hb.cadid in (Select cadid from hitorl_bag where update_code = '0');

		
		-- Removing space, - and Replace ij by y,ck by k, tz by z, ëéèê by e äáàâ by a, öòóô ïíìi ûüúù ç at both sides, space by dot -> 3
		Update hitorl_bag hb
		Set gbkn_name = orltmp.gbkn_name, opr_id = orltmp.opr_id,bag_name = orltmp.bag_name,update_code = orltmp.upd_code,update_description = orltmp.upd_desc,x=orltmp.x,y=orltmp.y,woonplaats=orltmp.woonplaats
		from (
                        Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '3' end as upd_code,
			case when obr.naam is null then '' else 'removing space and - and replace ij by y, ëéèê by e äáàâ by a, öòóô ïíìi ûüúù ç at both sides, space by dot' end as upd_desc,orl.x,orl.y,orl.woonplaats from (
                        Select hitbgtORL.*,wp.naam as woonplaats from (
                        Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
                        hitbgtORL
                        JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
                        left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and (
			translate(lower(obr.naam),' -''','') = translate(lower(orl.gbkn_name),' -''','') OR
			replace(lower(obr.naam),'ij','y') = replace(lower(orl.gbkn_name),'ij','y') OR
                        replace(lower(obr.naam),'ck','k') = replace(lower(orl.gbkn_name),'ck','k') OR
			replace(lower(obr.naam),'tz','z') = replace(lower(orl.gbkn_name),'tz','z') OR
			translate(lower(obr.naam),'ëéèêäáàâöòóôûüúùïíìîç','eeeeaaaaoooouuuuiiiic') = translate(lower(orl.gbkn_name),'ëéèêäáàâöòóôûüúùïíìîç','eeeeaaaaoooouuuuiiiic')  OR
                        replace(lower(obr.naam),' ','.') = replace(lower(orl.gbkn_name),' ','.'))			
			
			) orltmp
                       Where  hb.cadid = orltmp.cadid and hb.cadid in (Select cadid from hitorl_bag where update_code = '0');


		-- Expand startchar -> 4
		Update hitorl_bag hb
		Set gbkn_name = orltmp.gbkn_name, opr_id = orltmp.opr_id,bag_name = orltmp.bag_name,update_code = orltmp.upd_code,update_description = orltmp.upd_desc,x=orltmp.x,y=orltmp.y,woonplaats=orltmp.woonplaats
		from (
                        Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '4' end as upd_code,
			case when obr.naam is null then '' else 'expand startchar burg.-> burgemeester, St.->sint, Kon. -> Koningin, Pres. -> President, Pr -> Prins' end as upd_desc,orl.x,orl.y,orl.woonplaats from (
                        Select hitbgtORL.*,wp.naam as woonplaats from (
                        Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
                        hitbgtORL
                        JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
                        left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and  (
                        translate(replace(lower(obr.naam),'burg.','burgemeester'),' ','') = translate(replace(lower(orl.gbkn_name),'burg.','burgemeester'),' ','') OR
                        translate(replace(lower(obr.naam),'st.','sint'),' ','') = translate(replace(lower(orl.gbkn_name),'st.','sint'),' ','') OR
			translate(replace(lower(obr.naam),'kon.','koningin'),' ','') = translate(replace(lower(orl.gbkn_name),'kon.','koningin'),' ','') OR
			translate(replace(lower(obr.naam),'kon ','koningin'),' ','') = translate(replace(lower(orl.gbkn_name),'kon ','koningin'),' ','') OR
			translate(replace(lower(obr.naam),'pres.','president'),' ','') = translate(replace(lower(orl.gbkn_name),'pres.','president'),' ','') OR
			translate(replace(lower(obr.naam),'pr.','prins'),' ','') = translate(replace(lower(orl.gbkn_name),'pr.','prins'),' ','')) 
			) orltmp
                        Where  hb.cadid = orltmp.cadid and hb.cadid in (Select cadid from hitorl_bag where update_code = '0');

		-- Expand endchar -> 5
		Update hitorl_bag hb
		Set gbkn_name = orltmp.gbkn_name, opr_id = orltmp.opr_id,bag_name = orltmp.bag_name,update_code = orltmp.upd_code,update_description = orltmp.upd_desc,x=orltmp.x,y=orltmp.y,woonplaats=orltmp.woonplaats
		from (
                        Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '5' end as upd_code,
			case when obr.naam is null then '' else  'expand endchars str -> straat, ln->laan' end as upd_desc,orl.x,orl.y,orl.woonplaats from (
                        Select hitbgtORL.*,wp.naam as woonplaats from (
                        Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
                        hitbgtORL
                        JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
                        left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and  (
                        
			((lower(obr.naam) like '%str' OR lower(orl.gbkn_name) like '%str')  and (translate(replace(lower(obr.naam),'str','straat'),' ','') = translate(replace(lower(orl.gbkn_name),'str','straat'),' ',''))) OR
			((lower(obr.naam) like '%ln' OR lower(orl.gbkn_name) like '%ln') and (translate(replace(lower(obr.naam),'ln','laan'),' ','') = translate(replace(lower(orl.gbkn_name),'ln','laan'),' ','')))) 
			) orltmp
                        Where  hb.cadid = orltmp.cadid and hb.cadid in (Select cadid from hitorl_bag where update_code = '0');

		-- Removing particular substring -> 6
		Update hitorl_bag hb
		Set gbkn_name = orltmp.gbkn_name, opr_id = orltmp.opr_id,bag_name = orltmp.bag_name,update_code = orltmp.upd_code,update_description = orltmp.upd_desc,x=orltmp.x,y=orltmp.y,woonplaats=orltmp.woonplaats
		from (
                        Select distinct on (orl.cadid) orl.cadid,orl.gbkn_name,obr.opr_id,obr.naam as bag_name,case when obr.naam is null then '0' else '6' end as upd_code,
			case when obr.naam is null then '' else  'remove van. de. v/d. der.  v. d. ten. at both sides' end as upd_desc,orl.x,orl.y,orl.woonplaats from (
                        Select hitbgtORL.*,wp.naam as woonplaats from (
                        Select cadid,x,y ,name as gbkn_name from hitbgtoth where bgttype = 'ORL')
                        hitbgtORL
                        JOIN  woonplaatsen wp on st_within(st_geomfromtext('POINT(' || hitbgtORL.x || ' ' || hitbgtORL.y || ')',28992), wp.wkb_geometry) ) orl
                        left join openbareruimte obr on lower(obr.woonplaats) = lower(orl.woonplaats) and  
			replace(replace(replace(replace(replace(replace(replace(lower(obr.naam),' ten.',''),' van.',''),' de.',''),' v/d.',''),' der.',''),' v.',''),' d.','')=
                        replace(replace(replace(replace(replace(replace(replace(lower(orl.gbkn_name),' ten.',''),' van.',''),' de.',''),' v/d.',''),' der.',''),' v.',''),' d.','')        
			) orltmp
                         Where  hb.cadid = orltmp.cadid and hb.cadid in (Select cadid from hitorl_bag where update_code = '0');

	EXCEPTION WHEN OTHERS THEN
		return false;
    END;	             
    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION func_update_streetname(boolean)
  OWNER TO "AOXX";

 
---------- ####  -------------------------------  April 08, 2016  -------------------------------------------------------------------

-- Function: fn_create_bgtid_revision(character varying)

-- DROP FUNCTION fn_create_bgtid_revision(character varying);

-- Replaced by Monowar (06.06.16)
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
  
-- Function: fn_create_missing_pbp(character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION fn_create_missing_pbp(character varying, character varying, character varying, character varying, character varying, character varying);

-- Replaced by Monowar (06.06.16)
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
  
  
-- Function: fn_create_tmp_missing_pbp()

-- DROP FUNCTION fn_create_tmp_missing_pbp();

-- Replaced by Monowar (06.06.16)
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