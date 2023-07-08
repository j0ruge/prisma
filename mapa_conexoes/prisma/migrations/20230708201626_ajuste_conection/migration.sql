/*
  Warnings:

  - You are about to drop the column `createdAt` on the `conections` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `conections` table. All the data in the column will be lost.
  - Added the required column `channel_type` to the `conections` table without a default value. This is not possible if the table is not empty.
  - Added the required column `conection_type` to the `conections` table without a default value. This is not possible if the table is not empty.
  - Added the required column `number` to the `conections` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "conections" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "channel_type" TEXT NOT NULL,
ADD COLUMN     "conection_type" TEXT NOT NULL,
ADD COLUMN     "number" TEXT NOT NULL;
