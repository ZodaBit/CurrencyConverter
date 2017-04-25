

CREATE TABLE MyCurrency_tbl (
   Id int not null identity(1,1),
   Currency varchar(10) not null,
   Rate varchar(15) not null,
   Dateme date not null,
  PRIMARY KEY NONCLUSTERED ([Id] ASC) 

)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY)
GO
