/*
  Warnings:

  - You are about to drop the `Setor` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "timePorSetor" DROP CONSTRAINT "timePorSetor_sectorId_fkey";

-- DropTable
DROP TABLE "Setor";

-- CreateTable
CREATE TABLE "setor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "setor_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "timePorSetor" ADD CONSTRAINT "timePorSetor_sectorId_fkey" FOREIGN KEY ("sectorId") REFERENCES "setor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
