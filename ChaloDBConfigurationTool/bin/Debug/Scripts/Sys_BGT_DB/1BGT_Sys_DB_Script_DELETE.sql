-------------------------------------------
-- Delete from almost all sys tables
-------------------------------------------

DELETE FROM sys_user_role_relation WHERE user_name 
in (Select user_id from sys_user_reg where domain = 'AOXX');
DELETE FROM sys_user_reg WHERE domain = 'AOXX';
DELETE FROM sys_dfn_repdetail WHERE report_code LIKE 'AOXX\_%';
DELETE FROM sys_report_functions WHERE report_code LIKE 'AOXX\_%';
Delete from sys_user_role_relation where user_name = 'SuperUserIDXX';
Delete from sys_user_role_relation where user_name = 'TeamleadUserIDXX';
Delete from sys_user_role_relation where user_name = 'GuestUserIDXX';
DELETE FROM sys_authorization WHERE report_function_code LIKE 'AOXX\_%';	
DELETE FROM sys_metadata WHERE report_code LIKE 'AOXX\_%';
DELETE FROM sys_attachment_settings WHERE report_code LIKE 'AOXX\_%';
DELETE FROM sys_dashboard WHERE report_code LIKE 'AOXX\_%';
