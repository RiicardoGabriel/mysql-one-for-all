DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

  CREATE TABLE SpotifyClone.Plan (
      plan_id INT NOT NULL,
      plan_name VARCHAR(45) NOT NULL,
      plan_value DECIMAL(5,2) NOT NULL,

      CONSTRAINT PRIMARY KEY (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Artists(
      artists_id INT NOT NULL,
      artists_name VARCHAR(45) NOT NULL,

      CONSTRAINT PRIMARY KEY (artists_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Clients(
    client_name VARCHAR(45) NOT NULL,
    client_id INT NOT NULL,
    client_age INT NOT NULL,
    signature_date DATE NOT NULL,
    plan_id INT NOT NULL,

    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.Plan (plan_id),

    CONSTRAINT PRIMARY KEY (client_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.Albuns(
      album_id INT NOT NULL,
      albuns_name VARCHAR(45) NOT NULL,
      albuns_release_year VARCHAR(45) NOT NULL,
      artist_id INT NOT NULL,

      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.Artists(artists_id),
      CONSTRAINT PRIMARY KEY (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Songs(
	  album_artist_id INT NOT NULL,
      songs_id VARCHAR(45) NOT NULL,
      songs_id_num INT NOT NULL,
      duration_id INT NOT NULL,
      artist_id INT NOT NULL,

      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.Artists(artists_id),
      FOREIGN KEY (album_artist_id) REFERENCES SpotifyClone.Albuns(album_id),

      CONSTRAINT PRIMARY KEY (songs_id_num)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.Favorites(
      client_id INT NOT NULL,
      artist_id INT NOT NULL,

      FOREIGN KEY (client_id) REFERENCES SpotifyClone.Clients(client_id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.Artists(artists_id),

      CONSTRAINT PRIMARY KEY(client_id, artist_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.Reproductions(
      reproduction_date DATETIME NOT NULL,
      client_id_reproduction INT NOT NULL,
      song_id_fav INT NOT NULL,
      
      FOREIGN KEY (client_id_reproduction) REFERENCES SpotifyClone.Clients(client_id),
      FOREIGN KEY (song_id_fav) REFERENCES SpotifyClone.Songs(songs_id_num),

      CONSTRAINT PRIMARY KEY(client_id_reproduction, song_id_fav)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Plan (plan_id, plan_name, plan_value)
  VALUES
    (1, 'gratuito', 0),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.Artists (artists_id,artists_name)
  VALUES
  ( 1, 'Beyoncé'),
  ( 2, 'Queen'),
  ( 3, 'Elis Regina'),
  ( 4, 'Baco Exu do Blues'),
  ( 5, 'Blind Guardian'),
  ( 6, 'Nina Simone');

  INSERT INTO SpotifyClone.Clients (client_name, client_age, signature_date, plan_id, client_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1, 1),
    ('Robert Cecil Martin', 58,  '2017-01-06', 1, 2),
    ('Ada Lovelace', 37, '2017-12-30', 2, 3),
    ('Martin Fowler', 46, '2017-01-17', 2, 4),
    ('Sandi Metz', 58, '2018-04-29', 2, 5),
    ('Paulo Freire', 19, '2018-02-14', 3, 6),
    ('Bell Hooks', 26, '2018-01-05', 3, 7),
    ('Christopher Alexander', 85, '2019-06-05', 4, 8),
    ('Judith Butler', 45, '2020-05-13', 4, 9),
    ('Jorge Amado', 58, '2017-02-17', 4, 10);
    
	INSERT INTO SpotifyClone.Albuns (albuns_name, albuns_release_year, album_id, artist_id)
  VALUES
  ('Renaissance', 2022, 1, 1),
  ('Jazz', 1978, 2, 2),
  ('Hot Space', 1982, 3, 2),
  ('Falso Brilhante', 1998, 4, 3),
  ('Vento de Maio', 2001, 5, 3),
  ('QVVJFA?', 2003, 6, 4),
  ('Somewhere Far Beyond', 2007, 7, 5),
  ('I Put A Spell On You', 2012, 8, 6);
    
    INSERT INTO SpotifyClone.Songs (songs_id, duration_id, artist_id, songs_id_num, album_artist_id)
  VALUES
  ('BREAK MY SOUL', 279, 1, 1, 1),
  ('VIRGO’S GROOVE', 369, 1, 2, 1),
  ('ALIEN SUPERSTAR', 116, 1, 3, 1),
  ('Don’t Stop Me Now', 203, 2, 4, 2),
  ('Under Pressure', 152, 2, 5, 3),
  ('Como Nossos Pais', 105, 3, 6, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 7, 5),
  ('Samba em Paris', 267, 4, 8, 6),
  ('The Bard’s Song', 244, 5, 9, 7),
  ('Feeling Good', 100, 6, 10, 8);

INSERT INTO SpotifyClone.Reproductions (reproduction_date, song_id_fav, client_id_reproduction)
  VALUES
    ('2022-02-28 10:45:55', 8, 1),
    ('2020-05-02 05:30:35', 2, 1),
    ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2),
    ('2020-01-02 07:40:33', 7, 2),
    ('2020-11-13 16:55:13', 10, 3),
    ('2020-12-05 18:38:30', 2, 3 ),
    ('2021-08-15 17:10:10', 8, 4),
    ('2022-01-09 01:44:33', 8, 5),
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 7, 6),
    ('2017-10-12 12:35:20', 1, 6),
    ('2011-12-15 22:30:49', 4, 7),
    ('2012-03-17 14:56:41', 4, 8),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);

  INSERT INTO SpotifyClone.Favorites (client_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
