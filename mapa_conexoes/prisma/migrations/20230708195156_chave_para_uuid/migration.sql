/*
  Warnings:

  - The primary key for the `Conection` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Device` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `DeviceConetion` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "DeviceConetion" DROP CONSTRAINT "DeviceConetion_conectionId_fkey";

-- DropForeignKey
ALTER TABLE "DeviceConetion" DROP CONSTRAINT "DeviceConetion_deviceId_fkey";

-- AlterTable
ALTER TABLE "Conection" DROP CONSTRAINT "Conection_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "deviceId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Conection_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Conection_id_seq";

-- AlterTable
ALTER TABLE "Device" DROP CONSTRAINT "Device_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Device_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Device_id_seq";

-- AlterTable
ALTER TABLE "DeviceConetion" DROP CONSTRAINT "DeviceConetion_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "deviceId" SET DATA TYPE TEXT,
ALTER COLUMN "conectionId" SET DATA TYPE TEXT,
ADD CONSTRAINT "DeviceConetion_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "DeviceConetion_id_seq";

-- AddForeignKey
ALTER TABLE "DeviceConetion" ADD CONSTRAINT "DeviceConetion_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceConetion" ADD CONSTRAINT "DeviceConetion_conectionId_fkey" FOREIGN KEY ("conectionId") REFERENCES "Conection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
