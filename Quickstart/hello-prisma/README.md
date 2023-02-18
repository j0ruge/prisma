# prisma

Runing the script with `yarn  ts-node script.ts` 

### Create a new User record

```javascript
 const user = await prisma.user.create({
    data: {
      name: 'Alice',
      email: 'alice@prisma.io',
    },
  })
  console.log(user)
```

* Output:
```shell
{ id: 1, email: 'alice@prisma.io', name: 'Alice' }
```
----------------------------------------------------------------

### Retrieve all User records


```javascript
  const users = await prisma.user.findMany()
  console.log(users)
```

* Output:
```shell
{ id: 1, email: 'alice@prisma.io', name: 'Alice' }
```

----------------------------------------------------------------

### Explore relation queries with Prisma

#### scalar fields only

```javascript
  const user = await prisma.user.create({

    data: {

      name: 'Bob',

      email: 'bob@prisma.io',

      posts: {

        create: {

          title: 'Hello World',

        },

      },

    },

  })

  console.log(user)
```

* Output:
```shell
{ id: 2, email: 'bob@prisma.io', name: 'Bob' }
```

####  retrieve the Post records that belong to a User

```javascript
  const usersWithPosts = await prisma.user.findMany({

    include: {

      posts: true,

    },

  })

  console.dir(usersWithPosts, { depth: null })
```

* Output:
```shell
[
  { id: 1, email: 'alice@prisma.io', name: 'Alice', posts: [] },
  {
    id: 2,
    email: 'bob@prisma.io',
    name: 'Bob',
    posts: [
      {
        id: 1,
        title: 'Hello World',
        content: null,
        published: false,
        authorId: 2
      }
    ]
  }
]
```

## Explore the data in Prisma Studio

```shell
yarn prisma studio
```

## Reference

* (Prisma Quickstart)[https://www.prisma.io/docs/getting-started/quickstart]