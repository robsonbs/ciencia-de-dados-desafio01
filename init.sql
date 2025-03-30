CREATE TABLE turmas (
  id SERIAL PRIMARY KEY,
  sigla VARCHAR(10) NOT NULL UNIQUE,
  capacidade INTEGER,
  ano_semestre VARCHAR(10) NOT NULL
);

CREATE TABLE disciplinas (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  codigo VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE salas (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(10) NOT NULL,
  capacidade INTEGER
);

CREATE TABLE predios (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(10) NOT NULL,
  endereco VARCHAR(100)
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  codigo VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE curriculos (
  id SERIAL PRIMARY KEY,
  obrigatorio INTEGER DEFAULT 0 CHECK (obrigatorio IN (0, 1)) --, -- 0 = optativa, 1 = obrigatória
  -- curso_id INTEGER REFERENCES cursos(id),
  -- disciplina_id INTEGER REFERENCES disciplinas(id)
);

ALTER TABLE curriculos ADD COLUMN curso_id INTEGER NOT NULL,
ADD CONSTRAINT fk_curriculos_curso FOREIGN KEY (curso_id) REFERENCES cursos(id);

ALTER TABLE curriculos ADD COLUMN disciplina_id INTEGER NOT NULL,
ADD CONSTRAINT fk_curriculos_disciplina FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id);

ALTER TABLE turmas ADD COLUMN disciplina_id INTEGER NOT NULL,
ADD CONSTRAINT fk_turmas_disciplina FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id);

ALTER TABLE turmas ADD COLUMN sala_id INTEGER NOT NULL,
ADD CONSTRAINT fk_turmas_sala FOREIGN KEY (sala_id) REFERENCES salas(id);

ALTER TABLE salas ADD COLUMN predio_id INTEGER NOT NULL,
ADD CONSTRAINT fk_salas_predio FOREIGN KEY (predio_id) REFERENCES predios(id);

\d+ public.*