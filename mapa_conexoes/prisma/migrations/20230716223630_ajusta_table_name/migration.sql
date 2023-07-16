/*
  Warnings:

  - You are about to drop the `conections` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `device_conections` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "device_conections" DROP CONSTRAINT "device_conections_conectionId_fkey";

-- DropForeignKey
ALTER TABLE "device_conections" DROP CONSTRAINT "device_conections_deviceId_fkey";

-- DropTable
DROP TABLE "conections";

-- DropTable
DROP TABLE "device_conections";

-- CreateTable
CREATE TABLE "device_conectors" (
    "id" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "conectionId" TEXT NOT NULL,

    CONSTRAINT "device_conectors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conectors" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "channel_type" TEXT NOT NULL,
    "conector_type" TEXT NOT NULL,

    CONSTRAINT "conectors_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "device_conectors" ADD CONSTRAINT "device_conectors_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "devices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "device_conectors" ADD CONSTRAINT "device_conectors_conectionId_fkey" FOREIGN KEY ("conectionId") REFERENCES "conectors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
