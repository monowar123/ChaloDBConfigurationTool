
---------------------------------------------------------REPORTS---------------------------------------------------------------------------
Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_HITWORKPACKAGE', 'Hit work packages', 'hitworkpackage', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'id', 'hitworkpackage', '', '','id');

Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_GT_IN_MUTATION', 'GT_BGT incoming mutation', 'hitbgt_mutation_incoming', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'cadid', 'hitbgt_mutation_incoming', '', '','cadid');

Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_GT_OTH_IN_MUTATION', 'GT_BGTOth incoming mutation', 'hitbgtoth_mutation_incoming', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'cadid', 'hitbgtoth_mutation_incoming', '', '','cadid');

Insert into sys_dfn_repdetail (report_code, report_name, sql_from, connection_string, sql_keyfields, edit_table, implicit_where, tabs, add_record_key)
values('AOXX_GT_PBP_IN_MUTATION', 'GT_PBP incoming mutation', 'hitpbp_mutation_incoming', 'Postgres:SERVER=localhost;Port=5432;Database=AOXX;User id=AOXX;Password=AOXX;encoding=unicode;CommandTimeout=1000;', 'cadid', 'hitpbp_mutation_incoming', '', '','cadid');


---------------------------------------------------------FUNCTIONS---------------------------------------------------------------------------
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_GT_IN_MUTATION','Clear_GT_Mutation',1,'cadid',true,(select max(id) from sys_report_functions)+1);
	
	
	
INSERT INTO sys_report_functions(
            report_code, function_name, order_position, parameters, is_report_specific, 
            id)
    VALUES ('AOXX_HITWORKPACKAGE','Manage_Workpackage',1,'id;title;status',false,(select max(id) from sys_report_functions)+1);

---------------------------------------------------------AUTHORIZATION---------------------------------------------------------------------------

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITWORKPACKAGE_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_GT_IN_MUTATION_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_GT_OTH_IN_MUTATION_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_GT_PBP_IN_MUTATION_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_GT_IN_MUTATION_Clear_GT_Mutation', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITWORKPACKAGE_Manage_Workpackage', (select max(id) from sys_authorization)+1);


Insert into sys_authorization (role_id, report_function_code, id)
values('Teamleader', 'AOXX_HITWORKPACKAGE_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Teamleader', 'AOXX_GT_IN_MUTATION_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Teamleader', 'AOXX_GT_OTH_IN_MUTATION_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Teamleader', 'AOXX_GT_PBP_IN_MUTATION_VIEW', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Teamleader', 'AOXX_GT_IN_MUTATION_Clear_GT_Mutation', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Teamleader', 'AOXX_HITWORKPACKAGE_Manage_Workpackage', (select max(id) from sys_authorization)+1);