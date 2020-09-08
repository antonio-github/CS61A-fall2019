.read fa19data.sql

CREATE TABLE obedience AS
  SELECT seven, instructor from students;

CREATE TABLE smallest_int AS
  SELECT time, smallest from students where smallest > 2
		order by smallest limit 20;

CREATE TABLE matchmaker AS
  SELECT t1.pet, t1.song, t1.color, t2.color
		from students as t1, students as t2
		where t1.time < t2.time
			and t1.pet = t2.pet
			and t1.song = t2.song;
