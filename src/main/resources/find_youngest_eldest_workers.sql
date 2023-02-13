CREATE TABLE youngest_eldest_workers(
	type VARCHAR PRIMARY KEY,
	name VARCHAR NOT NULL,
	birthday DATE,
	level VARCHAR NOT NULL,
	salary INTEGER
);
ALTER TABLE worker ADD CONSTRAINT check_worker_name CHECK(LENGTH(name) >= 2 AND LENGTH(name) <= 1000);

CREATE TABLE youngest_eldest_workers SELECT * FROM `student` WHERE mark=(select max(mark) from student)