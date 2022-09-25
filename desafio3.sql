SELECT u.usuario AS 'usuario', COUNT(r.usuario_id) AS 'qt_de_musicas_ouvidas',
ROUND(SUM(s.duracao_segundos / 60), 2) AS 'total_minutos'
FROM SpotifyClone.Clients AS u
INNER JOIN SpotifyClone.Reproductions AS r
ON u.usuario_id = r.usuario_id
INNER JOIN SpotifyClone.Songs AS s
ON r.songs_id_num = s.songs_id_num
GROUP BY u.usuario_id
ORDER BY u.usuario;