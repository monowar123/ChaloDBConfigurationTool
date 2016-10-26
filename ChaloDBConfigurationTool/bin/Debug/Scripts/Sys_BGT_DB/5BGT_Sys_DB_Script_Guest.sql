-- Instruction: Replace AOXX with projectcode. Also, replace localhost with IP or Server name.
-- Role dependend and project specific entry.
-- Role: Guest

--sys_user_role_relation
-- sys_authorization
--sys_commonfunctions


---------------------------
-- sys_user_role_relation
-- sys_user_reg
---------------------------

Insert into sys_user_role_relation (user_name,rolename)
values('UserIDXX','Guest');

Insert into sys_user_reg (user_id,user_pass,user_name,user_email,domain)
values('UserIDXX','PaswordXX','UserNameXX','UserIDXX','AOXX');

	
----------------------------
-- sys_autorization
----------------------------

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITTASK_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization (role_id, report_function_code, id)
values('Guest', 'AOXX_HITTASK_ZOOMTO',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITBGTOTH_VIEW',(select max(id) from sys_authorization)+1);
	



INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITBGT_VIEW',(select max(id) from sys_authorization)+1);



INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITBGT_MAPSETS_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITPBP_VIEW',(select max(id) from sys_authorization)+1);


	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITBGT_ZoomToFeat',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITBGTOTH_ZoomToFeat',(select max(id) from sys_authorization)+1);
	

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_HITBGTKR_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Guest','AOXX_BGT_PINPOINTS_VIEW',(select max(id) from sys_authorization)+1);
	