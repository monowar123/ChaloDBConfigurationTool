-- Instruction: Replace AOXX with projectcode. Also, replace localhost with IP or Server name.
-- Role dependend and project specific entry.
-- Role: SUPER

--sys_user_role_relation
-- sys_authorization
--sys_commonfunctions


---------------------------
-- sys_user_role_relation
-- sys_user_reg
---------------------------

Insert into sys_user_reg (user_id,user_pass,user_name,user_email,domain)
values('UserIDXX','PaswordXX','UserNameXX','UserIDXX','AOXX');

Insert into sys_user_role_relation (user_name,rolename)
values('UserIDXX','Super');


	
----------------------------
-- sys_autorization
----------------------------

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_MAPPING_VIEW', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_MAPPING_ADD', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_MAPPING_EDIT', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_MAPPING_DELETE', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_SETTINGS_VIEW', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_SETTINGS_ADD', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_SETTINGS_EDIT', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_ACTION_SETTINGS_DELETE', (select max(id) from sys_authorization)+1);

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_WORKFLOW_DEPARTMENTS_VIEW', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_WORKFLOW_DEPARTMENTS_ADD', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_WORKFLOW_DEPARTMENTS_EDIT', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_WORKFLOW_DEPARTMENTS_DELETE', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_SETTINGS_VIEW', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_SETTINGS_ADD', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_SETTINGS_EDIT', (select max(id) from sys_authorization)+1);
insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_SETTINGS_DELETE', (select max(id) from sys_authorization)+1);


Insert into sys_authorization(role_id,report_function_code,id)
values('Super','AOXX_HITTASK_CREATE_AOI',(Select max(id) from sys_authorization)+1);

Insert into sys_authorization(role_id,report_function_code,id)
values('Super','AOXX_HITTASK_BGT_FUNCTION',(Select max(id) from sys_authorization)+1);


INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITTASK_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_WORKFLOW', (select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_ZOOMTO',(select max(id) from sys_authorization)+1);


INSERT INTO sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_EDIT',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORLBAG_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORLBAG_UpdateBAGStreet',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORLBAG_UpdateBAGStreetMan',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORLBAG_UpdateBgtOthORL',(select max(id) from sys_authorization)+1);


INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_MAPSETS_EDIT',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_ACTUAL_BGT_EXPORT',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_OTHER_BGT_EXPORT',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_PUBLISH',(select max(id) from sys_authorization)+1);
 
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_PUBLISH_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_PUBLISH_EXPORT',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_MAPSETS_MAPSET_EXPORT',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_MAPSETS_MAPSET_VALIDATE',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_PUBLISH_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_PUBLICATION_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_PUBLISH',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_PUBLISH_EXPORT',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_PUBLICATION_EXPORT',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_MAPSETS_ADD',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_MAPSETS_DELETE',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_MAPSETS_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITPBP_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_REPORT_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_REPORT_BGTREPORT_EXPORT',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORGPBP_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITPBP_Export2SHP',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORGPBP_Export2SHP',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_Export2SHP',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_Export2SHP',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_ZoomToFeat',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_ZoomToFeat',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_IN_MUTATION_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_OTH_IN_MUTATION_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_IN_MUTATION_MUTATION_TO_BASE',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_PROCESS_HOUSERANGE',(select max(id) from sys_authorization)+1);
	
--------------------new---------------------------
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTKR_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_LEV0_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_LEV1_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_ORL_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_LINE_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_POINT_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_POLYGON_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTKR_Export2SHPNew',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_LEV0_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_LEV1_Export2SHPNew',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_ORL_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_LINE_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_POINT_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_POLYGON_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ERROR_REPORT_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ERROR_REPORT_GENERATE_ERROR',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_DEFAULTPBPINFO_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_DEFAULTPBPINFO_ADD',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_DEFAULTPBPINFO_EDIT',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_DEFAULTPBPINFO_DELETE',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITPBP_Export2SHPNew',(select max(id) from sys_authorization)+1);


INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_ORGPBP_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BAGINFO_VIEW',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BAGINFO_Export2SHPNew',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_PUBLISH_TOBOR_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGTOTH_PUBLISH_TOBOR_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_PUBLICATION_BOR_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BOR_MUTATION_INCOMING_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_PINPOINTS_VIEW',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_PINPOINTS_DELETE',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BOR_MUTATION_INCOMING_DELETE',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_PINPOINTS_DELETE_ALL',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BOR_MUTATION_INCOMING_DELETE_BOR_ALL',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BOR_MUTATION_INCOMING_IMPORT_BOR_MUTATION',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_PINPOINTS_IMPORT_BGT_PINPOINT',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BGT_PINPOINTS_RESPONSE_TO_BOR',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BOR_MUTATION_INCOMING_REFUSE_THIS_CHANGE',(select max(id) from sys_authorization)+1);
	
INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_HITBGT_PUBLISH_MUTATION_BOR',(select max(id) from sys_authorization)+1);
 

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_PUBLICATION_BOR_EXP_PUBLICATION_BOR',(select max(id) from sys_authorization)+1);

INSERT INTO sys_authorization(
            role_id, report_function_code, id)
    VALUES ('Super','AOXX_BOR_MUTATION_INCOMING_GROUP_DELETE',(select max(id) from sys_authorization)+1);
	

INSERT INTO sys_authorization(role_id, report_function_code, id)
	VALUES ('Super','AOXX_HITBGT_MAPSETS_MAPSET_EXPORT_AS_SHP',(select max(id) from sys_authorization)+1);
	

INSERT INTO sys_authorization(role_id, report_function_code, id)
	VALUES ('Super','AOXX_HITTASK_HITTASK_MANAGE_PRO',(select max(id) from sys_authorization)+1);	
	
Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_VECTOR_EDIT',(select max(id) from sys_authorization)+1);


Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_VECTOR_DELETE',(select max(id) from sys_authorization)+1);




--- New BOR-----

Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_BOR_MUTATION_INCOMING_BOR_STRP_MUTATION', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_IN_MUTATION_ZoomToBorMutation', (select max(id) from sys_authorization)+1);


Insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_BOR_MUTATION_PROCESS', (select max(id) from sys_authorization)+1);


Insert into sys_authorization(role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_BOR_EXPL_REQ', (select max(id) from sys_authorization)+1);


Insert into sys_authorization(role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_ZoomToBorMutation', (select max(id) from sys_authorization)+1);

--- New BRAVO ---

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_Messages_VIEW', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_Messages_IMPT_BRAVO_MUTATN', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_Messages_SND_MUTATN_TO_BRAVO', (select max(id) from sys_authorization)+1);


insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_PUBLICATION_CREATE_MESSAGE', (select max(id) from sys_authorization)+1);

insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITPBP_PBP_COMPLETE_CHECK', (select max(id) from sys_authorization)+1);


insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_IN_MUTATION_DELETE_ALL_BGTIN_MUT', (select max(id) from sys_authorization)+1);


insert into sys_authorization (role_id, report_function_code, id)
values('Super', 'AOXX_HITTASK_CRT_MUTN_ANNOUNCE', (select max(id) from sys_authorization)+1);

--------------------------------
--Inserted by Monowar (17.06.16)
--------------------------------
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
