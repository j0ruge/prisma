/*
  Warnings:

  - You are about to drop the column `conectorId` on the `device_conectors` table. All the data in the column will be lost.
  - You are about to drop the column `deviceId` on the `device_conectors` table. All the data in the column will be lost.
  - Added the required column `conector_id` to the `device_conectors` table without a default value. This is not possible if the table is not empty.
  - Added the required column `device_id` to the `device_conectors` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "device_conectors" DROP CONSTRAINT "device_conectors_conectorId_fkey";

-- DropForeignKey
ALTER TABLE "device_conectors" DROP CONSTRAINT "device_conectors_deviceId_fkey";

-- AlterTable
ALTER TABLE "device_conectors" DROP COLUMN "conectorId",
DROP COLUMN "deviceId",
ADD COLUMN     "conector_id" TEXT NOT NULL,
ADD COLUMN     "device_id" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "conections" (
    "id" TEXT NOT NULL,
    "source_device_id" TEXT NOT NULL,
    "destination_device_id" TEXT NOT NULL,

    CONSTRAINT "conections_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "device_conectors" ADD CONSTRAINT "device_conectors_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "devices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "device_conectors" ADD CONSTRAINT "device_conectors_conector_id_fkey" FOREIGN KEY ("conector_id") REFERENCES "conectors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conections" ADD CONSTRAINT "conections_source_device_id_fkey" FOREIGN KEY ("source_device_id") REFERENCES "devices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conections" ADD CONSTRAINT "conections_destination_device_id_fkey" FOREIGN KEY ("destination_device_id") REFERENCES "devices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
