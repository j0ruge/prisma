/*
  Warnings:

  - You are about to drop the column `solo_playback` on the `cultos` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "cultos" DROP COLUMN "solo_playback";

-- CreateTable
CREATE TABLE "brado_de_jubilo" (
    "id" TEXT NOT NULL,
    "numero_brado" INTEGER NOT NULL,
    "nome_musica" TEXT NOT NULL,

    CONSTRAINT "brado_de_jubilo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "culto_brado_de_jubilo" (
    "id" TEXT NOT NULL,
    "id_culto" TEXT NOT NULL,
    "id_brados_de_jubilo" TEXT NOT NULL,

    CONSTRAINT "culto_brado_de_jubilo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "brado_de_jubilo_id_key" ON "brado_de_jubilo"("id");

-- CreateIndex
CREATE UNIQUE INDEX "culto_brado_de_jubilo_id_key" ON "culto_brado_de_jubilo"("id");

-- AddForeignKey
ALTER TABLE "culto_brado_de_jubilo" ADD CONSTRAINT "culto_brado_de_jubilo_id_culto_fkey" FOREIGN KEY ("id_culto") REFERENCES "cultos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "culto_brado_de_jubilo" ADD CONSTRAINT "culto_brado_de_jubilo_id_brados_de_jubilo_fkey" FOREIGN KEY ("id_brados_de_jubilo") REFERENCES "brado_de_jubilo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
