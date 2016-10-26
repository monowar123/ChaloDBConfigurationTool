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


Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_ACTION_MAPPING', 'Workflow Action Mapping', 'action_mapping', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'id', 'action_mapping', '', '','id');

insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, add_record_key)
values('AOXX_ACTION_SETTINGS', 'Workflow Action Settings', 'action_settings', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'actie', 'action_settings', '','actie');

insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, add_record_key)
values('AOXX_WORKFLOW_DEPARTMENTS', 'Workflow Departments', 'departments', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'id', 'departments', '','id');

insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, add_record_key)
values('AOXX_HITTASK_SETTINGS', 'Workflow Hittask Settings', 'hittasks_settings', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'id', 'hittasks_settings', '','id');



INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_ORLBAG','ORL Bag Report',0,'hitorl_bag','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'hitorl_bag','','','','','','');


INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH','Actual BGT-Other Data',0,'hitbgtoth','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'hitbgtoth','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGT_MAPSETS','Map Sets',0,'hitmapsets','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','mapsetid',false,null,'',false,'hitmapsets','','','','mapsetid','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_PUBLICATION','Publication Info',0,'publication','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','pub_time',null,null,'',true,'publication','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGT_PUBLISH','BGT Published Data',0,'hitbgt_publish','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'hitbgt_publish','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITPBP','Actual PBP Data',0,'hitpbp','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000; ','cadid',false,null,'',false,'hitpbp','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITPBP_PUBLISH','PBP Published Data',0,'hitpbp_publish','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000; ','',false,null,'',false,'hitbgt_publish','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGT','Actual BGT Data',0,'hitbgt','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'hitbgt','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH_PUBLISH','BGT-Other Published Data',0,'hitbgtoth_publish','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',true,'hitbgtoth_publish','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_BGT_REPORT','BGT Reports',0,'bgt_reports','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','id',null,null,'',false,'bgt_reports','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_ORGPBP','Original PBP Data',0,'orgpbp','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;','id',null,null,'',false,'orgpbp','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_IN_MUTATION','BGT Incoming Mutation',0,'hitbgt_publish_incoming','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'hitbgt_publish_incoming','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_OTH_IN_MUTATION','BGT-Other Incoming Mutation',0,'hitbgtoth_publish_incoming','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'hitbgtoth_publish_incoming','','','','','','');
-------------------------new---------------------------	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_DEFAULTPBPINFO','Default PBP Info',0,'default_pbp_info','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','id',false,null,'',false,'default_pbp_info','','','','id','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_ERROR_REPORT','BGT Data Errors',0,'errorinfo','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','id',false,null,'',false,'errorinfo','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGT_LEV0','Actual BGT Zero-Level Data',0,'v_hitbgt_lev0','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgt_lev0','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGT_LEV1','Actual BGT Non-Zero-Level Data',0,'v_hitbgt_lev1','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgt_lev1','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTKR','BGT Kruinlijns',0,'v_hitbgtkr','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgtkr','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH_LINE','BGT-Other Lines',0,'v_hitbgtoth_line','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgtoth_line','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH_ORL','BGT-Other ORLs',0,'v_hitbgtoth_orl','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgtoth_orl','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH_POINT','BGT-Other Points',0,'v_hitbgtoth_point','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgtoth_point','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH_POLYGON','BGT-Other Polygons',0,'v_hitbgtoth_polygon','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_hitbgtoth_polygon','','','','','','');
	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_BAGINFO','BAG Info',0,'v_baginfo','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','cadid',false,null,'',false,'v_baginfo','','','','','','');

INSERT INTO sys_dfn_repdetail(report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where,add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITTASK','Hit tasks' ,0,'hittasks_v','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000','id',false,null,'',false,'hittasks','','','','','','');
	
	
--- BOR-System // Report/functions----------------------------


INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_BOR_MUTATION_INCOMING','BOR Incoming Mutation',0,'bor_mutation_incoming','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode','id',false,null,'',false,'bor_mutation_incoming','','','','','','');

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_BGT_PINPOINTS','BOR Exploration Request',0,'bor_exploration_request','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode','id',false,null,'',false,'bor_exploration_request','','','','','','');

-----
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGT_PUBLISH_TOBOR','BOR-BGT Publish',0,'hitbgt_publish_tobor','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode','id',false,null,'',false,'hitbgt_publish_tobor','','','','','','');

	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_HITBGTOTH_PUBLISH_TOBOR','BOR-BGTOth Publish',0,'hitbgtoth_publish_tobor','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode','id',false,null,'',false,'hitbgtoth_publish_tobor','','','','','','');

	
INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_PUBLICATION_BOR','BOR Publication',0,'publication_bor','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode','pub_time',false,null,'',false,'publication_bor','','','','','','');


	
--INSERT INTO sys_dfn_repdetail(
 --           report_code, report_name, report_order, sql_from, connection_string, 
  --          sql_keyfields, multiselect, gis_theme_layer, report_settings, 
  --          deeplink, edit_table, document_folder, tabs, implicit_where, 
  --          add_record_key, copy_sql, report_help)
  --  VALUES ('AOXX_Messages','LV Messages',0,'v_messages','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User --id=AOXX;Password=AOXX;encoding=unicode','msg_id',false,null,'',false,'messages','Messages','pdf','','','','');


--------------------------------
--Inserted by Monowar (06.06.16)
--------------------------------
insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, document_folder, implicit_where, tabs)
values('AOXX_Messages', 'Messages', 'v_messages', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'msg_id', 'messages', 'Messages', '', 'pdf');


--------------------------------
--Inserted by Monowar (17.06.16)
--------------------------------
Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_HITWORKPACKAGE', 'Hit work packages', 'hitworkpackage', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'id', 'hitworkpackage', '', '','id');

Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_GT_IN_MUTATION', 'GT_BGT incoming mutation', 'hitbgt_mutation_incoming', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'cadid', 'hitbgt_mutation_incoming', '', '','cadid');

Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_GT_OTH_IN_MUTATION', 'GT_BGTOth incoming mutation', 'hitbgtoth_mutation_incoming', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'cadid', 'hitbgtoth_mutation_incoming', '', '','cadid');

Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_GT_PBP_IN_MUTATION', 'GT_PBP incoming mutation', 'hitpbp_mutation_incoming', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'cadid', 'hitpbp_mutation_incoming', '', '','cadid');





