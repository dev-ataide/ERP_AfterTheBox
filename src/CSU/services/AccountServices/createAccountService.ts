import prismaClient from "../../../prisma";

interface AccountRequest{
    nameOwner:   string;
    nameBusiness: string;
    email:  string;
    numberContact: string;
    status: boolean;
    password:   string;
}

class CreateAccountService{
    async execute({nameOwner,nameBusiness,email,numberContact,status,password}: AccountRequest){

       // Serve para definir a proxima data de pagamento em 30 dias após a criação da conta
        const currentDate = new Date();
        const nextBillingDate = new Date(currentDate);
        nextBillingDate.setDate(currentDate.getDate() + 30);
 
        const accountStatus: boolean = status
        //Verificação de email presente na interface
        if(email == '' || email == " "){
            throw new Error ("Email Inexistente no Body da Requisição")
        }

        //Verificação de email já cadastrado
        const AccountExists = await prismaClient.account.findFirst({
            where:{
                email:email
            }
        }) 

        if (AccountExists){
            console.log("Email já cadastrado")
            throw new Error ("Email já cadastrado")
        }

        if (accountStatus === false){
            throw new Error("Pagamento nao realizado");
            return;
        }

        const Account = await prismaClient.account.create({
            data: {
                nameOwner: nameOwner,
                nameBusiness: nameBusiness,
                email: email,
                numberContact: numberContact,
                status: accountStatus,
                password: password,
                subscriptions: {
                  create: {
                    startDate: new Date(),
                    endDate: nextBillingDate,
                    paymentMethod: 'Cartão de Crédito',
                    paymentStatus: status,
                    nextBillingDate: nextBillingDate,
                  },
                },
              },
              include: {
                subscriptions: true,
              },
            });
        console.log(Account)
        return Account;
    }

    
 
}

export {CreateAccountService}