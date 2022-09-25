SELECT a.artists_name AS 'artista',
b.albuns_name AS 'album'
FROM SpotifyClone.Artists AS a
INNER JOIN SpotifyClone.Albuns AS b
ON a.artistas = b.artistas
WHERE a.artists_name = 'Elis Regina';