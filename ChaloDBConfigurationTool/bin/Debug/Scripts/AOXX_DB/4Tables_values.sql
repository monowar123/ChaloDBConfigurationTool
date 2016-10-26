  
---------------------------- Changes in this version -------------------------------  
INSERT INTO bgtdb_version(version, version_release_date, changes)
    VALUES 
	('2.4.5', '2015-09-21', 'Version info added as a database comment'),
	('2.4.5', '2015-09-21', 'Version table added'),
	('2.4.5', '2015-09-21', 'New function func_update_streetname added'),
	('2.4.5', '2015-09-21', 'New field (update_description) added in table hitorl_bag'),
	('2.4.5', '2015-09-21', 'Two New functions(fn_hitgv_tooltip,fn_hitothgv_tooltip) added to create tooltip for gis viewer'),
	('2.4.5', '2015-09-21', 'Updated function func_insert_errorinfo(removed KR error checking from hibgtlnk table)'),
	('2.4.5', '2015-09-21', 'BOR objects(tables, views etc..) included'),
    ('2.4.6', '2015-11-03', 'New view v_bag_houserange_info has been added for the new house-range tool'),
	('2.4.8', '2015-12-17', 'GIS viewer database merged'),
	('2.4.8', '2015-12-17', 'hittasks table and a view hittasks_v added'),
	('2.4.8', '2015-12-17', 'Domain based operation activated to connect to specific project'),
	('2.4.8', '2015-12-17', 'User id must be an email id'),
	('2.5.0', '2016-03-15', 'Updated for automatic communication with LV');
------------------------------------------------------------******************************************----------------------------------------------------------------



--------------------------------------------------------------------INSERTS---------------------------------------------------------------------------------  
Truncate measurementmethod;
INSERT INTO measurementmethod(methodcode, method, gbkncode)
VALUES (0, 'transitie', 0), (1 ,'geconstrueerd',null),(2, 'bouwtekening', 5), 
(3, 'scannen', 4), (4, 'digitaliseren', 3), (5, 'panoramabeelden', null), 
(6, 'fotogrammetrisch', 2), (7, 'laser', null), (8, 'terrestrisch', 1);

Truncate default_pbp_info;
INSERT INTO default_pbp_info(layername, layerformat, organization, methodcode, method, prec, date)
VALUES ('default', 'default', 'default_pbp_info_GCXXX', 'default_pbp_info_MCXXX', 'default_pbp_info_MNXXX', 'default_pbp_info_precXXX', 'default_pbp_info_dateXXX');

/* Above query will look like the following after replacing real value
INSERT INTO default_pbp_info(layername, layerformat, organization, methodcode, method, prec, date)
VALUES ('detault', 'detault', 'G0518', 6, 'fotogrammetrisch', 23, '2015-07-28');
*/

INSERT INTO action_mapping( current_actie, next_actie)
    VALUES ( 'Verwerken','Beoordelen'),
	('Beoordelen','Meten'),
	('Beoordelen','Input'),
	('Beoordelen','Verwerken'),
	('Meten','Verwerken'),
	('Input','Beoordelen'),
	('Verwerken','Sluiten'),
	('Beoordelen','Sluiten');
	
INSERT INTO action_settings(actie, actie_process_duration, afdeling)
    VALUES ('Beoordelen','7D','Teamlead'),
		('Input','14D','Gemeente'),
		('Meten','30D','Meetploeg'),
		('Sluiten','1D','-'),
		('Verwerken','21D','Backoffice');

INSERT INTO departments(
             department, email)
    VALUES ('Teamlead','teamlead@hawarit.com'),
('Backoffice','backoffice@hawarit.com'),
('Gemeente','gemeente@hawarit.com'),
('Meetploeg','meetploeg@hawarit.com');


INSERT INTO hittasks_settings(
             taaktype, set_einddatum_in, min_time_inbetween_actie_enddate, 
            actie_day_preference, end_day_preference)
    VALUES ('SIG','LDOQ','10D','Monday','Frieday'),
		   ('PRJ','LDOQ','15D','Monday','Friday'),
		   ('BOR','LDOQ','15D','Monday','Friday');

INSERT INTO bor_beheerder(bgttype , beheerder)
VALUES ('BTD','GR'),('VGO','GR'),('OTD','GR'),('STM','KU'),('KST','O1'),
('OBW','O1'),('PAL','VE'),('OWG','WE'),('WGD','WE'),('WGI','WE');

INSERT INTO bgt_reports(
             name, description, view_name)
    VALUES ('ws_code','showing WS-code and newly assigned BGT-id for all WS-objects','v_ws_code'),
    ('bor_code','showing BOR-link and newly assigned BGT-id for all GVT-objects','v_bore_code'),
    ('ez_ww1','showing EZ-original objects and EZ-BGT-objects (also giving ''disapperaed'' EZ-objects','v_ez_ww1'),
    ('ez_ww2','showing EZ-original objects and EZ-BGT-objects (also giving ''newbuilt'' EZ-objects','v_ez_ww2');
	
Insert into BgtFullDomain(code,description) values( 'BA  ','bassin');
Insert into BgtFullDomain(code,description) values( 'BB  ','bezinkbak');
Insert into BgtFullDomain(code,description) values( 'BE  ','berm');
Insert into BgtFullDomain(code,description) values( 'BH  ','parkeervak');
Insert into BgtFullDomain(code,description) values( 'BL  ','bouwland');
Insert into BgtFullDomain(code,description) values( 'BLAB','bouwland: akkerbouw');
Insert into BgtFullDomain(code,description) values( 'BLBL','bouwland: braakliggend');
Insert into BgtFullDomain(code,description) values( 'BLBT','bouwland: bollenteelt');
Insert into BgtFullDomain(code,description) values( 'BLVT','bouwland: vollegrondsteelt');
Insert into BgtFullDomain(code,description) values( 'BT  ','boomteelt');
Insert into BgtFullDomain(code,description) values( 'DS  ','greppel, droge sloot');
Insert into BgtFullDomain(code,description) values( 'DU  ','duin');
Insert into BgtFullDomain(code,description) values( 'DUG ','duin: gesloten duinvegetatie');
Insert into BgtFullDomain(code,description) values( 'DUO ','duin: open duinvegetatie');
Insert into BgtFullDomain(code,description) values( 'ER  ','erf');
Insert into BgtFullDomain(code,description) values( 'FP  ','fietspad');
Insert into BgtFullDomain(code,description) values( 'FT  ','fruitteelt');
Insert into BgtFullDomain(code,description) values( 'FTHB','fruitteelt: hoogstam boomgaarden');
Insert into BgtFullDomain(code,description) values( 'FTKF','fruitteelt: klein fruit');
Insert into BgtFullDomain(code,description) values( 'FTLB','fruitteelt: laagstam boomgaarden');
Insert into BgtFullDomain(code,description) values( 'FTWG','fruitteelt: wijngaarden');
Insert into BgtFullDomain(code,description) values( 'GA  ','grasland agrarisch');
Insert into BgtFullDomain(code,description) values( 'GB  ','gemengd bos');
Insert into BgtFullDomain(code,description) values( 'GM  ','gemaal');
Insert into BgtFullDomain(code,description) values( 'GO  ','grasland overig');
Insert into BgtFullDomain(code,description) values( 'GR  ','groenvoorziening');
Insert into BgtFullDomain(code,description) values( 'GRBB','groenvoorziening: bodembedekkers');
Insert into BgtFullDomain(code,description) values( 'GRBP','groenvoorziening: bosplantsoen');
Insert into BgtFullDomain(code,description) values( 'GRGK','groenvoorziening: gras- en kruidachtigen');
Insert into BgtFullDomain(code,description) values( 'GRHE','groenvoorziening: heesters');
Insert into BgtFullDomain(code,description) values( 'GRPL','groenvoorziening: planten');
Insert into BgtFullDomain(code,description) values( 'GRSR','groenvoorziening: struikrozen');
Insert into BgtFullDomain(code,description) values( 'GV  ','gesloten verharding');
Insert into BgtFullDomain(code,description) values( 'GVA ','gesloten verharding: asfalt');
Insert into BgtFullDomain(code,description) values( 'GVC ','gesloten verharding: cementbeton');
Insert into BgtFullDomain(code,description) values( 'GVK ','gesloten verharding: kunststof');
Insert into BgtFullDomain(code,description) values( 'HE  ','heide');
Insert into BgtFullDomain(code,description) values( 'HM  ','hoogspanningsmast');
Insert into BgtFullDomain(code,description) values( 'HV  ','half verhard');
Insert into BgtFullDomain(code,description) values( 'HVGK','half verhard: grasklinkers');
Insert into BgtFullDomain(code,description) values( 'HVGR','half verhard: grind');
Insert into BgtFullDomain(code,description) values( 'HVGV','half verhard: gravel');
Insert into BgtFullDomain(code,description) values( 'HVPU','half verhard: puin');
Insert into BgtFullDomain(code,description) values( 'HVSC','half verhard: schelpen');
Insert into BgtFullDomain(code,description) values( 'HW  ','houtwal');
Insert into BgtFullDomain(code,description) values( 'IN  ','inrit');
Insert into BgtFullDomain(code,description) values( 'KG  ','gemaal');
Insert into BgtFullDomain(code,description) values( 'KM  ','kademuur');
Insert into BgtFullDomain(code,description) values( 'KP  ','perron');
Insert into BgtFullDomain(code,description) values( 'KW  ','kwelder');
Insert into BgtFullDomain(code,description) values( 'LB  ','loofbos');
Insert into BgtFullDomain(code,description) values( 'LBX ','loofbos: loofbos');
Insert into BgtFullDomain(code,description) values( 'LEGH','loofbos: griend en hakhout');
Insert into BgtFullDomain(code,description) values( 'LT  ','lage trafo');
Insert into BgtFullDomain(code,description) values( 'MU  ','muur');
Insert into BgtFullDomain(code,description) values( 'MO  ','moeras');
Insert into BgtFullDomain(code,description) values( 'NB  ','naaldbos');
Insert into BgtFullDomain(code,description) values( 'NV  ','onverhard');
Insert into BgtFullDomain(code,description) values( 'NVSC','onverhard: boomschors');
Insert into BgtFullDomain(code,description) values( 'NVZA','onverhard: zand');
Insert into BgtFullDomain(code,description) values( 'NVHG','onverhard:');
Insert into BgtFullDomain(code,description) values( 'NVBG','onverhard:');
Insert into BgtFullDomain(code,description) values( 'NVBS','onverhard:');
Insert into BgtFullDomain(code,description) values( 'OB  ','OV-baan');
Insert into BgtFullDomain(code,description) values( 'OK  ','overkapping');
Insert into BgtFullDomain(code,description) values( 'OL  ','open loods');
Insert into BgtFullDomain(code,description) values( 'OT  ','opslagtank');
Insert into BgtFullDomain(code,description) values( 'OV  ','open verharding');
Insert into BgtFullDomain(code,description) values( 'OVBE','open verharding: beton element');
Insert into BgtFullDomain(code,description) values( 'OVBS','open verharding: betonstraatstenen');
Insert into BgtFullDomain(code,description) values( 'OVGK','open verharding: gebakken klinkers');
Insert into BgtFullDomain(code,description) values( 'OVSB','open verharding: sierbestrating');
Insert into BgtFullDomain(code,description) values( 'OVTG','open verharding: tegels');
Insert into BgtFullDomain(code,description) values( 'OW  ','overweg');
Insert into BgtFullDomain(code,description) values( 'PR  ','perron');
Insert into BgtFullDomain(code,description) values( 'PV  ','parkeervlak');
Insert into BgtFullDomain(code,description) values( 'RH  ','rijbaan autosnelweg');
Insert into BgtFullDomain(code,description) values( 'RHD ','rijbaan autosnelweg: calamiteitendoorsteek');
Insert into BgtFullDomain(code,description) values( 'RHV ','rijbaan autosnelweg: verbindingsweg');
Insert into BgtFullDomain(code,description) values( 'RI  ','rietland');
Insert into BgtFullDomain(code,description) values( 'RL  ','rijbaan lokale weg');
Insert into BgtFullDomain(code,description) values( 'RLD ','rijbaan lokale weg: verkeersdrempel');
Insert into BgtFullDomain(code,description) values( 'RP  ','ruiterpad');
Insert into BgtFullDomain(code,description) values( 'RR  ','rijbaan regionale weg');
Insert into BgtFullDomain(code,description) values( 'RRD ','rijbaan regionale weg: verkeersdrempel');
Insert into BgtFullDomain(code,description) values( 'RRV ','rijbaan regionale weg: verbindingsweg');
Insert into BgtFullDomain(code,description) values( 'RS  ','rijbaan autoweg');
Insert into BgtFullDomain(code,description) values( 'RSD ','rijbaan autoweg: calamiteitendoorsteek');
Insert into BgtFullDomain(code,description) values( 'RSV ','rijbaan autoweg: verbindingsweg');
Insert into BgtFullDomain(code,description) values( 'SD  ','strekdam');
Insert into BgtFullDomain(code,description) values( 'SE  ','steiger');
Insert into BgtFullDomain(code,description) values( 'SK  ','oever, slootkant');
Insert into BgtFullDomain(code,description) values( 'SL  ','slik');
Insert into BgtFullDomain(code,description) values( 'SP  ','spoorbaan');
Insert into BgtFullDomain(code,description) values( 'SS  ','sluis');
Insert into BgtFullDomain(code,description) values( 'ST  ','struiken');
Insert into BgtFullDomain(code,description) values( 'SW  ','stuw');
Insert into BgtFullDomain(code,description) values( 'TR  ','transitie');
Insert into BgtFullDomain(code,description) values( 'TO  ','transitie');
Insert into BgtFullDomain(code,description) values( 'VE  ','verkeerseiland');
Insert into BgtFullDomain(code,description) values( 'VG  ','voetgangersgebied');
Insert into BgtFullDomain(code,description) values( 'VL  ','baan voor vliegverkeer');
Insert into BgtFullDomain(code,description) values( 'VP  ','voetpad');
Insert into BgtFullDomain(code,description) values( 'VT  ','voetpad op trap');
Insert into BgtFullDomain(code,description) values( 'WE  ','woonerf');
Insert into BgtFullDomain(code,description) values( 'WL  ','waterloop');
Insert into BgtFullDomain(code,description) values( 'WLBE','waterloop: beek');
Insert into BgtFullDomain(code,description) values( 'WLBR','waterloop: bron');
Insert into BgtFullDomain(code,description) values( 'WLGR','waterloop: gracht');
Insert into BgtFullDomain(code,description) values( 'WLKN','waterloop: kanaal');
Insert into BgtFullDomain(code,description) values( 'WLRV','waterloop: rivier');
Insert into BgtFullDomain(code,description) values( 'WLSL','waterloop: sloot');
Insert into BgtFullDomain(code,description) values( 'WT  ','windturbine');
Insert into BgtFullDomain(code,description) values( 'WV  ','watervlakte');
Insert into BgtFullDomain(code,description) values( 'WVHA','watervlakte: haven');
Insert into BgtFullDomain(code,description) values( 'WVME','watervlakte: meer, plas, ven, vijver');
Insert into BgtFullDomain(code,description) values( 'XX  ','niet-bgt');
Insert into BgtFullDomain(code,description) values( 'XXBB','niet-bgt: bunker');
Insert into BgtFullDomain(code,description) values( 'XXBS','niet-bgt: schuur');
Insert into BgtFullDomain(code,description) values( 'XXBV','niet-bgt: voedersilo');
Insert into BgtFullDomain(code,description) values( 'XXKB','niet-bgt: bodemval');
Insert into BgtFullDomain(code,description) values( 'XXKC','niet-bgt: coupure');
Insert into BgtFullDomain(code,description) values( 'XXKD','niet-bgt: duiker');
Insert into BgtFullDomain(code,description) values( 'XXKF','niet-bgt: faunavoorziening');
Insert into BgtFullDomain(code,description) values( 'XXKK','niet-bgt: keermuur');
Insert into BgtFullDomain(code,description) values( 'XXKO','niet-bgt: overkluizing');
Insert into BgtFullDomain(code,description) values( 'XXKP','niet-bgt: ponton');
Insert into BgtFullDomain(code,description) values( 'XXKT','niet-bgt: voorde');
Insert into BgtFullDomain(code,description) values( 'XXKV','niet-bgt: vispassage');

Insert into BgtFullDomain(code,description) values( 'XL' ,'landhoofd');
Insert into BgtFullDomain(code,description) values( 'XLB','landhoofd: brug');
Insert into BgtFullDomain(code,description) values( 'XLV','landhoofd: viaduct');
Insert into BgtFullDomain(code,description) values( 'XP' ,'pijler');
Insert into BgtFullDomain(code,description) values( 'XPB','pijler: brug');
Insert into BgtFullDomain(code,description) values( 'XPV','pijler: viaduct');
Insert into BgtFullDomain(code,description) values( 'XS' ,'sloof');
Insert into BgtFullDomain(code,description) values( 'XSB','sloof: brug');
Insert into BgtFullDomain(code,description) values( 'XSV','sloof: viaduct');
Insert into BgtFullDomain(code,description) values( 'XY' ,'pyloon');
Insert into BgtFullDomain(code,description) values( 'XYB','pyloon: brug');
Insert into BgtFullDomain(code,description) values( 'XYV','pyloon: viaduct');

Insert into BgtFullDomain(code,description) values( 'ZA  ','zand');
Insert into BgtFullDomain(code,description) values( 'ZAS ','zand: strand en strandwal');
Insert into BgtFullDomain(code,description) values( 'ZAV ','zand: zandverstuiving');
Insert into BgtFullDomain(code,description) values( 'ZE  ','zee');

update BgtFullDomain set code = rtrim(code);

delete from bgtothdomain;
insert into bgtothdomain(bgttype,code,geotype,description) values('BAK','AAP','p','niet-bgt: afval apart plaats');
insert into bgtothdomain(bgttype,code,geotype,description) values('BAK','AFV','p','niet-bgt: afvalbak');
insert into bgtothdomain(bgttype,code,geotype,description) values('BAK','DRB','p','niet-bgt: drinkbak');
insert into bgtothdomain(bgttype,code,geotype,description) values('BAK','BLB','p','niet-bgt: bloembak');
insert into bgtothdomain(bgttype,code,geotype,description) values('BAK','ZZB','p','niet-bgt: zand- / zoutbak');
insert into bgtothdomain(bgttype,code,geotype,description) values('BAK','CON','p','niet-bgt: container');

insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','INF','p','niet-bgt: informatiebord');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','PLN','p','niet-bgt: plaatsnaambord');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','STR','p','niet-bgt: straatnaambord');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','VER','p','niet-bgt: verkeersbord');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','SCH','p','niet-bgt: scheepvaartbord');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','TRL','p','niet-bgt: verklikker transportleiding');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','RCL','p','niet-bgt: reclamebord');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','WWB','p','niet-bgt: wegwijzer');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','WSH','p','niet-bgt: waarschuwingshek');
insert into bgtothdomain(bgttype,code,geotype,description) values('BRD','DSI','p','niet-bgt: dynamische snelheidsindicator');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','KR','v','kering');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XX','v','niet-bgt');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXBD','v','niet-bgt: bedrijvigheid');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXNL','v','niet-bgt: natuur en landschap');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXLB','v','niet-bgt: landbouw');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXBW','v','niet-bgt: bewoning');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXIS','v','niet-bgt: infrastructuur verkeer en vervoer');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXWB','v','niet-bgt: waterbergingsgebied');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXMP','v','niet-bgt: maatschappelijke en/of publieksvoorziening');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXRC','v','niet-bgt: recreatie');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXBG','v','niet-bgt: begraafplaats');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXFB','v','niet-bgt: functioneel beheer');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXHU','v','niet-bgt: functioneel beheer: hondenuitlaatplaats');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXST','v','niet-bgt: recreatie: speeltuin');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXPR','v','niet-bgt: recreatie: park');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXSP','v','niet-bgt: recreatie: sportterrein');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXCM','v','niet-bgt: recreatie: camping');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXBP','v','niet-bgt: recreatie: bungalowpark');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXVT','v','niet-bgt: recreatie: volkstuin');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXBH','v','niet-bgt: bushalte');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXCP','v','niet-bgt: carpoolplaats');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXBS','v','niet-bgt: benzinestation');
insert into bgtothdomain(bgttype,code,geotype,description) values('FUG','XXVP','v','niet-bgt: verzorgingsplaats');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('GBI','BOR','v','niet-bgt: bordes');
insert into bgtothdomain(bgttype,code,geotype,description) values('GBI','LFL','v','niet-bgt: luifel');
insert into bgtothdomain(bgttype,code,geotype,description) values('GBI','TGT','v','niet-bgt: toegangstrap');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('INS','XX' ,'p','niet-bgt');
insert into bgtothdomain(bgttype,code,geotype,description) values('INS','PMP','p','niet-bgt: pomp');
insert into bgtothdomain(bgttype,code,geotype,description) values('INS','ZPN','p','niet-bgt: zonnepaneel');

insert into bgtothdomain(bgttype,code,geotype,description) values('KST','CAI','p','niet-bgt: CAI-kast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','ELE','p','niet-bgt: elektrakast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','GAS','p','niet-bgt: gaskast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','TLC','p','niet-bgt: telecom kast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','RIO','p','niet-bgt: rioolkast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','OVL','p','niet-bgt: openbare verlichtingkast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','VRI','p','niet-bgt: verkeersregelinstallatiekast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','TEL','p','niet-bgt: telkast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KST','GMS','p','niet-bgt: GMS kast');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('KWD','XXKK','l','niet-bgt: keermuur');
insert into bgtothdomain(bgttype,code,geotype,description) values('KWD','XXKD','l','niet-bgt: duiker');
insert into bgtothdomain(bgttype,code,geotype,description) values('KWD','SE'  ,'v','steiger'); 
insert into bgtothdomain(bgttype,code,geotype,description) values('KWD','HM'  ,'p','hoogspanningsmast');
insert into bgtothdomain(bgttype,code,geotype,description) values('KWD','SD'  ,'l','strekdam');  
insert into bgtothdomain(bgttype,code,geotype,description) values('KWD','SW'  ,'v','stuw');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('MST','XX' ,'p','niet-bgt');
insert into bgtothdomain(bgttype,code,geotype,description) values('MST','BVL','p','niet-bgt: bovenleidingmast');
insert into bgtothdomain(bgttype,code,geotype,description) values('MST','LSP','p','niet-bgt: laagspanningsmast');
insert into bgtothdomain(bgttype,code,geotype,description) values('MST','STZ','p','niet-bgt: straalzender');
insert into bgtothdomain(bgttype,code,geotype,description) values('MST','ZND','p','niet-bgt: zendmast');
insert into bgtothdomain(bgttype,code,geotype,description) values('MST','RDR','p','niet-bgt: radarmast');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('OBD','XX'  ,'v','');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBD','BRUG','v','brug');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBD','AQUD','v','aquaduct');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBD','VIAD','v','viaduct');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBD','ECOD','v','ecoduct');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBD','FLYO','v','fly-over');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('OBW','OK'  ,'v','overkapping');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBW','XX'  ,'v','niet-bgt');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBW','XXBB','v','niet-bgt: bunker');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBW','XXBS','v','niet-bgt: schuur');
insert into bgtothdomain(bgttype,code,geotype,description) values('OBW','XXBV','v','niet-bgt: voedersilo');

insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','LPL','p','niet-bgt: lichtmast');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','TEL','p','niet-bgt: telpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','POR','p','niet-bgt: portaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','VRI','p','niet-bgt: verkeersregelinstallatiepaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','VER','p','niet-bgt: verkeersbordpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','POL','p','niet-bgt: poller');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','HLT','p','niet-bgt: haltepaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','VLM','p','niet-bgt: vlaggenmast');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','ASL','p','niet-bgt: afsluitpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','PRP','p','niet-bgt: praatpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','HMP','p','niet-bgt: hectometerpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','DYK','p','niet-bgt: dijkpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','DKP','p','niet-bgt: drukknoppaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','GRS','p','niet-bgt: grensmarkering');
insert into bgtothdomain(bgttype,code,geotype,description) values('PAL','SIR','p','niet-bgt: sirene');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','BZO','p','niet-bgt: benzine- / olieput');
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','BKR','p','niet-bgt: brandkraan / -put');
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','DRN','p','niet-bgt: drainageput');
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','GAS','p','niet-bgt: gasput');
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','IRI','p','niet-bgt: inspectie- / rioolput');
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','KLK','p','niet-bgt: kolk');
insert into bgtothdomain(bgttype,code,geotype,description) values('PUT','WTR','p','niet-bgt: waterleidingput');
 
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','MU','l','muur');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','KM','l','kademuur');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','DW','l','damwand');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','GS','l','geluidsscherm');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','WB','l','walbescherming');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','HK','l','hek');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','XX','l','niet-bgt');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','XXDR','l','niet-bgt: draadraster');
insert into bgtothdomain(bgttype,code,geotype,description) values('SHD','XXFR','l','niet-bgt: faunaraster');

insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','MU','l','muur');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','KM','l','kademuur');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','DW','l','damwand');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','GS','l','geluidsscherm');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','WB','l','walbescherming');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','HK','l','hek');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','DR','l','draadraster');
insert into bgtothdomain(bgttype,code,geotype,description) values('OSH','FR','l','faunaraster');


 
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','CAM','p','niet-bgt: camera');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','DBT','p','niet-bgt: debietmeter');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','HGT','p','niet-bgt: hoogtedetectieapparaat');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','LUS','l','niet-bgt: detectielus');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','WRS','p','niet-bgt: weerstation');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','FLI','p','niet-bgt: flitser');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','WTS','p','niet-bgt: waterstandmeter');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','WND','p','niet-bgt: windmeter');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','CEL','p','niet-bgt: lichtcel');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','GMS','p','niet-bgt: GMS sensor');
insert into bgtothdomain(bgttype,code,geotype,description) values('SNS','RDR','p','niet-bgt: radar detector');

insert into bgtothdomain(bgttype,code,geotype,description) values('SPR','TR','l','trein');
insert into bgtothdomain(bgttype,code,geotype,description) values('SPR','SM','l','sneltram');
insert into bgtothdomain(bgttype,code,geotype,description) values('SPR','TM','l','tram');
insert into bgtothdomain(bgttype,code,geotype,description) values('SPR','XX','l','niet-bgt');
insert into bgtothdomain(bgttype,code,geotype,description) values('SPR','XXHK','l','niet-bgt: (haven)kraan');

insert into bgtothdomain(bgttype,code,geotype,description) values('STM','ABR','p','niet-bgt: abri');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','BLD','p','niet-bgt: bolder');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','BRV','p','niet-bgt: brievenbus');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','FTS','p','niet-bgt: fietsenrek');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','KST','p','niet-bgt: kunstobject');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','TOI','p','niet-bgt: openbaar toilet');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','SLG','p','niet-bgt: slagboom');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','SPL','p','niet-bgt: speelvoorziening');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','TEL','p','niet-bgt: telefooncel');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','BNK','p','niet-bgt: bank');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','TAF','p','niet-bgt: picknicktafel');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','FNT','p','niet-bgt: fontein');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','LPT','p','niet-bgt: lichtpunt');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','PBG','p','niet-bgt: parkeerbeugel');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','BTM','p','niet-bgt: betaalautomaat');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','RCL','p','niet-bgt: reclamezuil');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','FKL','p','niet-bgt: fietsenkluis');
insert into bgtothdomain(bgttype,code,geotype,description) values('STM','MEM','p','niet-bgt: herdenkingsmonument');

insert into bgtothdomain(bgttype,code,geotype,description) values('TND','TND','v','tunneldeel');

insert into bgtothdomain(bgttype,code,geotype,description) values('VGO','BM','p','niet-bgt: boom');
insert into bgtothdomain(bgttype,code,geotype,description) values('VGO','HG','lv','niet-bgt: haag');

insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','MOL','l'  ,'niet-bgt: molgoot');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','AFW','l'  ,'niet-bgt: lijnafwatering');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','MRK','plv','niet-bgt: wegmarkering');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','WLD','plv','niet-bgt: wildrooster');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','RST','plv','niet-bgt: rooster');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','GLC','plv','niet-bgt: geleideconstructie');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','BLS','l'  ,'niet-bgt: balustrade');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','BSP','pv' ,'niet-bgt: boomspiegel');
insert into bgtothdomain(bgttype,code,geotype,description) values('WGI','VBL','l'  ,'niet-bgt: verblindingswering');

insert into bgtothdomain(bgttype,code,geotype,description) values('WTI','REM','l','niet-bgt: remmingswerk');
insert into bgtothdomain(bgttype,code,geotype,description) values('WTI','BTN','p','niet-bgt: betonning');
insert into bgtothdomain(bgttype,code,geotype,description) values('WTI','GLW','l','niet-bgt: geleidewerk');
insert into bgtothdomain(bgttype,code,geotype,description) values('WTI','VLV','l','niet-bgt: vuilvang');
insert into bgtothdomain(bgttype,code,geotype,description) values('WTI','MRP','p','niet-bgt: meerpaal');
insert into bgtothdomain(bgttype,code,geotype,description) values('WTI','HGT','p','niet-bgt: hoogtemerk');

insert into bgtothdomain(bgttype,code,geotype,description) values('ORL','WEG','p','Weg');
insert into bgtothdomain(bgttype,code,geotype,description) values('ORL','WTR','p','Water');
insert into bgtothdomain(bgttype,code,geotype,description) values('ORL','SPR','p','Spoorbaan');
insert into bgtothdomain(bgttype,code,geotype,description) values('ORL','TRN','p','Terrein');
insert into bgtothdomain(bgttype,code,geotype,description) values('ORL','KWK','p','Kunstwerk');


--Added by Monowar(07.06.16) (26.09.16)
--INSERT into bgtdomains table
truncate table bgtdomains;

insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','BA','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','BB','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','LT','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','OK','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','OL','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','OT','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','PA','PND');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','TR','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','WT','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('BTYPE','XXBS','OBW');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','GM','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','HM','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','KM','SHD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','MU','SHD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','SD','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','SE','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','SS','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','SW','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','TO','SHD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','TR','KWD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XLB','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XLV','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XL','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XP','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XPB','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XPV','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XS','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XSB','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XSV','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XY','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XYB','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','XYV','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','ER','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','GV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','HV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','NV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','OVBS','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','OVTG','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','ZA','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','BE','OWG');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','FP','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','IN','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','OB','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','OW','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','PV','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','RL','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','RLD','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','RP','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','RR','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','RRD','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','RRV','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','SP','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','VE','OWG');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','VG','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','VL','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','VP','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','VT','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','WE','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GR','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRBB','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRBP','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRGK','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRHE','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRPL','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRSR','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GRXX','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','TR','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','TO','OWG');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','ZA','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','OVTG','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','OVSB','- ');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','OVGK','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','OVBE','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GV','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GVA','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GVC','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','GVK','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HV','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HVGK','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HVGR','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HVGV','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HVPU','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HVSC','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','HVXX','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','NV','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','NVBS','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','NVHG','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','NVZA','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','OV','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','OVBS','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','DU','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','ER','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GA','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GB','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GO','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRBB','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRBP','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRGK','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRHE','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRPL','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRSR','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GRXX','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GVA','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HE','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GVC','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HW','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','KW','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','LB','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','MO','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NB','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OVBS','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OVTG','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','RI','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','ST','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','TO','OBD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','TR','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','ZA','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','DS','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','SK','OWT');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','SL','OWT');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','TO','OWT');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','TR','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WLGR','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WLKN','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WLRV','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WLSL','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WVHA','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WVME','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','BL','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','GRGK','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','OV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('PTYPE','TR','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','PVBH','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','BH','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','FT','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GR','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','GVK','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HVXX','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HVSC','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HVPU','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HVGV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HVGR','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','HVGK','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NVBG','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NVBS','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NVHG','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NVSC','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','NVZA','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OCO','OCO');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OV','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OVBE','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OVGK','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','OVSB','OTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WL','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','WV','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('WTYPE','ZE','WTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','BT','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('RTYPE','TO','-');
insert into bgtdomains (dname,bgtcode,bgttype) values('RFUNC','TR','WGD');
insert into bgtdomains (dname,bgtcode,bgttype) values('TTYPE','BLBL','BTD');
insert into bgtdomains (dname,bgtcode,bgttype) values('KTYPE','PR','KWD');

-----------------------------
--Added by Monowar (17.06.16)
-----------------------------
INSERT INTO stuf_msg_config(sender_bronhouder, sender_application, sender_administration, msg_ref_prefix, 
							msg_identification_prefix, toelichting)
    --VALUES ('G0400','ChaloIS-BGTLink','ML02','8ABEA','G0400.8A','BGT');
	VALUES ('msgconfig_sender_bronhouder','msgconfig_sender_application','msgconfig_sender_administration','msgconfig_msg_ref_prefix','msgconfig_msg_identification_prefix','msgconfig_toelichting');
	
	
	
	
	
