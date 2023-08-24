-- CreateTable
CREATE TABLE "cliente" (
    "id" SERIAL NOT NULL,
    "userId" SERIAL NOT NULL,
    "nameOwner" TEXT NOT NULL,
    "nameBusiness" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numberContact" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subscricao_pagamento" (
    "id" SERIAL NOT NULL,
    "accountId" INTEGER NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "paymentMethod" TEXT NOT NULL,
    "paymentStatus" BOOLEAN NOT NULL,
    "nextBillingDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "subscricao_pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "time" (
    "id" SERIAL NOT NULL,
    "accountId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "time_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "setor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "accountId" INTEGER NOT NULL,

    CONSTRAINT "setor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "timePorSetor" (
    "id" SERIAL NOT NULL,
    "teamId" INTEGER NOT NULL,
    "sectorId" INTEGER NOT NULL,

    CONSTRAINT "timePorSetor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "colaborador" (
    "id" SERIAL NOT NULL,
    "teamId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "payment" DOUBLE PRECISION NOT NULL,
    "paymentMethod" TEXT NOT NULL,

    CONSTRAINT "colaborador_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "despesa" (
    "id" SERIAL NOT NULL,
    "accountId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "despesa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "receita" (
    "id" SERIAL NOT NULL,
    "accountId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "receita_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cliente_userId_key" ON "cliente"("userId");

-- AddForeignKey
ALTER TABLE "subscricao_pagamento" ADD CONSTRAINT "subscricao_pagamento_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "cliente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time" ADD CONSTRAINT "time_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "cliente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "setor" ADD CONSTRAINT "setor_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "cliente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "timePorSetor" ADD CONSTRAINT "timePorSetor_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "time"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "timePorSetor" ADD CONSTRAINT "timePorSetor_sectorId_fkey" FOREIGN KEY ("sectorId") REFERENCES "setor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "colaborador" ADD CONSTRAINT "colaborador_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "time"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
