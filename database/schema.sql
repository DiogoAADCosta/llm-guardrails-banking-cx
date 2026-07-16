-- Tabela de Clientes: Guarda as informações cadastrais e sensíveis (Protegida)
CREATE TABLE tbl_clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,          -- CPF formatado ou apenas números
    email TEXT NOT NULL UNIQUE,
    conta TEXT NOT NULL,               -- Número da conta corrente
    segmento TEXT CHECK(segmento IN ('Varejo', 'Exclusive', 'Prime'))
);

-- Tabela de Feedbacks: Guarda apenas a interação, sem repetir dados sensíveis
CREATE TABLE tbl_feedbacks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    data_comentario TEXT NOT NULL,    -- Formato YYYY-MM-DD
    canal TEXT NOT NULL CHECK(canal IN ('App', 'Chat', 'Agência', 'Ouvidoria')),
    produto TEXT NOT NULL CHECK(produto IN ('Pix', 'Cartão de Crédito', 'Empréstimo', 'Atendimento')),
    nota_satisfacao INTEGER CHECK(nota_satisfacao BETWEEN 1 AND 5),
    texto_feedback TEXT NOT NULL,     -- O texto onde o cliente pode ter escrito bobagem (como o próprio CPF de novo)
    FOREIGN KEY(cliente_id) REFERENCES tbl_clientes(id)
);
