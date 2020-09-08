.read lab12.sql

CREATE TABLE smallest_int_having AS
  SELECT time, smallest from students
		group by smallest having count(smallest) = 1;

CREATE TABLE fa19favpets AS
  SELECT pet, count(pet) as count_pet from students
		group by pet order by count_pet desc, pet limit 10;

CREATE TABLE fa19dog AS
  SELECT * from fa19favpets where pet = 'dog';

CREATE TABLE obedienceimages AS
  SELECT seven, instructor, count(instructor) from students
		where seven = '7' group by instructor;
