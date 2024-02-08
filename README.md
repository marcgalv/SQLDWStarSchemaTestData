# SQLDWStarSchemaTestData
Scripts to Generate a SQL Start Schema with Simple way to ingest Test Data

# SQL Server Database Data Warehouse Star Schema

You can use the scripts in this repository to create a SQL Server Database Data Warehouse Star schema. The simplicity of this approach allows you to easily modify the scripts to create as many dimensions as you need as well as measures in the Fact Table. I also created stored procedures do ingest fake data on the tables.

The amount of records on the fact table will be defined by the number of records in the dimension tables. The fact table will contain a record for every possible combination of keys with the dimension tables. So… if you have 3 dimension tables with 10 records in each. The Fact table will be populated with 10X10X10 records.

The initial model is named as a sales DW, but you can easily modify the names or add more dimensions if you need just adapting the scripts.

Have fun!
