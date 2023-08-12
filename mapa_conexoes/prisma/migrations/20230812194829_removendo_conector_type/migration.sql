/*
  Warnings:

  - You are about to drop the column `conectorTypeId` on the `conectors` table. All the data in the column will be lost.
  - You are about to drop the column `conector_type` on the `conectors` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "conectors" DROP CONSTRAINT "conectors_conectorTypeId_fkey";

-- AlterTable
ALTER TABLE "conectors" DROP COLUMN "conectorTypeId",
DROP COLUMN "conector_type",
ADD COLUMN     "conector_type_id" TEXT;

-- AddForeignKey
ALTER TABLE "conectors" ADD CONSTRAINT "conectors_conector_type_id_fkey" FOREIGN KEY ("conector_type_id") REFERENCES "conector_types"("id") ON DELETE SET NULL ON UPDATE CASCADE;
