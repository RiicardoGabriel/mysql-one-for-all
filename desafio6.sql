SELECT MIN(valor_plano) AS 'faturamento_minimo',
ROUND(MAX(valor_plano), 2) AS 'faturamento_maximo',
ROUND(AVG(valor_plano), 2) AS 'faturamento_medio',
ROUND(SUM(valor_plano), 2) AS 'faturamento_total'
FROM SpotifyClone.Clients, SpotifyClone.Plan
WHERE Clients.plano_id = Plan.plano_id;
