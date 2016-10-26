-- Instruction: Replace AOXX with projectcode. Also, replace localhost with IP or Server name.
-- Role Independed and Project AOXX specific entry for System tables.

-- Sys_dfn_repdetail
-- sys_metadata
--Sys_report_functions
-- sys_commonfunctions
	
----------------------------
-- sys_metadata
----------------------------
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'id','STR','ID','Yes','','','','','','','',15,100,FALSE,'ID','hittasks',2,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'taaktype','STR','Taak Type','No','','','','','','','',5,100,TRUE,'Taak Type','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'omschrijving','STR','Omschrijving','No','','','','','','','',100,400,TRUE,'Omschrijving','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'ingevoerd','Date','Ingevoerd','No','','','','','','','',15,80,TRUE,'Ingevoerd','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'einddatum','Date','Einddatum','No','','','','','','','',15,80,TRUE,'Einddatum','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'status','STR','status','No','','','','','','','',12,150,TRUE,'Status','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'statusupd','Date','statusupd','No','','','','','','','',15,80,TRUE,'Statusupd','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'actie','STR','Actie','No','','','','','','','',20,150,TRUE,'Actie','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'afdeling','STR','Afdeling','No','','','','','','','',20,150,TRUE,'Afdeling','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'actiedatum','Date','Actiedatum','No','','','','','','','',15,80,TRUE,'Actiedatum','hittasks',0,'','','AOXX_HITTASK');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'opmerking','STR','Opmerking','No','','','','','','','',200,400,TRUE,'Opmerking','hittasks',0,'','','AOXX_HITTASK');

INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'setname','STR','Set name','Yes','','','','','','','',30,150,'t','','hitmapsets',2,'',null,'','AOXX_HITBGT_MAPSETS');

INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'mapnumbers','Text','Map #','Yes','','','','','','','',15,250,'t','','hitmapsets',2,'',null,'','AOXX_HITBGT_MAPSETS');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'id','INT','ID','Yes','','','','','','','',20,150,'f','','default_pbp_info',2,'p',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'layername','STR','Layer Name','Yes','','','','','','','',20,250,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'layerformat','STR','Layer Format','Yes','','','','','','','',300,250,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'organization','STR','Organization','Yes','','','','','','','',50,250,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'methodcode','INT','Method Code','Yes','','','','','','','',10,250,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'method','STR','Method','Yes','','','','','','','',100,250,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'prec','INT','Precision','Yes','','','','','','','',10,250,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
INSERT INTO sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_order, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'date','Date','Date','Yes','','','','','','','',15,80,'t','','default_pbp_info',2,'',null,'','AOXX_DEFAULTPBPINFO');
	
	
--- BOR-System // Report/functions----------------------------


-- System reports.
-- Not yet added

-------------------------
-- sys_report_funtions
-------------------------
	
	
--- January 20, 2016

INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'id','STR','ID','Yes','','','','','','','',10,100,FALSE,'ID','action_mapping',2,'p','','AOXX_ACTION_MAPPING');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'current_actie','STR','Current Actie','No','','','','','','','',10,100,TRUE,'Current Actie','action_mapping',1,'','','AOXX_ACTION_MAPPING');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'next_actie','STR','Next Actie','No','','','','','','','',10,100,TRUE,'Next Actie','action_mapping',1,'','','AOXX_ACTION_MAPPING');
	
	
-- action_settings
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'actie','STR','Actie','Yes','','','','','','','',10,100,TRUE,'Current Actie','action_settings',2,'p','','AOXX_ACTION_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'actie_process_duration','STR','Actie Process','No','','','','','','','',10,100,TRUE,'Actie Process','action_settings',0,'','','AOXX_ACTION_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'afdeling','STR','Afdeling','No','','','','','','','',10,100,TRUE,'Afdeling','action_settings',0,'','','AOXX_ACTION_SETTINGS');
	
-- departments
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'id','STR','ID','Yes','','','','','','','',10,100,FALSE,'ID','departments',2,'p','','AOXX_WORKFLOW_DEPARTMENTS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'department','STR','Department','No','','','','','','','',10,100,TRUE,'Department','departments',0,'','','AOXX_WORKFLOW_DEPARTMENTS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'email','Text','E-mail','No','','','','','','','',300,TRUE,'E-mail','departments',0,'','','AOXX_WORKFLOW_DEPARTMENTS');
	
-- hittasks_settings
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'id','STR','ID','Yes','','','','','','','',10,100,FALSE,'ID','hittasks_settings',2,'p','','AOXX_HITTASK_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'taaktype','STR','Taak Type','No','','','','','','','',10,100,TRUE,'Taak Type','hittasks_settings',0,'','','AOXX_HITTASK_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'taaktype','STR','Taak Type','No','','','','','','','',10,100,TRUE,'Taak Type','hittasks_settings',0,'','','AOXX_HITTASK_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'set_einddatum_in','STR','End Date','No','','','','','','','',10,100,TRUE,'End Date','hittasks_settings',0,'','','AOXX_HITTASK_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'min_time_inbetween_actie_enddate','STR','Min. Time between actie and End Date','No','','','','','','','',10,100,TRUE,'Min. Time between actie and End Date','hittasks_settings',0,'','','AOXX_HITTASK_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'actie_day_preference','STR','Actie Day preference','No','','','','','','','',10,100,TRUE,'Actie Day preference','hittasks_settings',0,'','','AOXX_HITTASK_SETTINGS');
	
INSERT INTO public.sys_metadata(
            id, fieldname, fieldtype, caption, mandatory, defaultvalue, lovc, 
            lovp, lovcp, minvalue, maxvalue, decimals, strlen, displen, allowedit, 
            tip, tablename, errorlevel, field_specialty, field_group, 
            report_code)
    VALUES ((select max(id) from sys_metadata)+1,'end_day_preference','STR','End Day preference','No','','','','','','','',10,100,TRUE,'End Day preference','hittasks_settings',0,'','','AOXX_HITTASK_SETTINGS');


