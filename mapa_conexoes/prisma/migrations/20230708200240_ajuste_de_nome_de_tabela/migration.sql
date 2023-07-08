/*
  Warnings:

  - You are about to drop the `Conection` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Device` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DeviceConection` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DeviceConection" DROP CONSTRAINT "DeviceConection_conectionId_fkey";

-- DropForeignKey
ALTER TABLE "DeviceConection" DROP CONSTRAINT "DeviceConection_deviceId_fkey";

-- DropTable
DROP TABLE "Conection";

-- DropTable
DROP TABLE "Device";

-- DropTable
DROP TABLE "DeviceConection";

-- CreateTable
CREATE TABLE "devices" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "devices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "device_conections" (
    "id" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "conectionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "device_conections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conections" (
    "id" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "conections_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "device_conections" ADD CONSTRAINT "device_conections_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "devices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "device_conections" ADD CONSTRAINT "device_conections_conectionId_fkey" FOREIGN KEY ("conectionId") REFERENCES "conections"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
