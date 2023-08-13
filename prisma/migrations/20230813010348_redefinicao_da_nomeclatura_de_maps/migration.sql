/*
  Warnings:

  - Added the required column `nameBusiness` to the `cliente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nameOwner` to the `cliente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "cliente" ADD COLUMN     "nameBusiness" TEXT NOT NULL,
ADD COLUMN     "nameOwner" TEXT NOT NULL;
