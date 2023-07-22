/*
  Warnings:

  - Added the required column `destination_conector_id` to the `conections` table without a default value. This is not possible if the table is not empty.
  - Added the required column `source_conector_id` to the `conections` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "conections" ADD COLUMN     "destination_conector_id" TEXT NOT NULL,
ADD COLUMN     "source_conector_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "conections" ADD CONSTRAINT "conections_source_conector_id_fkey" FOREIGN KEY ("source_conector_id") REFERENCES "conectors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conections" ADD CONSTRAINT "conections_destination_conector_id_fkey" FOREIGN KEY ("destination_conector_id") REFERENCES "conectors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
