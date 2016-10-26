-- Instruction: Replace ML02 with ProjectName or so. Also, replace localhost with IP or Server name.

-----------------------------
-- Delete from sys tables
-----------------------------
DELETE FROM sys_dfn_repdetail WHERE report_code LIKE 'ML02_Messages%';
DELETE FROM sys_report_functions WHERE report_code LIKE 'ML02_IMPT_BRAVO_MUTATN%';
DELETE FROM sys_report_functions WHERE report_code LIKE 'ML02_SND_MUTATN_TO_BRAVO%';

--------------------------------
-- sys_dfn_repdetail
--------------------------------
insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, document_folder, implicit_where, tabs)
values('ML02_Messages', 'Messages', 'v_messages', 'Postgres:SERVER=localhost;Port=5432;Database=ML02;User id=ML02;Password=ML02;encoding=unicode;CommandTimeout=1000;', 'msg_id', 'messages', 'Messages', '', 'pdf');


--------------------------------
-- sys_report_functions
--------------------------------
insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('ML02_Messages','IMPT_BRAVO_MUTATN', 1, 'msg_id', false, (select max(id) from sys_report_functions)+1);

insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('ML02_Messages','SND_MUTATN_TO_BRAVO', 2, 'msg_id', false, (select max(id) from sys_report_functions)+1);


--------------------------------
-- sys_authorization
--------------------------------
DELETE FROM sys_authorization WHERE report_function_code = 'ML02_Messages_IMPT_BRAVO_MUTATN';
DELETE FROM sys_authorization WHERE report_function_code = 'ML02_Messages_SND_MUTATN_TO_BRAVO';

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'ML02_Messages_VIEW', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'ML02_Messages_IMPT_BRAVO_MUTATN', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'ML02_Messages_SND_MUTATN_TO_BRAVO', (select max(id) from sys_authorization)+1);


insert into sys_authorization (role_id, report_function_code, id)
values('Teamlead', 'ML02_Messages_VIEW', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Teamlead', 'ML02_Messages_IMPT_BRAVO_MUTATN', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Teamlead', 'ML02_Messages_SND_MUTATN_TO_BRAVO', (select max(id) from sys_authorization)+1);

-- Instruction: Replace ML02 with ProjectName or so. Also, replace localhost with IP or Server name.

--------------------------------
-- sys_report_functions
--------------------------------
insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('ML02_PUBLICATION','CREATE_MESSAGE', 1, 'pub_time', true, (select max(id) from sys_report_functions)+1);


--------------------------------
-- sys_authorization
--------------------------------
DELETE FROM sys_authorization WHERE report_function_code = 'ML02_PUBLICATION_CREATE_MESSAGE';

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'ML02_PUBLICATION_CREATE_MESSAGE', (select max(id) from sys_authorization)+1);


Insert into sys_authorization (role_id, report_function_code, id)
values('Teamlead', 'ML02_PUBLICATION_CREATE_MESSAGE', (select max(id) from sys_authorization)+1);

update sys_dfn_repdetail
set document_folder = 'Messages'
where report_code = 'ML02_PUBLICATION';


-- Instruction: Replace ML02 with ProjectName.

--------------------------------
-- sys_report_functions
--------------------------------
DELETE FROM sys_report_functions WHERE report_code = 'ML02_HITTASK' and function_name = 'CRT_MUTN_ANNOUNCE';

insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('ML02_HITTASK','CRT_MUTN_ANNOUNCE', (select max(order_position) from sys_report_functions where report_code = 'ML02_HITTASK') + 1, 'id', false, (select max(id) from sys_report_functions)+1);


--------------------------------
-- sys_authorization
--------------------------------
DELETE FROM sys_authorization WHERE report_function_code = 'ML02_HITTASK_CRT_MUTN_ANNOUNCE';

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'ML02_HITTASK_CRT_MUTN_ANNOUNCE', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Teamlead', 'ML02_HITTASK_CRT_MUTN_ANNOUNCE', (select max(id) from sys_authorization)+1);


-- Instruction: Replace ML02 with ProjectName or so

-----------------------------
-- Delete from sys tables
-----------------------------
DELETE FROM sys_report_functions WHERE report_code = 'ML02_HITPBP' AND function_name = 'PBP_COMPLETE_CHECK';


--------------------------------
-- sys_report_functions
--------------------------------
insert into sys_report_functions (report_code, function_name, order_position, parameters, is_report_specific, id)
values('ML02_HITPBP','PBP_COMPLETE_CHECK', (select max(order_position) from sys_report_functions where report_code = 'ML02_HITPBP') + 1, '', true, (select max(id) from sys_report_functions)+1);


--------------------------------
-- sys_authorization
--------------------------------
DELETE FROM sys_authorization WHERE report_function_code = 'ML02_HITPBP_PBP_COMPLETE_CHECK';

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'ML02_HITPBP_PBP_COMPLETE_CHECK', (select max(id) from sys_authorization)+1);


insert into sys_authorization (role_id, report_function_code, id)
values('Teamlead', 'ML02_HITPBP_PBP_COMPLETE_CHECK', (select max(id) from sys_authorization)+1);