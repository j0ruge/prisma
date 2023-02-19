/*
  Warnings:

  - You are about to drop the column `funcao_culto` on the `cultos` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "cultos" DROP COLUMN "funcao_culto";

-- CreateTable
CREATE TABLE "culto_colaborador" (
    "id" TEXT NOT NULL,
    "id_culto" TEXT NOT NULL,
    "id_colaborador" TEXT NOT NULL,
    "funcao_culto" TEXT NOT NULL,

    CONSTRAINT "culto_colaborador_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "culto_colaborador_id_key" ON "culto_colaborador"("id");

-- AddForeignKey
ALTER TABLE "culto_colaborador" ADD CONSTRAINT "culto_colaborador_id_culto_fkey" FOREIGN KEY ("id_culto") REFERENCES "cultos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "culto_colaborador" ADD CONSTRAINT "culto_colaborador_id_colaborador_fkey" FOREIGN KEY ("id_colaborador") REFERENCES "colaboradores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
