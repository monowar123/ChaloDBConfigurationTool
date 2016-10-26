-- Instruction: Replace AOXX with projectcode. Also, replace localhost with IP or Server name.
-- Role Independed and Project AOXX specific entry for System tables.

-- Sys_dfn_repdetail
-- sys_metadata
--Sys_report_functions
-- sys_commonfunctions

--------------------------------
-- sys_dfn_repdetail
--------------------------------

--ALTER TABLE sys_dfn_repdetail
--	ALTER COLUMN report_code TYPE character varying(50);

-- MapSet shp export
INSERT INTO sys_report_functions(report_code, function_name, order_position, parameters, is_report_specific,id,is_group_specific)
	VALUES ('AOXX_HITBGT_MAPSETS','MAPSET_EXPORT_AS_SHP',3,'setname;mapnumbers',false,(select max(id) from sys_report_functions)+1, false);

-- For manage project
INSERT INTO sys_report_functions(report_code, function_name, order_position, parameters, is_report_specific,id,is_group_specific)
	VALUES ('AOXX_HITTASK','HITTASK_MANAGE_PRO',3,'id;taaktype',false,(select max(id) from sys_report_functions)+1, false);
	
INSERT INTO sys_report_functions (report_code, function_name, order_position, parameters, id)
	values('AOXX_HITTASK','WORKFLOW', 1, 'id',(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions (report_code, function_name, order_position, parameters, id)
	values('AOXX_HITTASK','ZOOMTO', 2, 'center_x;center_y;zoom_scale',(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions (report_code, function_name, order_position, parameters, id)
	values('AOXX_HITTASK','EDIT', 3, 'id',(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_attachment_settings(report_code, has_bijlagen, has_revision, has_history, how_many_chars, show_all_files, attachment_keyfield)
	values('AOXX_HITTASK', true, false, false, 0, true, 'id');
	
----------------------------
-- sys_report_funtions
----------------------------
--ALTER TABLE sys_report_functions
--	ALTER COLUMN report_code TYPE character varying(50);

insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_ACTION_MAPPING','ADD', 1, 'id',(select max(id) from sys_report_functions)+1, true);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_ACTION_MAPPING','EDIT', 1, 'id',(select max(id) from sys_report_functions)+1, false);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_ACTION_MAPPING','DELETE', 2, 'id',(select max(id) from sys_report_functions)+1, false);

insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_ACTION_SETTINGS','ADD', 1, 'actie',(select max(id) from sys_report_functions)+1, true);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_ACTION_SETTINGS','EDIT', 2, 'actie',(select max(id) from sys_report_functions)+1, false);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_ACTION_SETTINGS','DELETE', 2, 'actie',(select max(id) from sys_report_functions)+1, false);

insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_WORKFLOW_DEPARTMENTS','ADD', 1, 'id',(select max(id) from sys_report_functions)+1, true);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_WORKFLOW_DEPARTMENTS','EDIT', 2, 'id',(select max(id) from sys_report_functions)+1, false);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_WORKFLOW_DEPARTMENTS','DELETE', 2, 'id',(select max(id) from sys_report_functions)+1, false);

insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_HITTASK_SETTINGS','ADD', 1, 'id',(select max(id) from sys_report_functions)+1, true);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_HITTASK_SETTINGS','EDIT', 2, 'id',(select max(id) from sys_report_functions)+1, false);
insert into sys_report_functions (report_code, function_name, order_position, parameters, id, is_report_specific)
values('AOXX_HITTASK_SETTINGS','DELETE', 2, 'id',(select max(id) from sys_report_functions)+1, false);

	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_ORLBAG','UpdateBAGStreet',1,'cadid',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_ORLBAG','UpdateBAGStreetMan',1,'cadid',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_ORLBAG','UpdateBgtOthORL',1,'cadid',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT','PUBLISH',1,'cadid',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_PUBLISH','EXPORT',1,'cadid;startdate',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_PUBLICATION','EXPORT',1,'cadid;startdate',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_PUBLICATION','REVERT',1,'pub_time',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_MAPSETS','ADD',1,'mapsetid',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_MAPSETS','EDIT',2,'mapsetid',false,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_MAPSETS','DELETE',3,'mapsetid',false,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_MAPSETS','MAPSET_EXPORT',4,'setname;mapnumbers',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT','ACTUAL_BGT_EXPORT',2,'cadid;bgttype',false,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT','Export2SHP',3,'cadid',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH','OTHER_BGT_EXPORT',1,'cadid;bgttype',false,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH','Export2SHP',2,'cadid',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BGT_REPORT','BGTREPORT_EXPORT',1,'view_name',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITPBP','Export2SHP',3,'cadid',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_ORGPBP','Export2SHP',3,'cadid',true,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT','ZoomToFeat',4,'par',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH','ZoomToFeat',4,'par',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_IN_MUTATION','MUTATION_TO_BASE',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT','PROCESS_HOUSERANGE',1,'par',true,(select max(id) from sys_report_functions)+1);
	
--------------------new---------------------------	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTKR','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_LEV0','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT_LEV1','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH_ORL','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH_LINE','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH_POINT','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGTOTH_POLYGON','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_ERROR_REPORT','GENERATE_ERROR',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_DEFAULTPBPINFO','ADD',1,'id',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_DEFAULTPBPINFO','EDIT',1,'id',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_DEFAULTPBPINFO','DELETE',1,'id',false,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITPBP','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_ORGPBP','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BAGINFO','Export2SHPNew',1,'par',true,(select max(id) from sys_report_functions)+1);
	




INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BGT_PINPOINTS','DELETE',1,'id',FALSE,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BOR_MUTATION_INCOMING','DELETE',1,'id',FALSE,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BGT_PINPOINTS','DELETE_ALL',1,'id',TRUE,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BOR_MUTATION_INCOMING','DELETE_BOR_ALL',1,'id',TRUE,(select max(id) from sys_report_functions)+1);
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BOR_MUTATION_INCOMING','IMPORT_BOR_MUTATION',2,'id',TRUE,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BGT_PINPOINTS','IMPORT_BGT_PINPOINT',2,'id',TRUE,(select max(id) from sys_report_functions)+1);
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BGT_PINPOINTS','RESPONSE_TO_BOR',2,'id',FALSE,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BOR_MUTATION_INCOMING','REFUSE_THIS_CHANGE',2,'borid',FALSE,(select max(id) from sys_report_functions)+1);
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITBGT','PUBLISH_MUTATION_BOR',1,'id',TRUE,(select max(id) from sys_report_functions)+1);


	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_PUBLICATION_BOR','EXP_PUBLICATION_BOR',1,'pub_time',FALSE,(select max(id) from sys_report_functions)+1);

INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_BOR_MUTATION_INCOMING','GROUP_DELETE',1,'id',FALSE,(select max(id) from sys_report_functions)+1);
	
	
	

Insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_HITTASK','CRT_MUTN_ANNOUNCE', (select max(order_position) from sys_report_functions where report_code = 'AOXX_HITTASK') + 1, 'id', false, (select max(id) from sys_report_functions)+1);


insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_PUBLICATION','CREATE_MESSAGE', 1, 'pub_time', false, (select max(id) from sys_report_functions)+1);


insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_HITPBP','PBP_COMPLETE_CHECK', (select max(order_position) from sys_report_functions where report_code = 'AOXX_HITPBP') + 1, '', true, (select max(id) from sys_report_functions)+1);


insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_Messages','IMPT_BRAVO_MUTATN', 1, 'msg_id', false, (select max(id) from sys_report_functions)+1);

insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_Messages','SND_MUTATN_TO_BRAVO', 2, 'msg_id', false, (select max(id) from sys_report_functions)+1);


insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_IN_MUTATION','DELETE_ALL_BGTIN_MUT', 1, 'cadid', true, (select max(id) from sys_report_functions)+1);
	

Insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_BOR_MUTATION_INCOMING','BOR_STRP_MUTATION', 3, 'AOXX_BOR_MUTATION_INCOMING;id;REFUSE_THIS_CHANGE',true,(select max(id) from sys_report_functions)+1);


Insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_IN_MUTATION','ZoomToBorMutation', 4, 'id',true,(select max(id) from sys_report_functions)+1);


insert into sys_report_functions(report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_HITTASK', 'BOR_MUTATION_PROCESS', 3, 'AOXX_BOR_MUTATION_INCOMING;id;ZoomToBorMutation', true, (select max(id) from sys_report_functions)+1);

insert into sys_report_functions(report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_HITTASK', 'ZoomToBorMutation', 4, 'AOXX_IN_MUTATION;id', true, (select max(id) from sys_report_functions)+1);

insert into sys_report_functions(report_code, function_name, order_position, parameters, is_report_specific, id)
values('AOXX_HITTASK', 'BOR_EXPL_REQ', 3, 'AOXX_BGT_PINPOINTS;id;ZoomToBorMutation', true, (select max(id) from sys_report_functions)+1);	


--------------------------------
--Inserted by Monowar (17.06.16)
--------------------------------
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_GT_IN_MUTATION','Clear_GT_Mutation',1,'cadid',true,(select max(id) from sys_report_functions)+1);
		
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITWORKPACKAGE','Manage_Workpackage',1,'id;title;status',false,(select max(id) from sys_report_functions)+1);


