
Insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, filter, title, switchto)
values('AOXX_HITTASK','pie','afdeling','count(*) as tasksopen','einddatum >= current_date and extract(week from now()) = (extract(week from einddatum))','Total tasks open this week / dept', 'bar');


insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, filter, title)
values('AOXX_HITTASK','bar','afdeling','count(*) as tasksopen','einddatum >= current_date and extract(week from now()) = (extract(week from einddatum))','Total tasks open this week / dept');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, filter, title)
values('AOXX_HITTASK','pie','taaktype','count(*) as OverdatedNr','(status <> ''Open'' or einddatum < current_date) and taaktype = ''SIG''','Total Overdated tasks');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, query, title)
values('AOXX_HITTASK','pie','','','select ''TasksExpired'', count(*) as nr from hittasks
where status = ''Open'' and einddatum < current_date
union
select ''TasksOpen'', count(*) as nr from hittasks
where status = ''Open'' and einddatum >= current_date','Tasks date expired/live');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, query, title)
values('AOXX_HITTASK','pie','','','select ''overdated'', sum(taskoverdated) as Nr from (
                select count(einddatum) as taskoverdated
                from hittasks
                where (extract(week from einddatum)) < extract(week from now())
                group by afdeling
                ) as c

                union

                select ''within_1_week'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 1 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_2_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 2 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_3_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 3 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_4_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 4 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_5_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) >= extract(week from now()) + 5  and lower(status) = ''open''
                group by afdeling) as c','Tasks open per dept');
				
insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, query, title)
values('AOXX_HITTASK','bar','','','select ''overdated'', sum(taskoverdated) as Nr from (
                select count(einddatum) as taskoverdated
                from hittasks
                where (extract(week from einddatum)) < extract(week from now())
                group by afdeling
                ) as c

                union

                select ''within_1_week'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 1 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_2_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 2 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_3_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 3 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_4_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) = extract(week from now()) + 4 and lower(status) = ''open''
                group by afdeling) as c

                union

                select ''within_5_weeks'', sum(tasksopen) as Nr from (
                select count(*) as tasksopen
                from hittasks
                where (extract(week from einddatum)) >= extract(week from now()) + 5  and lower(status) = ''open''
                group by afdeling) as c','Tasks to be closed per dept');


insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, query, title)
values('AOXX_HITTASK','groupedbar','','','select ''Week_'' || extract(week from ingevoerd)::text as WeekNr, geomarker_type, count(geomarker_type) as Nr
from hittasks
where taaktype = ''SIG'' and geomarker_type = ''point''
group by ingevoerd, geomarker_type

union

select ''Week_'' || extract(week from ingevoerd)::text as WeekNr, geomarker_type, count(geomarker_type) as Nr
from hittasks
where taaktype = ''SIG'' and geomarker_type = ''line''
group by ingevoerd, geomarker_type

union

select ''Week_'' || extract(week from ingevoerd)::text as WeekNr, geomarker_type, count(geomarker_type) as Nr
from hittasks
where taaktype = ''SIG'' and geomarker_type = ''polygon''
group by ingevoerd, geomarker_type;','Total geomType per Week.');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','pie','bgttype','count(*) as Nr','Actual Bgt - Pie - bgttype');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','pie','operator','count(*) as Nr','Actual Bgt - Pie - operator');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','pie','mapnr','count(*) as Nr','Actual Bgt - Pie - mapnr');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','pie','naar','','Actual Bgt - Pie - Custom');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','bar','bgttype','sum(geomarea) as GArea','Actual Bgt - Bar - bgttype');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','bar','mapnr','sum(geomarea) as GArea','Actual Bgt - Bar - mapnr');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGT','groupedbar','week','lastupdate,operator','Actual Bgt - GroupedBar - lastupdate');

--

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGTOTH','pie','bgttype','count(*) as Nr','Actual Bgt Other - Pie - bgttype');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGTOTH','pie','operator','count(*) as Nr','Actual Bgt Other - Pie - operator');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGTOTH','pie','mapnr','count(*) as Nr','Actual Bgt Other - Pie - mapnr');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGTOTH','bar','mapnr','sum(geomarea) as GArea','Actual Bgt Other - Bar - mapnr');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGTOTH','bar','bgttype','sum(geomarea) as GArea','Actual Bgt Other - Bar - bgttype');

insert into sys_dashboard(report_code, widget_type, base_column, aggr_expression, title)
values('AOXX_HITBGTOTH','bar','lastupdate','count(*) as Nr','Actual Bgt Other - Bar - lastupdate');