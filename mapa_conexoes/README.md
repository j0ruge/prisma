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