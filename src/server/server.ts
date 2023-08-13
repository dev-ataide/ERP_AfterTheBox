import express,{Request,Response, NextFunction} from 'express'
import 'express-async-errors'
import cors from 'cors'

import { router } from '../routes/routes';

const app = express();
app.use(express.json());
app.use(cors());
app.use(router);

//Tratamento de erros a partir de um midwerlr

app.use((erro:Error, req:Request, res:Response, next:NextFunction)=>{
    if(erro instanceof Error){
        // Se ocorrer uma intance do tipo Error
        return res.status(400).json({
            erro: erro.message
        })
    }
    return res.status(500).json({
        status: 'error',
        message: 'Internal Server Error'
    })
})



app.listen(3030, () => console.log('The Server is Open in the : http://localhost:3030/ '))