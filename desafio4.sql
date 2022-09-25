SELECT u.usuario AS 'usuario',
CASE WHEN MAX(YEAR(r.data_reproducao) >= 2021) THEN 'Usuário ativo' ELSE 'Usuário inativo' END AS 'status_usuario'
FROM SpotifyClone.Clients AS u
INNER JOIN SpotifyClone.Reproductions AS r
ON u.usuario_id = r.usuario_id
GROUP BY u.usuario_id
ORDER BY u.usuario;