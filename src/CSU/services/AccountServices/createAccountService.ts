// import prismaClient from "../../../prisma";

// interface AccountRequest{
//     name:   string;
//     nameBusiness: string;
//     userid: number;
//     email:  string;
//     numberContact: string;
//     status: boolean;
//     password:   string;
// }

// class CreateAccountService{
//     async execute({name,nameBusiness,userid,email,numberContact,status,password}: AccountRequest){

//         //Verificação de email presente na interface
//         if(email == '' || email == " "){
//             throw new Error ("Email Inexistente no Body da Requisição")
//         }

//         //Verificação de email já cadastrado
//         const AccountExists = await prismaClient.account.findFirst({
//             where:{
//                 email:email
//             }
//         })

//         if (AccountExists){
//             console.log("Email já cadastrado")
//             throw new Error ("Email já cadastrado")
//         }

//         const Account = await prismaClient.account.create({
//             data:{
//                 nameOwner: name,
//                 nameBusiness : nameBusiness,
//                 userId : userid,
//                 email : email,
//                 numberContact: numberContact,
//                 status: status,
//                 password: password,
//             },
//        })
//         console.log(Account)
//         return Account;
//     }
 
// }

// export {CreateAccountService}