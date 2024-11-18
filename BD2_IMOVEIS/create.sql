CREATE TABLE IMO_CLIENTE_COMPRADOR (
    id_cliente_comprador int not null PRIMARY KEY,
    nome varchar(50) not null,
    cpf varchar (14) not null,
    contato varchar(15) not null,
    
)

CREATE TABLE IMO_agente (
    id_agente int not null PRIMARY KEY,
    nome varchar(50) not null,
    creci varchar (14) not null,
    contato varchar(15) not null,
    historico varchar(150)
    
)

CREATE TABLE IMO_IMOVEL (
    id_imovel int not null PRIMARY KEY,
    tipo varchar(50)  not null,
    endereco varchar (200)  not null,
    area float not null,
    numero_quartos int not null,
    numero_banheiros int not null,
    garagem int not null,
    descricao varchar(500),
    preco float not null,
    tipo_negocio varchar(10) not null,
    status varchar(20) not null;
    data_cadastro date not null;
    
    
)

CREATE TABLE IMO_PROPRIETARIO (
    id_proprietario int not null PRIMARY KEY,
    nome varchar(50) not null,
    contato varchar (14) not null,
    CPF_CNPJ varchar(30) not null,
    endereco varchar(150),
    historico_imoveis 
    
)

CREATE TABLE IMO_CONTRATO_LOCACAO (
    id_contrato_locacao int not null PRIMARY KEY,                 
    data_inicio DATE NOT NULL,             
    data_termino DATE,                     
    valor_mensal NUMERIC(10, 2),           
    valor_total NUMERIC(15, 2),            
    status VARCHAR(20) NOT NULL
    id_inquilino_comprador INT NOT NULL,   
    id_proprietario INT NOT NULL,          
    id_imovel INT NOT NULL,            


    CONSTRAINT fk_inquilino_comprador FOREIGN KEY (id_inquilino_comprador) REFERENCES IMO_CLIENTE_COMPRADOR (id_cliente_comprador),
    CONSTRAINT fk_proprietario FOREIGN KEY (id_proprietario) REFERENCES IMO_PROPRIETARIO(id_proprietario),
    CONSTRAINT fk_imovel FOREIGN KEY (id_imovel) REFERENCES IMO_IMOVEL (id_imovel)

);


CREATE TABLE IMO_PAGAMENTOS (
    id_pagamentos float not null PRIMARY KEY,                   
    data_pagamento DATE NOT NULL,            
    valor NUMERIC(10, 2) NOT NULL,           
    metodo_pagamento VARCHAR(20) NOT NULL CHECK (metodo_pagamento IN ('cartão', 'boleto', 'transferência')),
    id_contrato INT NOT NULL,                
    CONSTRAINT fk_contrato FOREIGN KEY (id_contrato_locacao) REFERENCES IMO_CONTRATO_LOCACAO (id_contrato_locacao)
);

CREATE TABLE IMO_AGENTE_IMOBILIARIO (
    id_agente_imobiliario int not null PRIMARY KEY,                  
    nome VARCHAR(100) NOT NULL,              
    CRECI VARCHAR(20) NOT NULL UNIQUE,       
    contato VARCHAR(150),                    
    historico_imoveis TEXT 
);                  

CREATE TABLE IMO_VISITA (
id_visita int PRIMARY KEY not null,
data date not null,
hora timestamp not null,
id_imovel int not null,                  

CONSTRAINT fk_visita_imovel FOREIGN KEY (id_imovel) REFERENCES IMO_IMOVEL (id_imovel),
CONSTRAINT fk_visita_comprador FOREIGN KEY (id_inquilino_comprador) REFERENCES IMO_CLIENTE_COMPRADOR (id_cliente_comprador),
CONSTRAINT fk_visita_agente FOREIGN KEY (id_agente_imobiliario) REFERENCES IMO_AGENTE_IMOBILIARIO
);

CREATE TABLE  IMO_AVALIACAO (
 id_avaliacao int PRIMARY KEY,                 
 id_imovel int not null,                 
 id_inquilino_comprador int not null,
 nota INT NOT NULL,
 comentario varchar(250),                         
 data date not null
 hora TIMESTAMP DEFAULT NOW(),  
 
 CONSTRAINT fk_avaliacao_imovel FOREIGN KEY (id_imovel) REFERENCES IMO_IMOVEL (id_imovel),
 CONSTRAINT fk_avaliacao_comprador FOREIGN KEY (id_inquilino_comprador) REFERENCES IMO_CLIENTE_COMPRADOR (id_inquilino_comprador)
);

