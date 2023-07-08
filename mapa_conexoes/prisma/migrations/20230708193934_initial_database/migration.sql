-- CreateTable
CREATE TABLE "Device" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Device_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeviceConetion" (
    "id" SERIAL NOT NULL,
    "deviceId" INTEGER NOT NULL,
    "conectionId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeviceConetion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Conection" (
    "id" SERIAL NOT NULL,
    "deviceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Conection_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DeviceConetion" ADD CONSTRAINT "DeviceConetion_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceConetion" ADD CONSTRAINT "DeviceConetion_conectionId_fkey" FOREIGN KEY ("conectionId") REFERENCES "Conection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
