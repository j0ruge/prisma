/*
  Warnings:

  - A unique constraint covering the columns `[culto_id]` on the table `formulario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `culto_id` to the `formulario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "formulario" ADD COLUMN     "culto_id" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "formulario_culto_id_key" ON "formulario"("culto_id");

-- AddForeignKey
ALTER TABLE "formulario" ADD CONSTRAINT "formulario_culto_id_fkey" FOREIGN KEY ("culto_id") REFERENCES "cultos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
