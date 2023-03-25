-- CreateTable
CREATE TABLE "versao_biblia" (
    "id" TEXT NOT NULL,
    "nome_versao" TEXT NOT NULL,

    CONSTRAINT "versao_biblia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "texto_biblico_versao_biblia" (
    "id" TEXT NOT NULL,
    "id_texto_biblico" TEXT NOT NULL,
    "id_versao_biblia" TEXT NOT NULL,

    CONSTRAINT "texto_biblico_versao_biblia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "texto_biblico" (
    "id" TEXT NOT NULL,
    "livro" TEXT NOT NULL,
    "capitulo" INTEGER NOT NULL,
    "versiculo" INTEGER NOT NULL,

    CONSTRAINT "texto_biblico_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "versao_biblia_id_key" ON "versao_biblia"("id");

-- CreateIndex
CREATE UNIQUE INDEX "texto_biblico_versao_biblia_id_key" ON "texto_biblico_versao_biblia"("id");

-- CreateIndex
CREATE UNIQUE INDEX "texto_biblico_id_key" ON "texto_biblico"("id");

-- AddForeignKey
ALTER TABLE "texto_biblico_versao_biblia" ADD CONSTRAINT "texto_biblico_versao_biblia_id_texto_biblico_fkey" FOREIGN KEY ("id_texto_biblico") REFERENCES "texto_biblico"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "texto_biblico_versao_biblia" ADD CONSTRAINT "texto_biblico_versao_biblia_id_versao_biblia_fkey" FOREIGN KEY ("id_versao_biblia") REFERENCES "versao_biblia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
