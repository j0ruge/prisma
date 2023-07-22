# Mapa de conexões

```sql
select * from devices;
select * from device_conections
select * from conections;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp"

insert into conections (id, number, channel_type, conector_type) values(
uuid_generate_v1(),
'03',
'aux_output',
'xlr_macho'
)


insert into conections (id, number, channel_type, conector_type) values(
uuid_generate_v1(),
'08',
'aux_output',
'xlr_macho'
)

insert into device_conections(id, "deviceId", "conectionId") values(
uuid_generate_v1(),
'09cfdf87-4568-4147-bd6f-3457fde27ce7',
'ca69f1e4-1dce-11ee-ba27-0242ac120002'
)

insert into device_conections(id, "deviceId", "conectionId") values(
uuid_generate_v1(),
'09cfdf87-4568-4147-bd6f-3457fde27ce7',
'0ec4751a-1dd1-11ee-ba27-0242ac120002'
)


----

INSERT INTO public.device_conectors (id,"deviceId","conectionId") VALUES
	 ('2e5d9dc6-1dd0-11ee-ba27-0242ac120002','09cfdf87-4568-4147-bd6f-3457fde27ce7','ca69f1e4-1dce-11ee-ba27-0242ac120002'),
	 ('2f9cf4ce-1dd1-11ee-ba27-0242ac120002','09cfdf87-4568-4147-bd6f-3457fde27ce7','0ec4751a-1dd1-11ee-ba27-0242ac120002');



----

select
devices.name as device_name,
conections."number" as port_number,
conections.channel_type,
conections.conector_type 
from devices
join device_conections on device_conections."deviceId" = devices.id 
join conections on conections.id = device_conections."conectionId";
```



 três tabelas principais: "dispositivos", "conectores" e "conexões". Aqui está uma sugestão de como você pode modelar essas tabelas:

    Tabela "dispositivos":
        device_id (chave primária)
        nome_dispositivo
        outros atributos relevantes do dispositivo

    Tabela "conectores":
        connector_id (chave primária)
        nome_conector
        tipo_conector (por exemplo, entrada ou saída)
        outros atributos relevantes do conector

    Tabela "conexões":
        connection_id (chave primária)
        dispositivo_origem_id (chave estrangeira referenciando device_id na tabela "dispositivos")
        conector_origem_id (chave estrangeira referenciando connector_id na tabela "conectores")
        dispositivo_destino_id (chave estrangeira referenciando device_id na tabela "dispositivos")
        conector_destino_id (chave estrangeira referenciando connector_id na tabela "conectores")
        outros atributos relevantes da conexão (por exemplo, tipo de conexão, data de criação, etc.)

Dessa forma, você pode estabelecer a relação de conexões entre os dispositivos e seus conectores. Na tabela "conexões", os campos "dispositivo_origem_id" e "conector_origem_id" representam o dispositivo e o conector que iniciam a conexão, enquanto os campos "dispositivo_destino_id" e "conector_destino_id" representam o dispositivo e o conector que recebem a conexão.

Agora, para criar a relação de conexões entre dispositivos da mesma tabela "dispositivos", você precisará definir as chaves estrangeiras "dispositivo_origem_id" e "dispositivo_destino_id" para referenciarem a coluna "device_id" na tabela "dispositivos". Essa abordagem permite que você conecte um dispositivo a outro na mesma tabela.

Lembre-se de ajustar os atributos e campos de acordo com as necessidades específicas do seu sistema e as características dos dispositivos de áudio que você está gerenciando. Além disso, não se esqueça de definir as restrições de integridade referencial nas chaves estrangeiras para garantir que as conexões estejam sempre associadas a dispositivos e conectores existentes na base de dados.

## relacionamentos

    Tabela "dispositivos":
        Não há uma relação explícita com outra tabela nesta modelagem. Esta tabela representa uma entidade independente que armazena informações sobre os dispositivos de áudio. Cada dispositivo possui um ID único (device_id) como chave primária para identificação.

    Tabela "conectores":
        Não há uma relação explícita com outra tabela nesta modelagem. Essa tabela representa outra entidade independente que armazena informações sobre os conectores dos dispositivos de áudio. Cada conector possui um ID único (connector_id) como chave primária para identificação.

    Tabela "conexões":

        Esta tabela possui duas relações com a tabela "dispositivos":
            A coluna "dispositivo_origem_id" é uma chave estrangeira que referencia o "device_id" na tabela "dispositivos". Isso indica que a conexão tem um dispositivo de origem que está registrado na tabela "dispositivos".
            A coluna "dispositivo_destino_id" é outra chave estrangeira que referencia o "device_id" na tabela "dispositivos". Isso indica que a conexão tem um dispositivo de destino que também está registrado na tabela "dispositivos".

        Além disso, a tabela "conexões" possui duas relações com a tabela "conectores":
            A coluna "conector_origem_id" é uma chave estrangeira que referencia o "connector_id" na tabela "conectores". Isso indica que a conexão tem um conector de origem registrado na tabela "conectores".
            A coluna "conector_destino_id" é outra chave estrangeira que referencia o "connector_id" na tabela "conectores". Isso indica que a conexão tem um conector de destino registrado na tabela "conectores".

Essas relações permitem conectar as informações sobre as conexões de dispositivos de áudio com as informações dos próprios dispositivos e seus conectores correspondentes. Com esse modelo, você pode facilmente rastrear as conexões entre dispositivos e seus detalhes associados. As chaves estrangeiras garantem a integridade referencial e a consistência dos dados, evitando conexões inválidas com dispositivos ou conectores que não existam na base de dados.
