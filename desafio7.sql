SELECT a.artists_name AS 'artista',
b.albuns_name AS 'album', COUNT(f.artistas) AS 'seguidores'
FROM SpotifyClone.Artists AS a
INNER JOIN SpotifyClone.Albuns AS b
ON a.artistas = b.artistas
INNER JOIN SpotifyClone.Favorites AS f
ON f.artistas = a.artistas
GROUP BY a.artists_name, b.albuns_name
ORDER BY COUNT(f.artistas) DESC, a.artists_name, b.albuns_name;