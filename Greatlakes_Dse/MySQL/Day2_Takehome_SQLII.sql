use inclass;
SELECT * FROM video_games;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.
select name,platform,na_sales,sum(NA_sales) over(order by platform) from video_games;

# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.
select name,Platform,na_sales,sum(NA_Sales) over(partition by genre) as genre_sales,
sum(NA_Sales) over(partition by Platform) as platform_sales,
global_sales as total_sales
from video_games order by total_sales desc;

# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.
select name,platform,row_number() over(partition by platform order by year_of_release ) from video_games;


# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). Also arrange the result in the descending order by year of release.
select name,platform,Year_of_release,
avg(global_sales) over (partition by Year_of_release ) AS 'AvgGlobalSales_Yearwise' 
from Video_Games_Sales order by Year_of_Release desc;

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 
select * from
(select name,publisher,critic_score,row_number() over(partition by publisher order by Critic_Score desc) as max_critic
from video_games ) a 
where a.max_critic<6;
-- select * from video_games;
-- select name,critic_score,publisher,row_number() over(partition by publisher order by Critic_Score desc ) abc  from video_games ;



------------------------------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
------------------------------------------------------------------------------------
# 6. Write a query that displays the opening date two rows forward i.e. the 1st row should display the 3rd website launch date
select * , lead(launch_date,2) over(order by id) as 3rd_lauch from web ;

# 7. Write a query that displays the statistics for website_id = 1 i.e. for each row, show the day, the income and the income on the first day.
select website_id,day,income,first_value(income) over(partition by website_id) as first_day_income
from website_stats
where website_id=1 ;

-----------------------------------------------------------------
# Dataset Used: play_store.csv 
-----------------------------------------------------------------
# 8. For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.
select id,name,genre,released , 
rank() over(order by str_to_date(released,'%d-%m-%Y')) as normal_rank
,dense_rank() over(order by str_to_date(released,'%d-%m-%Y')) as dense_rank1,row_number() over() from play_store;