
import { Router, Request, Response } from "express";
import { CreateAccountController } from "../CSU/controller/AccountController/createAccountController";
import { CreateSectorByAccountController } from "../CSU/controller/SetorCrontroller/createSetorController";


const router = Router()

router.get('/teste', (req : Request,res: Response) => {
    return res.json({ServerOn: true})
    // throw new Error('Erro ao realizar a requisição')

})

// Create Account

router.post('/createaccount', new CreateAccountController().handle)


// Create Sector By Account

router.post('/CreateSectorByAccountController', new CreateSectorByAccountController().handle)


export {router} ;