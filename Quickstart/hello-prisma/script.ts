import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

interface User {
  name: string,
  email: string
}

async function createUser (newUser: { name: string, email: string }): Promise<User | undefined>  {
  const user = await prisma.user.create({
    data: {
      name: newUser.name,
      email: newUser.email,
    },
  });  
  return user as User | undefined;
}

async function main() {
  const user = await createUser({name:'gab', email:'jo@com.br' });
  /** 
    const usersWithPosts = await prisma.user.findMany({

        include: {
    
          posts: true,
    
        },
    
      })
    
      console.dir(usersWithPosts, { depth: null })
      */
     console.log(user);
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
