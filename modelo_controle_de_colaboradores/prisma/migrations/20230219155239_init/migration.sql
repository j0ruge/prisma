-- CreateTable
CREATE TABLE "culto" (
    "id" TEXT NOT NULL,
    "data_culto" TIMESTAMP(3) NOT NULL,
    "periodo_culto" TEXT NOT NULL,
    "dia_semana_culto" TEXT NOT NULL,
    "funcao_culto" TEXT NOT NULL,
    "solo_playback" TEXT,
    "colaboradorId" TEXT,

    CONSTRAINT "culto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "colaborador" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "colaborador_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "culto_id_key" ON "culto"("id");

-- CreateIndex
CREATE UNIQUE INDEX "colaborador_id_key" ON "colaborador"("id");

-- AddForeignKey
ALTER TABLE "culto" ADD CONSTRAINT "culto_colaboradorId_fkey" FOREIGN KEY ("colaboradorId") REFERENCES "colaborador"("id") ON DELETE SET NULL ON UPDATE CASCADE;
