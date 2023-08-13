
import { Router, Request, Response } from "express";
// import { CreateAccountController } from "../CSU/controller/AccountController/createAccountController";


const router = Router()

router.get('/teste', (req : Request,res: Response) => {
    return res.json({ServerOn: true})
    // throw new Error('Erro ao realizar a requisição')

})

// Create Account

// router.post('/createaccount', new CreateAccountController().handle)





export {router} ;