# Notas

Evelin nos informou que com relação ao ```Brados de Júbilo```, existem duas versões, a nova e a antiga, e o número dos hinos foi alterado segundo ela, então devemos verificar como resolver esta questão neste modleo de dados. 


# Joins



```sql
-- Retorna os cultos e os colaboradores que participaram do culto
select * from cultos
left join culto_colaborador on culto_colaborador.id_culto = cultos.id
left join colaboradores on colaboradores.id = culto_colaborador.id_colaborador 

```

```sql
select * from cultos
full join culto_colaborador on culto_colaborador.id_culto = cultos.id
full join colaboradores on colaboradores.id = culto_colaborador.id_colaborador 

```

```sql
select * from cultos
left join culto_colaborador on culto_colaborador.id_culto = cultos.id
left join colaboradores on colaboradores.id = culto_colaborador.id_colaborador 
left join formulario on formulario.colaborador_id = colaboradores.id and formulario.culto_id = cultos.id


SELECT 
	formulario.resposta_formulario AS data_envio_formulario,
	colaboradores.nome,
	cultos.data_culto,
	cultos.periodo_culto,
	culto_colaborador.funcao_culto,
	formulario.observacao_formulario 
FROM cultos
LEFT JOIN culto_colaborador ON culto_colaborador.id_culto = cultos.id
LEFT JOIN colaboradores ON colaboradores.id = culto_colaborador.id_colaborador 
LEFT JOIN formulario ON formulario.colaborador_id = colaboradores.id AND formulario.culto_id = cultos.id
```



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

### Cultos Colaboradores

```sql 
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
insert into culto_colaborador(id, id_culto, id_colaborador, funcao_culto) values(uuid_generate_v1(), 'e49d4c86-bba0-11ed-be8c-0242ac120002','f56c4406-baa4-11ed-ad1c-0242ac120002', 'Mensagem');
insert into culto_colaborador(id, id_culto, id_colaborador, funcao_culto) values(uuid_generate_v1(), '6c2fa1b8-bba5-11ed-be8c-0242ac120002','ca953eb0-bb92-11ed-be8c-0242ac120002', 'Solo');


insert into culto_colaborador(id, id_culto, id_colaborador, funcao_culto) values(uuid_generate_v1(), '6c2fb0c2-bba5-11ed-be8c-0242ac120002','ca953172-bb92-11ed-be8c-0242ac120002', 'Mensagem');

```


### Formulários

```sql 
insert into formulario(id, colaborador_id, resposta_formulario, observacao_formulario , culto_id) 
values(uuid_generate_v1(), 'f56c4406-baa4-11ed-ad1c-0242ac120002', '12-16-2022 20:01:36','', 'e49d4c86-bba0-11ed-be8c-0242ac120002');
```

## Dias de Culto

### Culto 17 de Dezembro

'e49d4c86-bba0-11ed-be8c-0242ac120002'

Pastor Luiz
'f56c4406-baa4-11ed-ad1c-0242ac120002'
'Mensagem'

### Culto 21 de Dezembro

'6c2fa1b8-bba5-11ed-be8c-0242ac120002'

Daniele

'ca953eb0-bb92-11ed-be8c-0242ac120002'

'Solo'

### Culto 24 de Dezembro

'6c2fb0c2-bba5-11ed-be8c-0242ac120002'

Paulo Amaral

'ca953172-bb92-11ed-be8c-0242ac120002'
