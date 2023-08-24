import { Request,Response } from "express";
import { CreateSectorByAccountService } from "../../services/SetorServices/createSetorService";

class CreateSectorByAccountController{
    async handle(req:Request,res:Response){
        const createSectorByAccountService = new CreateSectorByAccountService()

        const name = req.body.name;
        const accountId = req.body.accountId


        const sector = await createSectorByAccountService.execute({
            name,
            accountId
        })
        
        return res.json(sector)
    }
}


export {CreateSectorByAccountController}