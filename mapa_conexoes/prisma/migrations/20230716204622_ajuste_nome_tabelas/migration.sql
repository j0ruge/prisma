/*
  Warnings:

  - You are about to drop the `DeviceManufacturer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Manufacturer` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DeviceManufacturer" DROP CONSTRAINT "DeviceManufacturer_deviceId_fkey";

-- DropForeignKey
ALTER TABLE "DeviceManufacturer" DROP CONSTRAINT "DeviceManufacturer_manufacturerId_fkey";

-- DropTable
DROP TABLE "DeviceManufacturer";

-- DropTable
DROP TABLE "Manufacturer";

-- CreateTable
CREATE TABLE "device_manufacturers" (
    "id" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "manufacturerId" TEXT NOT NULL,

    CONSTRAINT "device_manufacturers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "manufacturers" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "manufacturers_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "device_manufacturers" ADD CONSTRAINT "device_manufacturers_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "devices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "device_manufacturers" ADD CONSTRAINT "device_manufacturers_manufacturerId_fkey" FOREIGN KEY ("manufacturerId") REFERENCES "manufacturers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
