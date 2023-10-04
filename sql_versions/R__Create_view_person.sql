drop view if exists vw_person;
create or replace view vw_person as
    select
    first_name as this_first_name,
    last_name
    from person;