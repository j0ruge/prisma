/*
  Warnings:

  - You are about to drop the `DeviceConetion` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DeviceConetion" DROP CONSTRAINT "DeviceConetion_conectionId_fkey";

-- DropForeignKey
ALTER TABLE "DeviceConetion" DROP CONSTRAINT "DeviceConetion_deviceId_fkey";

-- DropTable
DROP TABLE "DeviceConetion";

-- CreateTable
CREATE TABLE "DeviceConection" (
    "id" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "conectionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeviceConection_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DeviceConection" ADD CONSTRAINT "DeviceConection_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceConection" ADD CONSTRAINT "DeviceConection_conectionId_fkey" FOREIGN KEY ("conectionId") REFERENCES "Conection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
