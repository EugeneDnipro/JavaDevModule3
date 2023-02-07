CREATE TABLE worker(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR NOT NULL,
	birthday DATE,
	level VARCHAR NOT NULL,
	salary INTEGER
);
ALTER TABLE worker ADD CONSTRAINT check_worker_name CHECK(LENGTH(name) >= 2 AND LENGTH(name) <= 1000);
ALTER TABLE worker ADD CONSTRAINT check_worker_birthday CHECK(year (birthday) > 1900 );