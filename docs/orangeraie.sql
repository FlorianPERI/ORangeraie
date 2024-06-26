BEGIN;

SET client_encoding = 'UTF8';

CREATE TABLE family (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name text NOT NULL UNIQUE
);

CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, scientific_name text NOT NULL UNIQUE, common_name text, family_id int NOT NULL REFERENCES family (id)
);

CREATE TABLE variety (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, cultivar text NOT NULL, bitterness smallint CHECK (
        bitterness >= 0
        AND bitterness <= 5
    ), juiciness smallint CHECK (
        juiciness >= 0
        AND juiciness <= 5
    ), species_id int NOT NULL REFERENCES species (id), UNIQUE (cultivar, species_id) -- il ne peut pas y avoir 2 cultivar du même nom pour une même espèce
);

CREATE TABLE field(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name text NOT NULL UNIQUE, location text
);

CREATE TABLE ROW (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, label text NOT NULL, field_id int NOT NULL REFERENCES field(id), variety_id int NOT NULL REFERENCES variety (id)
);

INSERT INTO
    family (name)
VALUES ('orange'),
    ('pamplemousse'),
    ('citron'),
    ('mandarine'),
    ('clémentine'),
    ('kumquat');

INSERT INTO
    species (
        scientific_name, common_name, family_id
    )
VALUES (
        'Citrus sinensis L.', 'orange douce', 1
    ),
    (
        'Citrus aurantium L.', 'orange amère', 1
    ),
    (
        'Citrus maxima', 'pamplemousse', 2
    ),
    (
        'Citrus × paradisi', 'pomelo', 2
    ),
    (
        'Citrus × tangelo', 'tangelo', 2
    ),
    (
        'Citrus × limon', 'citron jaune', 3
    ),
    (
        'Citrus medica L.', 'cédrat', 3
    ),
    (
        'Citrus hystrix', 'combava', 3
    ),
    (
        'Citrus aurantiifolia', 'citron vert', 3
    ),
    (
        'Citrus bergamia', 'bergamote', 3
    ),
    (
        'Citrus × clementina', 'clémentine', 5
    ),
    (
        'Citrus reticulata', 'mandarine', 4
    ),
    (
        'Citrus ×tangerina', 'tangerine', 4
    ),
    (
        'Citrus japonica', 'kumquat', 6
    ),
    (
        'Citrus × floridana', 'limequat', 6
    );

INSERT INTO
    variety (
        cultivar, bitterness, juiciness, species_id
    )
VALUES ('Osbeck', 4, 5, 1),
    ('Moro', 5, 5, 1),
    ('Sanguinello', 2, 5, 1),
    ('Hook', 3, 0, 2),
    ('Honey', 5, 3, 3),
    ('Sweetie', 2, 5, 3),
    ('Chandler', 2, 1, 3),
    ('Oro blanco', 0, 1, 4),
    ('Rio star', 2, 2, 4),
    ('Seminole', 2, 1, 5),
    ('Bonnie Brae', 0, 0, 6),
    ('Eureka', 3, 5, 6),
    ('Etrog', 2, 2, 7),
    ('Sarcodactylis', 3, 4, 7),
    ('Westeri', 4, 0, 8),
    ('sur Macrophylla', 0, 3, 9),
    ('Bergamia', 0, 0, 10),
    ('Algérienne', 3, 2, 11),
    ('Clémenvilla', 5, 1, 11),
    ('Clémenule', 3, 4, 11),
    ('Deliciosa', 4, 5, 12),
    ('Tachibana', 3, 1, 12),
    ('Ponkan', 0, 4, 12),
    ('Tanger', 3, 3, 13),
    ('Moragne', 0, 5, 13),
    ('Dancy', 5, 1, 13),
    ('Marumi', 5, 3, 14),
    ('Meiwa', 0, 1, 14),
    ('Swinglei', 5, 4, 14),
    ('Eustis', 0, 4, 15),
    ('Margarita', 5, 0, 15);

INSERT INTO
    field(name, location)
VALUES (
        'domaine principal', 'Haut Cloques, derrière l''église'
    ),
    (
        'chez Fabien', '11 rue de la mairie, Tarsul'
    ),
    (
        'jardin participatif O''penfarm', 'champ du Chapiteau Cloque, Brémont-sur-Tizouille'
    ),
    (
        'extension O''penfarm', 'champ du Président Tission, Brémont-sur-Tizouille'
    ),
    (
        'serre expérimentale', 'ZI Novarea, Tambrun-le-Neuf'
    );

INSERT INTO
    "row" (label, field_id, variety_id)
VALUES ('1', 1, 10),
    ('2', 1, 1),
    ('3', 1, 5),
    ('4', 1, 26),
    ('5', 1, 17),
    ('6', 1, 31),
    ('7', 1, 31),
    ('8', 1, 4),
    ('9', 1, 23),
    ('10', 1, 26),
    ('11', 1, 2),
    ('12', 1, 12),
    ('13', 1, 3),
    ('14', 1, 6),
    ('15', 1, 4),
    ('16', 1, 18),
    ('17', 1, 26),
    ('18', 1, 8),
    ('19', 1, 14),
    ('20', 1, 23),
    ('21', 1, 15),
    ('22', 1, 10),
    ('23', 1, 8),
    ('24', 1, 19),
    ('25', 1, 17),
    ('26', 1, 8),
    ('27', 1, 12),
    ('28', 1, 18),
    ('29', 1, 31),
    ('30', 1, 10),
    ('31', 1, 22),
    ('32', 1, 9),
    ('33', 1, 11),
    ('34', 1, 26),
    ('35', 1, 4),
    ('36', 1, 27),
    ('37', 1, 26),
    ('38', 1, 3),
    ('39', 1, 31),
    ('40', 1, 18),
    ('41', 1, 28),
    ('42', 1, 1),
    ('43', 1, 29),
    ('44', 1, 31),
    ('45', 1, 7),
    ('46', 1, 1),
    ('47', 1, 17),
    ('48', 1, 2),
    ('49', 1, 8),
    ('50', 1, 30),
    ('1', 2, 14),
    ('2', 2, 14),
    ('3', 2, 14),
    ('4', 2, 14),
    ('5', 2, 14),
    ('6', 2, 14),
    ('7', 2, 14),
    ('8', 2, 14),
    ('9', 2, 14),
    ('10', 2, 14),
    ('11', 2, 14),
    ('12', 2, 14),
    ('13', 2, 14),
    ('14', 2, 14),
    ('15', 2, 14),
    ('16', 2, 17),
    ('17', 2, 17),
    ('18', 2, 17),
    ('19', 2, 17),
    ('20', 2, 17),
    ('21', 2, 17),
    ('22', 2, 17),
    ('23', 2, 17),
    ('24', 2, 17),
    ('1', 3, 24),
    ('2', 3, 23),
    ('3', 3, 9),
    ('4', 3, 31),
    ('5', 3, 11),
    ('6', 3, 26),
    ('7', 3, 7),
    ('8', 3, 22),
    ('9', 3, 12),
    ('10', 3, 7),
    ('11', 3, 1),
    ('12', 3, 2),
    ('13', 3, 16),
    ('14', 3, 11),
    ('15', 3, 27),
    ('16', 3, 20),
    ('17', 3, 6),
    ('18', 3, 22),
    ('19', 3, 23),
    ('20', 3, 5),
    ('21', 3, 8),
    ('22', 3, 20),
    ('1', 4, 6),
    ('2', 4, 5),
    ('3', 4, 19),
    ('4', 4, 13),
    ('5', 4, 5),
    ('6', 4, 4),
    ('7', 4, 14),
    ('8', 4, 13),
    ('9', 4, 3),
    ('10', 4, 7),
    ('11', 4, 4),
    ('1', 5, 31),
    ('2', 5, 31),
    ('3', 5, 31),
    ('4', 5, 31),
    ('5', 5, 31),
    ('6', 5, 31),
    ('7', 5, 31),
    ('8', 5, 31);

COMMIT;