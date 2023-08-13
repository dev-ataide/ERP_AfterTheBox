/*
  Warnings:

  - Added the required column `email` to the `cliente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numberContact` to the `cliente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "cliente" ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "numberContact" TEXT NOT NULL;
