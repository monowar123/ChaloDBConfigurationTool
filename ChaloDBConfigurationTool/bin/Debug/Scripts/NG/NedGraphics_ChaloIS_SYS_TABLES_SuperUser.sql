------------------------------------------
-- NEDGraphics xml input report
------------------------------------------


-----------------------------
-- Delete from all sys tables
-----------------------------

DELETE FROM sys_dfn_repdetail WHERE report_code LIKE '%_NEDGRPCS' and report_code LIKE 'AOXX%';
DELETE FROM sys_dfn_repdetail WHERE report_code LIKE '%_NGMOV' and report_code LIKE 'AOXX%';

DELETE FROM sys_report_functions WHERE report_code LIKE '%_NEDGRPCS' and report_code LIKE 'AOXX%';
DELETE FROM sys_report_functions WHERE report_code LIKE '%_NGMOV' and report_code LIKE 'AOXX%';

DELETE FROM sys_authorization WHERE report_function_code LIKE '%_NEDGRPCS_%' and report_function_code LIKE 'AOXX%';
DELETE FROM sys_authorization WHERE report_function_code LIKE '%_NGMOV_%' and report_function_code LIKE 'AOXX%';


--------------------------------
-- sys_dfn_repdetail
--------------------------------

INSERT INTO sys_dfn_repdetail(
            report_code, report_name, report_order, sql_from, connection_string, 
            sql_keyfields, multiselect, gis_theme_layer, report_settings, 
            deeplink, edit_table, document_folder, tabs, implicit_where, 
            add_record_key, copy_sql, report_help)
    VALUES ('AOXX_NEDGRPCS','NedGraphics Data',0,'nedgraphics','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000; ','id',false,null,'',false,'nedgraphics','','','','','','');

INSERT INTO sys_dfn_repdetail(
		report_code, report_name, report_order, sql_from, connection_string, 
		sql_keyfields, multiselect, gis_theme_layer, report_settings, 
		deeplink, edit_table, document_folder, tabs, implicit_where, 
		add_record_key, copy_sql, report_help)
VALUES ('AOXX_NGMOV','MOV boundaries',0,'hitmov','Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode ','linenumber',false,null,'',false,'hitmov','','','','','','');


-------------------------
-- sys_report_funtions
-------------------------	
INSERT INTO sys_report_functions(
		report_code, function_name, order_position, parameters, is_report_specific, 
		id)
VALUES ('AOXX_NEDGRPCS','ZoomToFeat',4,'par',false,(select max(id) from sys_report_functions)+1);

----------------------------
-- sys_autorization
----------------------------
INSERT INTO sys_authorization(role_id, report_function_code, id) VALUES ('Super','AOXX_NGMOV_VIEW',(select max(id) from sys_authorization)+1); 

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_NEDGRPCS_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_NEDGRPCS_ZoomToFeat',(select max(id) from sys_authorization)+1);
	

