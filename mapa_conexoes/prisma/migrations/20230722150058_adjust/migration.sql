/*
  Warnings:

  - You are about to drop the column `conectionId` on the `device_conectors` table. All the data in the column will be lost.
  - Added the required column `conectiorId` to the `device_conectors` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "device_conectors" DROP CONSTRAINT "device_conectors_conectionId_fkey";

-- AlterTable
ALTER TABLE "device_conectors" DROP COLUMN "conectionId",
ADD COLUMN     "conectiorId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "device_conectors" ADD CONSTRAINT "device_conectors_conectiorId_fkey" FOREIGN KEY ("conectiorId") REFERENCES "conectors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
