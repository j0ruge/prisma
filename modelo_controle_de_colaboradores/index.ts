import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

interface Colaborador {
  nome: string,
}

async function createColaborador (newColaborador: { name: string }): Promise<Colaborador | undefined>  {
  const colaborador = await prisma..create({
    data: {
      nome: newColaborador.nome,      
    },
  });  
  return colaborador as Colaborador | undefined;
}


async function main() {
  // ... you will write your Prisma Client queries here
  await prisma.user.create({
    data: {
      name: 'Alice',
      email: 'alice@prisma.io',
      posts: {
        create: { title: 'Hello World' },
      },
      profile: {
        create: { bio: 'I like turtles' },
      },
    },
  })

  const allUsers = await prisma.user.findMany({
    include: {
      posts: true,
      profile: true,
    },
  })

  console.dir(allUsers, { depth: null })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
