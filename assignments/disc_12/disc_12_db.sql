
create table records as
	select "Ben Bitdiddle" as name, "Computer" as division, "Wizard" as title, 60000 as salary, "Oliver Warbucks" as supervisor union
	select "Alyssa P Hacker",	"Computer",				"Programmer",					40000,	"Ben Bitdiddle"	union
	select "Cy D Fect",				"Computer",				"Programmer",					35000,	"Ben Bitdiddle"	union
	select "Lem E Tweakit",		"Computer",				"Technician",					25000,	"Ben Bitdiddle"	union
	select "Louis Reasoner",	"Computer",				"Programmer Trainee",	30000,	"Alyssa P Hacker" union
	select "Oliver Warbucks",	"Administration",	"Big Wheel",					150000,	"Oliver Warbucks" union
	select "Eben Scrooge",		"Accounting",			"Chief Accountant",		75000,	"Oliver Warbucks" union
	select "Robert Cratchet",	"Accounting",			"Scrivener",					18000,	"Eben Scrooge" union;

--------------------------------------------------------------------------------

create table meetings as
	select "Accounting" as division,	"Monday" as day,	"9am" as time	union
	select "Computer",								"Wednesday",			"4pm"					union
	select "Administration",					"Monday",					"11am"				union
	select "Administration",					"Wednesday",			"4pm"					union


--------------------------------------------------------------------------------

-- Q2.1

select name from records where supervisor = "Oliver Warbucks";

-- Q2.2

select * from records where name = supervisor;

-- Q2.3

select name from records where salary > 50000 order by name;

--------------------------------------------------------------------------------

-- Q3.1

select m.day, m.time from records as r, meetings as m
	where supervisor = "Oliver Warbucks" and r.division = m.division;

-- Q3.2

select e.name from records as e, records as s
	where e.supervisor = s.name and e.division != s.division;

-- Q3.3

select e1.name, e2.name from records as e1, records as e2, meetings as m1, meetings as m2
	where e1.division = m1.division
		and e2.division = m2.division
		and m1.day = m2.day
		and m1.time = m2.time
 		and e1.name < e2.name;

--------------------------------------------------------------------------------

-- Q4.1

select supervisor, sum(salary) from records group by supervisor;

-- Q4.2

select len(name) from records as r, meetings as s
	where r.division = m.division
	group by m.day
	having len(name) < 5;

-- Q4.3

select e1.division from records as e1, records as e2
	where e1.division = e2.division and e1.name < e2.name
	group by e1.division
	having max(e1.salary + e2.salary) < 100000;
