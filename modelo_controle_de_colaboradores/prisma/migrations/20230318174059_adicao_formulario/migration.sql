/*
  Warnings:

  - Added the required column `versao_brado` to the `brado_de_jubilo` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "brado_de_jubilo" ADD COLUMN     "versao_brado" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "formulario" (
    "id" TEXT NOT NULL,
    "colaborador_id" TEXT NOT NULL,
    "resposta_formulario" TIMESTAMP(3) NOT NULL,
    "observacao_formulario" TEXT NOT NULL,

    CONSTRAINT "formulario_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "formulario_id_key" ON "formulario"("id");

-- AddForeignKey
ALTER TABLE "formulario" ADD CONSTRAINT "formulario_colaborador_id_fkey" FOREIGN KEY ("colaborador_id") REFERENCES "colaboradores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
