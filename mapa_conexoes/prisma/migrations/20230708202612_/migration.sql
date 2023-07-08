/*
  Warnings:

  - You are about to drop the column `conection_type` on the `conections` table. All the data in the column will be lost.
  - Added the required column `conector_type` to the `conections` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "conections" DROP COLUMN "conection_type",
ADD COLUMN     "conector_type" TEXT NOT NULL;
