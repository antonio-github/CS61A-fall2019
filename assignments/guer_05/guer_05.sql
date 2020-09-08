
-- Cannot access to https://links.cs61a.org/guer05 to downlod the SQL file.


-- Q2.1

select name, age from people where age <= 26;


-- Q2.2

select poster, time from posts where time < 230;


-- Q2.3

select name from posts, likes
where name = poster and posts.post_id = likes.post_id;


-- Q2.4

create table friends as
    select r1.friend1 as friend1, r1.friend2 as friend2
    from requests as r1, requests as r2
    where r1.friend1 = r2.friend2 and r1.friend2 = r2.friend1;


-- Q2.5

select friend1 from friends where friend1 != friend2
group by friend1 having count(friend1) >= 4;


-- Q2.6

select state, count(state) from people, friends
where friend1 = "Will", friend2 = name
group by state;


-- Q2.7

select p.text from posts as p, likes as l
where p.post_id = l.post_id and l.time <= 2 + p.time;


-- Q2.8

select p1.name, p2.name, p1.hobby from people as p1, people as p2
where p1.hobby = p2.hobby and p1.name < p2.name


-- Q2.9

select state, count(state) from people group by state order by -count(state);


-- Q2.10

insert into requests(friend1, friend2) values (Denero, Hilfy);


-- Q2.11

insert into requests(friend1, friend2) select Denero, name
    from likes where post_id = 349 and name != Denero;


-- Q2.12

update people set hobby = CS where name = Joe;


-- Q2.13

create table num_likes as
    select posts.poster as name, posts.post_id as post_id,
        count(likes.name) as number
    from posts, likes where posts.post_id = likes.post_id
    group by posts.post_id;


-- Q2.14

delete from posts as p, likes s l, num_likes as nl
    where nl.name = Carolyn and p.poster = Carolyn
        and p.post_id = nl.post_id
        and p.post_id = l.post_id
        and nl.number < 4;


-- Q2.15

create table privacy(name, visibility default everyone);


-- Q2.16

insert into privacy(name) values (Hermish);
