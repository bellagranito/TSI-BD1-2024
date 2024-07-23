/* 1) Você foi contratado para montar um banco de dados em uma loja. Criar um banco chamado Mercado_SeuNome
Tabela Fornecedor
Campos                  Tipo        Chave primária          Característica
Codigo_fornec           Inteiro         Sim                     não nulo
Nome                    Texto[40]       não                     nulo
Fone                    Texto[20]
Endereco                Texto[40]
Cidade                  Texto[30]                           valor padrão Birigui
Estado                  Texto[2]                            valor padrão SP


Tabela Produto
Campos                  Tipo            Chave primária      Chave Estrangeira           Caracteristica
Cod_produto             inteiro             Sim                                     auto-incremento, não nulo
Nome                    Texto[40]                                                           não nulo
Cod_fornecedor          Inteiro                                     Sim                     não nulo
preço_unitario          Numérico(10,2)
qtde                    Inteiro
*/
