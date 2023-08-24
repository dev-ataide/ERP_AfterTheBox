import { Request,Response } from "express";

import { CreateAccountService } from "../../services/AccountServices/createAccountService";

class CreateAccountController {
    async handle (req:Request, res: Response){
        const {nameOwner,nameBusiness,email,numberContact,status,password} = req.body;

        const createAccountService = new CreateAccountService();
        const account = await createAccountService.execute({
            nameOwner,
            nameBusiness,
            email,
            numberContact,
            status,
            password
        })
        console.log (account)
        return res.json(account)

    }
}

export {CreateAccountController}