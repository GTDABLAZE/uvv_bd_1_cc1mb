WITH RECURSIVE classificacao_geral
AS ( SELECT codigo, nome, codigo_pai, CAST (nome AS TEXT) AS estrutura
FROM classificacao
WHERE codigo_pai IS NULL
UNION ALL
SELECT c.codigo, cg.nome, c.codigo_pai, CAST(cg.estrutura || ' -> ' || c.nome AS TEXT)
FROM classificacao c
INNER JOIN classificacao_geral cg ON c.codigo_pai = cg.codigo)
SELECT estrutura AS "Estrutura", codigo_pai AS "Código pai"
FROM classificacao_geral cg
ORDER BY estrutura;
