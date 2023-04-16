-- CreateTable
CREATE TABLE "culto_texto_biblico" (
    "id" TEXT NOT NULL,
    "id_culto" TEXT NOT NULL,
    "id_texto_biblico" TEXT NOT NULL,

    CONSTRAINT "culto_texto_biblico_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "culto_texto_biblico_id_key" ON "culto_texto_biblico"("id");

-- AddForeignKey
ALTER TABLE "culto_texto_biblico" ADD CONSTRAINT "culto_texto_biblico_id_culto_fkey" FOREIGN KEY ("id_culto") REFERENCES "cultos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "culto_texto_biblico" ADD CONSTRAINT "culto_texto_biblico_id_texto_biblico_fkey" FOREIGN KEY ("id_texto_biblico") REFERENCES "texto_biblico"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
