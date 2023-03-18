# Notas

Evelin nos informou que com relação ao ```Brados de Júbilo```, existem duas versões, a nova e a antiga, e o número dos hinos foi alterado segundo ela, então devemos verificar como resolver esta questão neste modleo de dados. 

## SEED

### Colaboradores

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp"
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Jorge Luis de Oliveira Ferrari');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Luiz Carlos Trindade');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Carlos Alberto da Silva');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Abimael Correa Rocha');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Sirley Correa Rocha Ferrari Barbosa');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Abisai Varela');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Mirian Mendes');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Paulo Amaral');
insert into colaboradores(id, nome) values(uuid_generate_v1(),'Daniele Lopes');

```

### Cultos

```sql
--data_culto no formato YYYY-MM-DD
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
insert into cultos(id, data_culto, periodo_culto, dia_semana_culto) values(uuid_generate_v1(),'2022-12-17', 'Manhã', 'Sábado');
insert into cultos(id, data_culto, periodo_culto, dia_semana_culto) values(uuid_generate_v1(),'2022-12-21', 'Manhã', 'Sábado');
insert into cultos(id, data_culto, periodo_culto, dia_semana_culto) values(uuid_generate_v1(),'2022-12-24', 'Manhã', 'Sábado');
```

### Brados de Júbilo

```sql  
--hinos do brado
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
insert into brado_de_jubilo(id, numero_brado , nome_musica, versao_brado) values(uuid_generate_v1(),200, 'Sobre as ondas do Mar', 'antiga');
```