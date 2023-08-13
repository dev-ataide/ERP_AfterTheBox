-- AlterTable
CREATE SEQUENCE cliente_userid_seq;
ALTER TABLE "cliente" ALTER COLUMN "userId" SET DEFAULT nextval('cliente_userid_seq');
ALTER SEQUENCE cliente_userid_seq OWNED BY "cliente"."userId";
