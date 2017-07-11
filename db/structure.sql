CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "cursos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "codigo" varchar, "nome" varchar, "titulo" varchar, "creditos" integer, "turno" varchar, "modalidade" varchar);
CREATE TABLE "disciplinas" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nome" varchar, "codigo" varchar, "creditos" integer, "departamento" varchar);
CREATE TABLE "alunos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nome" varchar, "email" varchar, "semestre" varchar, "curso_id" integer, "password_digest" varchar, "foto" varchar);
CREATE INDEX "index_alunos_on_curso_id" ON "alunos" ("curso_id");
CREATE TABLE "resultados" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "mencao" varchar, "comentario" text, "semestre" varchar, "aluno_id" integer, "disciplina_id" integer);
CREATE INDEX "index_resultados_on_aluno_id" ON "resultados" ("aluno_id");
CREATE INDEX "index_resultados_on_disciplina_id" ON "resultados" ("disciplina_id");
CREATE TABLE "fluxos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "periodo" integer, "curso_id" integer, "disciplina_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_fluxos_on_curso_id" ON "fluxos" ("curso_id");
CREATE INDEX "index_fluxos_on_disciplina_id" ON "fluxos" ("disciplina_id");
CREATE TABLE "item_fluxos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "periodo" integer, "curso_id" integer, "disciplina_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_item_fluxos_on_curso_id" ON "item_fluxos" ("curso_id");
CREATE INDEX "index_item_fluxos_on_disciplina_id" ON "item_fluxos" ("disciplina_id");
INSERT INTO schema_migrations (version) VALUES ('20161026002057'), ('20161026043114'), ('20161026044221'), ('20161026051111'), ('20161205204952'), ('20161211002831'), ('20161211031957');


