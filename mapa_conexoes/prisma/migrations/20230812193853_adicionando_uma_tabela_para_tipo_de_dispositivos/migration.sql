-- AlterTable
ALTER TABLE "conectors" ADD COLUMN     "conectorTypeId" TEXT;

-- CreateTable
CREATE TABLE "conector_types" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "conector_types_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "conectors" ADD CONSTRAINT "conectors_conectorTypeId_fkey" FOREIGN KEY ("conectorTypeId") REFERENCES "conector_types"("id") ON DELETE SET NULL ON UPDATE CASCADE;
