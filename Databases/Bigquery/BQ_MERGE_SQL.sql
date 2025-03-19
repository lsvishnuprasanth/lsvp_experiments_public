-- create table Testing.table_1
-- (
--   id string,
--   value int64,
--   upd_date timestamp
-- );


-- create table Testing.table_2
-- (
--   id string,
--   value int64,
--   upd_date timestamp
-- );


-- insert into Testing.table_1(id, value, upd_date) values ('a001', 100, current_timestamp());
-- insert into Testing.table_1(id, value, upd_date) values ('a002', 200, current_timestamp());
-- insert into Testing.table_1(id, value, upd_date) values ('a003', 300, current_timestamp());
-- insert into Testing.table_1(id, value, upd_date) values ('a004', 400, current_timestamp());
-- insert into Testing.table_1(id, value, upd_date) values ('a001', 105, current_timestamp());
-- insert into Testing.table_1(id, value, upd_date) values ('a001', 106, current_timestamp());


-- insert into Testing.table_2(id, value, upd_date) values ('a001', 100, current_timestamp());
-- insert into Testing.table_2(id, value, upd_date) values ('a002', 200, current_timestamp());

/*
--option 1 using INSERT VALUES

MERGE `development-346410.Testing.table_2` table_2
USING `development-346410.Testing.table_1_unique` staging
ON 
  staging.id = table_2.id
WHEN MATCHED THEN
  UPDATE SET
    table_2.value = staging.value,
    table_2.upd_date =  staging.upd_date
WHEN NOT MATCHED BY TARGET THEN
  INSERT (
    id, value, upd_date)
  VALUES (
    staging.id,
    staging.value,
    staging.upd_date
  )
*/




/*
--option 2 using INSERT ROW

MERGE `development-346410.Testing.table_2` table_2
USING 
  ( select * EXCEPT(rnk) from `development-346410.Testing.table_1_unique`) staging
ON 
  staging.id = table_2.id
WHEN MATCHED THEN
  UPDATE SET
    table_2.value = staging.value,
    table_2.upd_date =  staging.upd_date
WHEN NOT MATCHED BY TARGET THEN
  INSERT 
    ROW
*/



/*
--option 3 DELETE Matching Rows

MERGE `development-346410.Testing.table_2` table_2
USING 
  ( select * EXCEPT(rnk) from `development-346410.Testing.table_1_unique`) staging
ON 
  staging.id = table_2.id
WHEN MATCHED THEN
  DELETE;

*/






