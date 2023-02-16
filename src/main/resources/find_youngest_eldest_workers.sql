CREATE TABLE youngest_eldest_workers(
	type VARCHAR PRIMARY KEY,
	name VARCHAR,
	birthday DATE,
);

ALTER TABLE youngest_eldest_workers ADD CONSTRAINT check_youngest_eldest_workers_type CHECK(type IN ('YOUNGEST', 'ELDEST'));

INSERT INTO youngest_eldest_workers (type, name, birthday)
    VALUES ('YOUNGEST',
        (SELECT name FROM worker WHERE birthday=(SELECT MAX(birthday) FROM worker)),
        (SELECT birthday FROM worker WHERE birthday=(SELECT MAX(birthday) FROM worker)));

INSERT INTO youngest_eldest_workers (type, name, birthday)
    VALUES ('ELDEST',
        (SELECT name FROM worker WHERE birthday=(SELECT MIN(birthday) FROM worker)),
        (SELECT birthday FROM worker WHERE birthday=(SELECT MIN(birthday) FROM worker)));

SELECT * FROM youngest_eldest_workers;
