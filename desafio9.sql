SELECT COUNT(c.usuario_id) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.Reproductions AS r
INNER JOIN SpotifyClone.Clients AS c
ON usuario = 'Barbara Liskov' AND r.usuario_id = c.usuario_id;