SELECT *
FROM family
WHERE
    family.id NOT IN(
        SELECT DISTINCT
            family_id
        FROM species
        WHERE
            species.id IN (
                SELECT species_id
                FROM variety
                GROUP BY
                    species_id
                HAVING
                    AVG(juiciness) >= 2.5
            )
    );

SELECT *
FROM "field"
WHERE
    id IN ( 
        SELECT DISTINCT
            "field_id"
        FROM "row"
        WHERE
            "variety_id" IN ( 
                SELECT "id"
                FROM "variety"
                WHERE
                    "species_id" IN ( 
                        SELECT "id"
                        FROM "species"
                        WHERE
                            "family_id" IN ( 
                                SELECT "id"
                                FROM "family"
                                WHERE
                                    "name" = 'mandarine' 
                            )
                    )
            )
    );

SELECT
    scientific_name,
    common_name,
    family.name AS family_name,
    MAX(variety.bitterness) AS bitterness_values,
    ARRAY_AGG (ROW.label) AS labels,
    ARRAY_AGG (FIELD.name) AS field_names
FROM
    species
    JOIN family ON species.family_id = family.id
    JOIN variety ON variety.species_id = species.id
    JOIN ROW ON ROW.variety_id = variety.id
    JOIN FIELD ON FIELD.id = ROW.field_id
WHERE
    bitterness = 5
GROUP BY
    scientific_name,
    common_name,
    family.name;

SELECT FIELD.*
FROM
    FIELD
    JOIN ROW ON FIELD.id = ROW.field_id
    JOIN variety ON ROW.variety_id = variety.id
    JOIN species ON variety.species_id = species.id
    JOIN family ON species.family_id = family.id
WHERE
    family.name = 'mandarine'
GROUP BY
    FIELD.id;
