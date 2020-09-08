CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size from dogs, sizes where min < height and height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
	-- Using 3 tables:
  -- SELECT c.name from dogs as c, parents as p, dogs as p_data
		-- where p.child = c.name and p.parent = p_data.name
		-- order by p_data.height desc;
	-- Using 2 tables:
	SELECT child from parents, dogs where parent = name order by height desc;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
	-- Using 4 tables:
  -- SELECT c1.name as sibling1, c2.name as sibling2
		-- from dogs as c1, dogs as c2, parents as p1, parents as p2
		-- where c1.name = p1.child and c2.name = p2.child and p1.parent = p2.parent
		-- 	and c1.name < c2.name
		-- order by c1.name, c2.name;
	-- Using 2 tables:
	SELECT p1.child as sibling1, p2.child as sibling2
		from parents as p1, parents as p2
		where p1.parent = p2.parent and sibling1 < sibling2;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT sibling1 || " and " || sibling2 || " are " || sz1.size || " siblings"
		from siblings, size_of_dogs as sz1, size_of_dogs as sz2
		where sibling1 = sz1.name and sibling2 = sz2.name and sz1.size = sz2.size
		order by sibling1, sibling2;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
insert into stacks_helper select name, height, height from dogs;

insert into stacks_helper select dogs || ", " || name, stack_height + height,
	height from stacks_helper, dogs where height > last_height;

-- Using distinct to keep distinct DOGS stacks.
insert into stacks_helper select distinct dogs || ", " || name, stack_height + height,
	height from stacks_helper, dogs where height > last_height;

insert into stacks_helper select distinct dogs || ", " || name, stack_height + height,
	height from stacks_helper, dogs where height > last_height;

CREATE TABLE stacks AS
	-- Note that we are not filtering stacks of 3 dogs of fewer. It just happens
	-- that there are only stacks with just 4 dogs with stack_height >= 170.
	-- To correct this we could add an extra column with the number of stacks
	-- done so far, and filtering those rows which have less dogs than the max.
  SELECT dogs, stack_height from stacks_helper where stack_height >= 170
		order by stack_height;
