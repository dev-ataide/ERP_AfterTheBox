import prismaClient from "../../../prisma";

interface SectorRequest {
    name : string
    accountId: number
}

class CreateSectorByAccountService {
    async execute({name,accountId}:SectorRequest){
        if (name === '' || name === " "){
            throw new Error('Nome invalido')
        }


    const sector = await prismaClient.sector.create({
        data:{
            name:name,
            accountId: accountId,
        },
        select:{
            id:true,
            name:true
        }
    })
  return sector;  

  }
}

export {CreateSectorByAccountService}
