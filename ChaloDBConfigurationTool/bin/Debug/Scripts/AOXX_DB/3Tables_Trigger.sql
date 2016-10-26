
  
----------------------------------------------------------------------------------TRIGGERS-----------------------------------------------------------------------
/*

DROP TRIGGER orgpbp_changed ON orgpbp;
 DROP TRIGGER hitbgt_changed ON hitbgt;
 DROP TRIGGER hitbgtoth_changed ON hitbgtoth;
 DROP TRIGGER hitcityarea_changed ON hitcityarea;
DROP TRIGGER hitmov_changed ON hitmov;
 DROP TRIGGER hitpinpoints_changed ON hitpinpoints;

DROP FUNCTION hitbgt_autofldupdate();
 DROP FUNCTION hitpinpoints_autofldupdate();
 DROP FUNCTION hitbgtoth_autofldupdate();
DROP FUNCTION orgpbp_autofldupdate();
DROP FUNCTION hitmov_autofldupdate();
DROP FUNCTION hitcityarea_autofldupdate();

DROP FUNCTION hitpbp_xyupdate();
DROP FUNCTION hitbgt_publish_tranferpublishdate();
DROP FUNCTION hitbgtoth_publish_tranferpublishdate();
*/

-- Function: orgpbp_autofldupdate()
CREATE OR REPLACE FUNCTION orgpbp_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.x  IS NOT NULL and NEW.y IS NOT NULL THEN
		Update orgpbp set the_geom = St_GeomFromText('POINT('|| x || ' ' || y ||')',28992) Where id = NEW.id;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION orgpbp_autofldupdate()
  OWNER TO "AOXX";
  -- Trigger: orgpbp_changed on orgpbp



CREATE TRIGGER orgpbp_changed
  AFTER INSERT OR UPDATE OF x,y
  ON orgpbp
  FOR EACH ROW
  EXECUTE PROCEDURE orgpbp_autofldupdate();
  
-- Function: hitbgt_autofldupdate()

CREATE OR REPLACE FUNCTION hitbgt_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.geotxt IS NOT NULL  THEN
		Update hitbgt set the_geom = St_curvetoline(St_GeomFromText(geotxt,28992)) Where cadid = NEW.cadid;
		Update hitbgt set 
		geomarea = St_Area(the_geom),
		nrpoints = ST_NPoints(st_geomfromtext(geotxt)), 
		nrrings = (Select sum(numInteriors)+count(*) as nrrings from ( Select ST_NumInteriorRings(ST_GeometryN (the_geom,  generate_series(1,ST_NumGeometries(the_geom)))) as numInteriors ) totalringcounts) 
		Where cadid = NEW.cadid;
	END IF;
	EXCEPTION WHEN OTHERS THEN
		Update hitbgt set the_geom = null,
		geomarea = 0,
		nrpoints = 0, 
		nrrings =0 Where cadid = NEW.cadid;
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitbgt_autofldupdate()
  OWNER TO "AOXX";
  
-- Trigger: hitbgt_changed on hitbgt

CREATE TRIGGER hitbgt_changed
  AFTER INSERT OR UPDATE OF geotxt
  ON hitbgt
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgt_autofldupdate();


-- Function: hitbgtoth_autofldupdate()


CREATE OR REPLACE FUNCTION hitbgtoth_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	
	IF NEW.x IS NOT NULL And NEW.y IS NOT NULL THEN
		Update hitbgtoth set the_geom = St_GeomFromText('Point('|| NEW.x || ' ' || NEW.y ||')',28992) Where cadid = NEW.cadid and lower(NEW.geotype) = 'p';
		Update hitbgtoth set 
		nrpoints = 1 Where cadid = NEW.cadid and lower(substring(NEW.geotype from 1 for 1)) = 'p';
		
	END IF;

	IF NEW.geotxt IS NOT NULL  THEN
		Update hitbgtoth set the_geom = St_Curvetoline(St_GeomFromText(geotxt,28992)) Where cadid = NEW.cadid and lower(NEW.geotype) <> 'p';
		

		Update hitbgtoth set 
		geomarea = St_Area(the_geom),
		nrpoints = ST_NPoints(st_geomfromtext(geotxt)), 
		nrrings = (Select sum(numInteriors)+count(*) as nrrings from ( Select ST_NumInteriorRings(ST_GeometryN (the_geom,  generate_series(1,ST_NumGeometries(the_geom)))) as numInteriors ) totalringcounts) 
		Where cadid = NEW.cadid and  lower(substring(NEW.geotype from 1 for 1)) = 'v';

		Update hitbgtoth set 
		nrpoints = ST_NPoints(st_geomfromtext(geotxt,28992))
		Where cadid = NEW.cadid and  lower(substring(NEW.geotype from 1 for 1)) = 'l';
		
		Update hitbgtoth set the_geom = St_GeomFromText(geotxt,28992) Where cadid = NEW.cadid and lower(substring(NEW.geotype from 1 for 1)) = 'p';
		Update hitbgtoth set nrpoints = ST_NPoints(st_geomfromtext(geotxt,28992)) Where cadid = NEW.cadid and lower(substring(NEW.geotype from 1 for 1)) = 'p';

	END IF;
	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitbgtoth_autofldupdate()
  OWNER TO "AOXX";
  
-- Trigger: hitbgtoth_changed on hitbgtoth


CREATE TRIGGER hitbgtoth_changed
  AFTER INSERT OR UPDATE OF x, y, geotxt
  ON hitbgtoth
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgtoth_autofldupdate();

-- Function: hitpbp_xyupdate()
CREATE OR REPLACE FUNCTION hitpbp_xyupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF (NEW.x IS NOT NULL And NEW.y IS NOT NULL) THEN
		Update hitpbp Set xy = round((NEW.x ::numeric),3)::text||round(NEW.y::numeric,3)::text;
	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitpbp_xyupdate()
  OWNER TO "AOXX";

-- Trigger: hitpbp_changed on hitpbp
 CREATE TRIGGER hitpbp_changed
  AFTER INSERT OR UPDATE OF x, y
  ON hitpbp
  FOR EACH ROW
  EXECUTE PROCEDURE hitpbp_xyupdate();
  ALTER TABLE hitpbp DISABLE TRIGGER hitpbp_changed;

-- Function: hitbgt_publish_tranferpublishdate()

CREATE OR REPLACE FUNCTION hitbgt_publish_tranferpublishdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.publication_date IS NOT NULL  THEN
		Update hitbgt_publish set prevpublication_date = OLD.publication_date Where bgtid = NEW.bgtid and pub_code = NEW.pub_code;

	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitbgt_publish_tranferpublishdate()
  OWNER TO "AOXX";
  
-- Trigger   hitbgt_publish_updated on hitbgt_publish;
CREATE TRIGGER hitbgt_publish_updated
  AFTER UPDATE OF publication_date
  ON hitbgt_publish
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgt_publish_tranferpublishdate();

-- Function: hitbgtoth_publish_tranferpublishdate()
CREATE OR REPLACE FUNCTION hitbgtoth_publish_tranferpublishdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.publication_date IS NOT NULL  THEN
		Update hitbgtoth_publish set prevpublication_date = OLD.publication_date Where bgtid = NEW.bgtid and pub_code = NEW.pub_code;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitbgtoth_publish_tranferpublishdate()
  OWNER TO "AOXX";
  
-- Trigger   hitbgtoth_publish_updated on hitbgtoth_publish;
CREATE TRIGGER hitbgtoth_publish_updated
  AFTER UPDATE OF publication_date
  ON hitbgtoth_publish
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgtoth_publish_tranferpublishdate();

-- Function: hitcityarea_autofldupdate()


CREATE OR REPLACE FUNCTION hitcityarea_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	 BEGIN
	IF NEW.geotxtlin IS NOT NULL  THEN
		Update hitcityarea set the_geom = St_GeomFromText(geotxtlin,28992) Where cadid = NEW.cadid;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitcityarea_autofldupdate()
  OWNER TO "AOXX";
-- Trigger: hitcityarea_changed on hitcityarea



CREATE TRIGGER hitcityarea_changed
  AFTER INSERT OR UPDATE OF geotxtlin
  ON hitcityarea
  FOR EACH ROW
  EXECUTE PROCEDURE hitcityarea_autofldupdate();




-- Function: hitmov_autofldupdate()



CREATE OR REPLACE FUNCTION hitmov_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	BEGIN
	IF NEW.geotxtlin IS NOT NULL  THEN
		Update hitmov set the_geom = St_GeomFromText(geotxtlin,28992) Where cadid = NEW.cadid;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitmov_autofldupdate()
  OWNER TO "AOXX";
-- Trigger: hitmov_changed on hitmov



CREATE TRIGGER hitmov_changed
  AFTER INSERT OR UPDATE OF geotxtlin
  ON hitmov
  FOR EACH ROW
  EXECUTE PROCEDURE hitmov_autofldupdate();

-- Function: hitpinpoints_autofldupdate()



CREATE OR REPLACE FUNCTION hitpinpoints_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	 BEGIN
	IF (NEW.x IS NOT NULL And NEW.y IS NOT NULL) THEN
		Update hitpinpoints set the_geom = St_GeomFromText('Point('|| NEW.x || ' ' || NEW.y ||')') Where cadid = NEW.cadid ;
			
	END IF;
	EXCEPTION WHEN OTHERS THEN
	END;	
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION hitpinpoints_autofldupdate()
  OWNER TO "AOXX";
  
-- Trigger: hitpinpoints_changed on hitpinpoints



CREATE TRIGGER hitpinpoints_changed
  AFTER INSERT OR UPDATE OF x,y
  ON hitpinpoints
  FOR EACH ROW
  EXECUTE PROCEDURE hitpinpoints_autofldupdate();


  
  


 

  





 
------------------------------------------------------------------- Functions ---------------------  
  
-- Function: bgtpinpoint_autofldupdate()

-- DROP FUNCTION bgtpinpoint_autofldupdate();

CREATE OR REPLACE FUNCTION bgtpinpoint_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	 BEGIN
	IF NEW.x IS NOT NULL And NEW.y IS NOT NULL THEN
		Update bgt_pinpoints set the_geom = St_GeomFromText('Point('|| NEW.x || ' ' || NEW.y ||')') Where id = NEW.id and lower(NEW.geotype) = 'p';
				
	END IF;

	IF NEW.geotxt IS NOT NULL  THEN
		Update bgt_pinpoints set the_geom = St_Curvetoline(St_GeomFromText(geotxt,28992)) Where id = NEW.id;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
		Update bgt_pinpoints set the_geom = null
		Where id = NEW.id;
	END;
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION bgtpinpoint_autofldupdate()
  OWNER TO "AOXX";
  
-- Function: bor_mutation_incoming_autofldupdate()

-- DROP FUNCTION bor_mutation_incoming_autofldupdate();

CREATE OR REPLACE FUNCTION bor_mutation_incoming_autofldupdate()
  RETURNS trigger AS
$BODY$
    BEGIN
	 BEGIN
	
	IF NEW.geotxt IS NOT NULL  THEN
		Update bor_mutation_incoming set the_geom = St_Curvetoline(St_GeomFromText(geotxt,28992)) Where id = NEW.id;
		
	END IF;
	EXCEPTION WHEN OTHERS THEN
		Update bor_mutation_incoming set the_geom = null
		Where id = NEW.id;
	END;
        RETURN NULL;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION bor_mutation_incoming_autofldupdate()
  OWNER TO "AOXX";

  

-- Trigger: bgtpinpoint_changed on bgt_pinpoints

-- DROP TRIGGER bgtpinpoint_changed ON bgt_pinpoints;

CREATE TRIGGER bgtpinpoint_changed
  AFTER INSERT OR UPDATE OF x, y, geotxt
  ON bgt_pinpoints
  FOR EACH ROW
  EXECUTE PROCEDURE bgtpinpoint_autofldupdate();
  

-- Trigger: bor_mutation_incoming_changed on bor_mutation_incoming

-- DROP TRIGGER bor_mutation_incoming_changed ON bor_mutation_incoming;

CREATE TRIGGER bor_mutation_incoming_changed
  AFTER INSERT OR UPDATE OF geotxt
  ON bor_mutation_incoming
  FOR EACH ROW
  EXECUTE PROCEDURE bor_mutation_incoming_autofldupdate();
 

 
-- Added by Monowar (06.06.16)
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
  
--Added by Monowar(07.06.16)
CREATE TRIGGER hitbgt_mutation_incoming_changed
  AFTER INSERT OR UPDATE OF geotxt
  ON hitbgt_mutation_incoming
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgt_mutation_incoming_autofldupdate();
  
  
  
 -- Added by Monowar (06.06.16)
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
  
--Added by Monowar(07.06.16)
CREATE TRIGGER hitbgtoth_mutation_incoming_autofldupdate
  AFTER INSERT OR UPDATE OF geotxt
  ON hitbgtoth_mutation_incoming
  FOR EACH ROW
  EXECUTE PROCEDURE hitbgtoth_mutation_incoming_autofldupdate();
