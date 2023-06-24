-- CreateTable
CREATE TABLE "culto_dia_semanal" (
    "id" TEXT NOT NULL,
    "fk_culto" TEXT NOT NULL,
    "fk_dia_semanal" TEXT NOT NULL,

    CONSTRAINT "culto_dia_semanal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dia_semanal" (
    "id" TEXT NOT NULL,
    "dia_semana" TEXT NOT NULL,

    CONSTRAINT "dia_semanal_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "culto_dia_semanal_id_key" ON "culto_dia_semanal"("id");

-- CreateIndex
CREATE UNIQUE INDEX "dia_semanal_id_key" ON "dia_semanal"("id");

-- AddForeignKey
ALTER TABLE "culto_dia_semanal" ADD CONSTRAINT "culto_dia_semanal_fk_culto_fkey" FOREIGN KEY ("fk_culto") REFERENCES "cultos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "culto_dia_semanal" ADD CONSTRAINT "culto_dia_semanal_fk_dia_semanal_fkey" FOREIGN KEY ("fk_dia_semanal") REFERENCES "dia_semanal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
