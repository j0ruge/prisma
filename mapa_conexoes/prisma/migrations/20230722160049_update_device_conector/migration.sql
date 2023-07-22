/*
  Warnings:

  - You are about to drop the column `conectiorId` on the `device_conectors` table. All the data in the column will be lost.
  - Added the required column `conectorId` to the `device_conectors` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "device_conectors" DROP CONSTRAINT "device_conectors_conectiorId_fkey";

-- AlterTable
ALTER TABLE "device_conectors" DROP COLUMN "conectiorId",
ADD COLUMN     "conectorId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "device_conectors" ADD CONSTRAINT "device_conectors_conectorId_fkey" FOREIGN KEY ("conectorId") REFERENCES "conectors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
