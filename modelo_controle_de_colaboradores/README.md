

## Modelo do Banco

[Modelo do banco](https://whimsical.com/controle-de-colaboradores-NCfn3yiGWKYDsZrRFaAtEw)


## Installation

```shell
yarn init -y
```

###  Initialize a TypeScript project and add the Prisma CLI as a development dependency to it:

```shell
yarn add prisma typescript ts-node @types/node --save-dev
```
### Init TypeScript:
```shell
yarn tsc --init
```
### Invoke Prisma
```shell
yarn prisma
```


###  Creating your Prisma schema

```shell
yarn prisma init
```

Next steps:
1. Set the **DATABASE_URL** in the .env file to point to your existing database. If your database has no tables yet, read https://pris.ly/d/getting-started
2. Set the provider of the datasource block in schema.prisma to match your database: *postgresql*, *mysql*, *sqlite*, *sqlserver*, *mongodb* or *cockroachdb*.
3. Run yarn prisma db pull to turn your database schema into a Prisma schema.
4. Run yarn prisma generate to generate the Prisma Client. You can then start querying your database.

## Connect to DataSource

Via `prisma/schema.prisma`

* Becouse our DataBase is postgresql
 
```javascript
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

{NOTE}: Need to adjust the .env file to match your database

`postgresql://USER:PASSWORD@HOST:PORT/DATABASE?schema=SCHEMA
`

Here's a short explanation of each component:

    USER: The name of your database user
    PASSWORD: The password for your database user
    HOST: The name of your host name (for the local environment, it is localhost)
    PORT: The port where your database server is running (typically 5432 for PostgreSQL)
    DATABASE: The name of the database
    SCHEMA: The name of the schema inside the database

```

## Using Prisma Migrate

```shell
yarn prisma migrate dev --name init
```

To map your data model to the database schema, you need to use the prisma migrate CLI commands:



## Install Prisma Client

```shell
yarn add @prisma/client
```


{NOTE}: Whenever you make changes to your Prisma schema in the future, you manually need to invoke `prisma generate` in order to accommodate the changes in your Prisma Client API.


### Querying the database
```shell
yarn ts-node index.ts
```


### Explore the data in Prisma Studio

```shell
yarn prisma studio
```

## Prisma Builder

Atrávés do [Prisma Builder](https://www.prismabuilder.io/schemas) conseguimos de maneira visual gerar o schema do banco de dados como o abaixo.


```Typescript
model culto {
  id               String       @id @unique @default(cuid())
  data_culto       DateTime
  periodo_culto    String
  dia_semana_culto String
  colaborador_id   colaborador? @relation(fields: [colaboradorId], references: [id])
  funcao_culto     String
  solo_playback    String?
  colaboradorId    String?
}

model colaborador {
  id    String  @id @unique @default(cuid())
  nome  String
  culto culto[]
}
```


----------------------------------------------------------------
## Reference

* [Connect your database](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases/connect-your-database-typescript-postgres)

* [Using Prisma Migrate](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases/using-prisma-migrate-typescript-postgres)

* [Install Prisma Client](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases/install-prisma-client-typescript-postgres)
* [Querying the database](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases/querying-the-database-typescript-postgres)
