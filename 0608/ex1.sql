/* LISTAR TOODAS AS CONTAS A PAGAR
NOME DO FORNECEDOR, CIDADE, VALOR, SITUAÇÃO*/

SELECT f.nome, c.nome, cp.valor, cp.situacao
FROM fornecedor f, cidade c, contapagar co
WHERE f.idfornecedor = c.idfornecedor
 and f.idfornecedor = ci.idcidade;