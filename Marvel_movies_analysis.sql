select title,release_year from movies where studio="Marvel Studios"
select * from movies where title like "%Avengers%"
select release_year from movies where title="The Godfather"
select distinct studio from movies where industry="Bollywood"
select * from movies where imdb_rating>=9
select title,imdb_rating from movies where imdb_rating between 6 and 8
select * from movies where release_year in(2018,2019,2020) and industry="Bollywood"
select * from movies where studio in("Marvel Studios","salman khan films")
select * from movies where imdb_rating is null
select * from movies where industry="bollywood" order by imdb_rating
select * from movies where industry="bollywood" order by imdb_rating desc
select * from movies where industry="bollywood" order by imdb_rating desc limit 5
select * from movies order by release_year desc
select * from movies where release_year=2022
select * from movies where release_year>2020
select * from movies where release_year>2020 and imdb_rating>8
select * from movies where release_year>2020 and imdb_rating>8
select * from movies where studio in ("Marvel Studios","Hombale Films")
select * from movies where title like"%Thor%" order by release_year desc
select count(*) from movies where studio!="Marvel Studios"
select max(imdb_rating) as max_rating from movies where studio="Marvel Studios"
select round(avg(imdb_rating),2) as avg_rating from movies where industry="Bollywood"
select count(*) from movies where industry="Hollywood"
select industry, count(*) as count from movies group by industry 
select studio, count(*) as count from movies group by studio order by count desc
select studio, count(*)as cnt,round(avg(imdb_rating),2) as avg_rating from movies where studio!="" group by studio order by avg_rating desc
select count(*) as count from movies where release_year between 2015 and 2022
select max(release_year) as max_release, min(release_year) as min_release from movies
select release_year, count(*)as count from movies group by release_year order by release_year desc
select *, year(curdate())-birth_year as age from actors
select *, if(currency="USD",revenue*80,revenue) as revenue_inr from financials
select  *, 
case
 when unit="thousands" then revenue/1000
 when unit="billions" then revenue*1000
 when unit="Millions" then revenue
 end as revenue_mln
 from financials;
 
 select  *, 
case
 when unit="thousands" then budget/1000
 when unit="billions" then budget*1000
 when unit="Millions" then budget
 end as budget_mln
 from financials;
 
select *,
(revenue-budget) as profit,
(revenue-budget)*100/budget as profit_prct
from financials


select title,name from movies 
join languages
on movies.language_id=languages.language_id

select title,name from movies m
join languages l
on m.language_id=l.language_id
where name="Telugu"

select name,count(*) as count from languages l
join movies m
on l.language_id=m.language_id
group by name

select title,GROUP_CONCAT(name SEPARATOR ', ') as actor_name from movies m
join movie_actor ma
on m.movie_id=ma.movie_id
join actors a on a.actor_id=ma.actor_id
group by title






select title,revenue,currency,unit,
CASE 
					WHEN unit="Thousands" THEN ROUND(revenue/1000,2)
			WHEN unit="Billions" THEN ROUND(revenue*1000,2)
					ELSE revenue 
			END as revenue_mln
from movies m
join financials f 
on m.movie_id=f.movie_id
join languages l
on l.language_id=m.language_id
where name="Hindi"

select * from movies
where imdb_rating in ((select max(imdb_rating) from movies),
(select min(imdb_rating) from movies))

select * from movies
where release_year in  ((elect max(release_year) from movies),(select min(release_year)  frommovies))





SELECT * 
FROM movies 
WHERE imdb_rating > (SELECT avg(imdb_rating) FROM movies);

with actors_age as (
select 
name as actor_name,
year(curdate()) - birth_year as age 
from actors
)
select * from actors_age
where age > 70 AND age < 85 ;

select *,
(revenue-budget)*100/budget as pct_profit
from financials

select * from movies where
imdb_rating < (select avg(imdb_rating) from movies)

select * from movies
where release_year > 2000 and industry="Hollywood"

select *,
(revenue-budget) as profit
from financials

with cte as (
select title, release_year, (revenue-budget) as profit
from movies m
join financials f
on m.movie_id=f.movie_id
where release_year>2000 and industry="Hollywood"
)

select * from cte where profit >500

select max(imdb_rating)
from movies where
imdb_rating < (select max(imdb_rating) from movies)

select max(imdb_rating) from movies

