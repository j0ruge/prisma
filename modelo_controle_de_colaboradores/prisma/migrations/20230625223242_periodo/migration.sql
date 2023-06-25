/*
  Warnings:

  - You are about to drop the column `periodo_culto` on the `cultos` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "cultos" DROP COLUMN "periodo_culto";

-- CreateTable
CREATE TABLE "periodo_culto" (
    "id" TEXT NOT NULL,
    "fk_periodo" TEXT NOT NULL,
    "fk_culto" TEXT NOT NULL,

    CONSTRAINT "periodo_culto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "periodo" (
    "id" TEXT NOT NULL,
    "periodo" TEXT NOT NULL,

    CONSTRAINT "periodo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "periodo_culto_id_key" ON "periodo_culto"("id");

-- CreateIndex
CREATE UNIQUE INDEX "periodo_id_key" ON "periodo"("id");

-- AddForeignKey
ALTER TABLE "periodo_culto" ADD CONSTRAINT "periodo_culto_fk_culto_fkey" FOREIGN KEY ("fk_culto") REFERENCES "cultos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "periodo_culto" ADD CONSTRAINT "periodo_culto_fk_periodo_fkey" FOREIGN KEY ("fk_periodo") REFERENCES "periodo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
