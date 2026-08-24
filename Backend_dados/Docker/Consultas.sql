SET SEARCH_PATH TO projetoDados2025_v2;


------------- Contar Colaboradores por Empresa ------------
SELECT e."Nome_Empresa", COUNT(ce."idColaborador") AS total_colaboradores
FROM "projetoDados2025_v2".empresa AS e
	INNER JOIN "projetoDados2025_v2".colaborador_empresa AS ce ON e."Id_Empresa"  = ce."Id_Empresa" 
GROUP BY e."Nome_Empresa" 
ORDER BY total_colaboradores DESC;


 ------------ Consulta para Encontrar Colaboradores com Certificação mas sem estar alocado em Epresa Parceira (Interno da T2M)------------ 
SELECT c."Nome", c."Email", c."idColaborador", cert."Certificacao"
FROM "projetoDados2025_v2".colaborador AS c
	 JOIN "projetoDados2025_v2".colaborador_certificacao AS cc ON c."idColaborador" = cc."idColaborador"
	 JOIN "projetoDados2025_v2".certificacao AS cert ON cc."idCertificacao" = cert."idCertificacao"
LEFT JOIN "projetoDados2025_v2".colaborador_empresa AS ce ON c."idColaborador" = ce."idColaborador"
WHERE ce."Id_Empresa" = 11;

--------------- Distribuição de Soft Skills por Cidade -----------------
SELECT ci."Cidade", ss."Soft_Skills", COUNT(cs."idColaborador" ) AS total_colaboradores
FROM "projetoDados2025_v2".cidade AS ci
INNER JOIN "projetoDados2025_v2".colaborador AS c ON ci."idCidade" = c."idCidade"
	  JOIN "projetoDados2025_v2".colaborador_softskills AS cs ON c."idColaborador" = cs."idColaborador" 
	  JOIN "projetoDados2025_v2".softskills AS ss ON cs."idSoft_Skills" = ss."idSoft_Skills" 
GROUP BY ci."Cidade", ss."Soft_Skills"
ORDER BY ci."Cidade", total_colaboradores DESC;


-----------  Identificar as Competências Mais Comuns Por Empresa ----------- 
SELECT comp."Nome_Competencia", comp."Nivel_Competencia", COUNT(sc."Id_Competencia") AS total_servicos_exigem
	FROM "projetoDados2025_v2".competencia AS comp
	JOIN "projetoDados2025_v2".servico_competencia AS sc ON comp."Id_Competencia" = sc."Id_Competencia"
GROUP BY comp."Nome_Competencia", comp."Nivel_Competencia"
ORDER BY total_servicos_exigem DESC
LIMIT 5;