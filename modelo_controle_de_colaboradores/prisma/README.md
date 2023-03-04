

## SEED

### Colaboradores

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp"
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Jorge Luis de Oliveira Ferrari');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Luiz Carlos Trindade');

```