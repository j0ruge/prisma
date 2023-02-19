/*
  Warnings:

  - You are about to drop the `colaborador` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `culto` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "culto" DROP CONSTRAINT "culto_colaboradorId_fkey";

-- DropTable
DROP TABLE "colaborador";

-- DropTable
DROP TABLE "culto";

-- CreateTable
CREATE TABLE "cultos" (
    "id" TEXT NOT NULL,
    "data_culto" TIMESTAMP(3) NOT NULL,
    "periodo_culto" TEXT NOT NULL,
    "dia_semana_culto" TEXT NOT NULL,
    "funcao_culto" TEXT NOT NULL,
    "solo_playback" TEXT,
    "colaboradorId" TEXT,

    CONSTRAINT "cultos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "colaboradores" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "colaboradores_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cultos_id_key" ON "cultos"("id");

-- CreateIndex
CREATE UNIQUE INDEX "colaboradores_id_key" ON "colaboradores"("id");

-- AddForeignKey
ALTER TABLE "cultos" ADD CONSTRAINT "cultos_colaboradorId_fkey" FOREIGN KEY ("colaboradorId") REFERENCES "colaboradores"("id") ON DELETE SET NULL ON UPDATE CASCADE;
