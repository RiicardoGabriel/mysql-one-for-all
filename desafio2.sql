SELECT COUNT(*) AS cancoes,
    (SELECT COUNT(*) FROM `SpotifyClone`.Artists) AS artistas,
    (SELECT COUNT(*) FROM `SpotifyClone`.Albuns) AS albuns
FROM `SpotifyClone`.Songs;