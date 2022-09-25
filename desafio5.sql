SELECT s.cancoes AS 'cancao',
COUNT(r.songs_id_num) AS 'reproducoes'
FROM SpotifyClone.Songs AS s
INNER JOIN SpotifyClone.Reproductions AS r
ON s.songs_id_num = r.songs_id_num
GROUP BY r.songs_id_num
ORDER BY COUNT(r.songs_id_num) DESC, s.cancoes LIMIT 2;