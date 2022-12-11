--Discente: Ademilton Amaro Mariano
CREATE TABLE tecnicos (
    id_tecnico SERIAL PRIMARY KEY,
    nome_tecnico   VARCHAR(50) NOT NULL
);

CREATE TABLE clinica_solicitante (
    nome_clinica       VARCHAR(50) NOT NULL,
    cnpj_clinica       VARCHAR(14) PRIMARY KEY NOT NULL,
    logradouro_clinica VARCHAR(50) NOT NULL,
    cep_clinica        VARCHAR(8) NOT NULL,
    telefone_clinica   VARCHAR(13) NOT NULL
);

CREATE TABLE veterinarios (
    crmv_veterinario          VARCHAR(50) PRIMARY KEY NOT NULL,
    nome_veterinario          VARCHAR(50) NOT NULL,
    especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE pets (
    nome_pet     VARCHAR(50) NOT NULL,
    id_pet   SERIAL PRIMARY KEY,
    especie  VARCHAR(50) NOT NULL,
    idade    VARCHAR(20) NOT NULL
);

CREATE TABLE exames (
    cod_exame          SERIAL PRIMARY KEY,
    data_exame               DATE NOT NULL,
    cnpj_clinica            VARCHAR(14) NOT NULL,
    id_tecnico          INTEGER NOT NULL,
    FOREIGN KEY (cnpj_clinica) REFERENCES clinica_solicitante (cnpj_clinica)
     ON DELETE CASCADE, 
     FOREIGN KEY (id_tecnico) REFERENCES tecnicos (id_tecnico)
     ON DELETE CASCADE 
);

CREATE TABLE tutores (
    nome_tutor                        VARCHAR(50) NOT NULL,
    cpf_tutor                         VARCHAR(11) PRIMARY KEY NOT NULL,
    logradouro_tutor                  VARCHAR(50) NOT NULL,
    cep_tutor                         VARCHAR(8) NOT NULL,
    telefone_tutor                    VARCHAR(13) NOT NULL,
    cnpj_clinica                     VARCHAR(14) NOT NULL,
    FOREIGN KEY (cnpj_clinica) REFERENCES clinica_solicitante (cnpj_clinica)
    ON DELETE CASCADE 
);

CREATE TABLE consultas (
    data_consulta                   DATE NOT NULL,
    cod_consulta           SERIAL PRIMARY KEY,
    crmv_veterinario                VARCHAR(50) NOT NULL,
    cnpj_clinica                VARCHAR(14) NOT NULL,
    id_pet              INTEGER NOT NULL,
    FOREIGN KEY (crmv_veterinario) REFERENCES veterinarios (crmv_veterinario)
    ON DELETE CASCADE,
    FOREIGN KEY (cnpj_clinica) REFERENCES clinica_solicitante (cnpj_clinica)
    ON DELETE CASCADE,
    FOREIGN KEY (id_pet) REFERENCES pets (id_pet)
    ON DELETE CASCADE 
);

CREATE TABLE propriedade (
    cpf_tutor    VARCHAR(11) NOT NULL,
    id_pet INTEGER NOT NULL,
    PRIMARY KEY (cpf_tutor, id_pet),
    FOREIGN KEY (cpf_tutor) REFERENCES tutores (cpf_tutor)
    ON DELETE CASCADE, 
    FOREIGN KEY (id_pet) REFERENCES PETS (id_pet)
    ON DELETE CASCADE 
    );

--foi usado o SGBD PostgreSQL