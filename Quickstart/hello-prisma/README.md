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