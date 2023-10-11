# flyway_migrations

This tool tool help you to version your sql code. 
The oficial documentation of flywaydb is: https://documentation.red-gate.com/fd/why-database-migrations-184127574.html

## Explanation:

sql_versions: directory where you put all sql files to be executed

Repeatable files: 

sql_versions/R__Create_view_person.sql

Format: R__{short description of the action}.sql

The Repeatable files will run after all versioned files

Versioned files: 

sql_versions/V202310031218__Create_person_table.sql

Format: V{number indicates the execution order}__{shor description of the action}.sql

In my case we use date + time because we work in team. But you can use sequential numbers too


In the case of repeatable tables is good approach to use idempotent ddl scripts, more info about this: https://www.sqlservercentral.com/steps/idempotent-ddl-scripts-that-always-achieve-the-same-result-making-changes-only-once-stairway-to-exploring-database-metadata-level-6

docker-flyway.config:

flyway.url=jdbc:postgresql://postgres:5432/{db_name}

flyway.user=postgres (postgres user)

flyway.password=123456 (postgres password)

flyway.baselineOnMigrate=false 


First you need to create a db-network: (you can you another name)
docker network create db_network


docker-compose-postgres.yml:

if you dont have a existing db, you can create with this one docker-compose: 

docker-compose -f docker-compose-postgres.yml up -d



if you already have a postgres docker file, please add this network: db-network as it is in postgres docker-compose file


To execute the migration execute flyway docker compose: 
docker-compose -f docker-compose-flyway-migrate.yml up -d
