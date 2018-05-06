Find the titles of all movies directed by Steven Spielberg. 
select title from Movie where director='Steven Spielberg'
 
Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. 
select year from Movie where mID in (select mID from Rating where stars in (4,5)) order by year
 
Find the titles of all movies that have no ratings. 
select title from Movie where mID not in(select mID from Rating );
 
Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. 
select name from Reviewer where rID in (select rID from Rating where ratingDate is null)
 
Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. 
Select Reviewer.name,Movie.title,Rating.stars,Rating.ratingDate from Movie  inner join Rating  inner join Reviewer on Movie.mID=Rating.mID and Rating.rID=Reviewer.rID order by Reviewer.name,Movie.title,Rating.stars
 
 
Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.) 
 
select avg(avg1.star1)-avg(avg2.star2) from (select avg(stars) as star1 from rating join movie on rating.mID=movie.mID where Movie.year < 1980    group by Rating.mID ) as avg1,(select avg(stars) as star2 from rating join movie on rating.mID=movie.mID where Movie.year > 1980 group by Rating.mID) as avg2  
 
 
SELECT (director||title), stars from movie,rating,(select m1.mID AS mid1 from movie m1,movie m2,where m1.director=m2.director WHERE ) as t where t.mID1=movie.mID  