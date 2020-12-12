use ipl;
show tables;
# 1.Show the percentage of wins of each bidder in the order of highest to lowest percentage.
select * from IPL_BIDDING_DETAILS;
select * from IPL_BIDDER_POINTS;
select bp.BIDDER_ID, (count(bd.BID_STATUS)/bp.NO_OF_BIDS)*100
from IPL_BIDDING_DETAILS bd
right join IPL_BIDDER_POINTS bp
on bd.BIDDER_ID = bp.BIDDER_ID and bd.BID_STATUS = 'won'
group by bd.BID_STATUS;



-- select bd2.bidder_id,(count(bd1.bid_status) / bd2.no_of_bids)*100 as percentage_win
-- from ipl_bidding_details bd1 right join ipl_bidder_points bd2 on bd1.bidder_id=bd2.bidder_id
-- and bid_status= 'won' group by bd2.bidder_id order by percentage_win desc;

# 2. Display the number of matches conducted at each stadium with stadium name, city from the database.

use ipl;
show tables;
select * from IPL_TEAM;
select * from IPL_STADIUM;
SELECT * FROM IPL_MATCH;
select * FROM IPL_MATCH_SCHEDULE;

select STADIUM_NAME,CITY,count(*)
from IPL_MATCH_SCHEDULE
join IPL_STADIUM
on IPL_MATCH_SCHEDULE.STADIUM_ID = IPL_STADIUM.STADIUM_ID
group by IPL_MATCH_SCHEDULE.STADIUM_ID ;

# 3. In a given stadium, what is the percentage of wins by a team which has won the toss?
select * from ipl_match;










select stadium_id,count(im1.match_id) as no_of_matches,count(im2.match_id) as no_of_wins,
(count(im2.match_id)/count(im1.match_id))* 100 as percentage_wins
from ipl_match im1 join ipl_match_schedule ms 
on im1.match_id=ms.match_id 
left join ipl_match im2 on im1.match_id = im2.match_id and im2.toss_winner=im2.match_winner
group by stadium_id order by stadium_id;


# 4.Show the total bids along with bid team and team name.


select sum(no_of_bids),bid_team,it.team_name
from ipl_bidding_details bd join ipl_bidder_points bp on bd.bidder_id=bp.bidder_id
join ipl_team it on bd.bid_team = it.team_id
group by bid_team;

# 5. Show the team id who won the match as per the win details.
select team_id,win_details
from ipl_match join ipl_team it on ipl_match.win_details like concat('%',it.remarks,'%');


# 6.Display total matches played, total matches won and total matches lost by team along 
# with its team name.

select it1.team_id,team_name,sum(matches_played),sum(matches_won),sum(matches_lost)
from ipl_team_standings it1 join ipl_team it2 on it1.team_id= it2.team_id
group by it1.team_id;

select * from ipl_team_standings;

# 7.Display the bowlers for Mumbai Indians team.

select * from ipl_team_players where player_id=56;
select * from ipl_player where player_name like '%rohit%';  # confirmation_check

select ip.player_id,player_name
from ipl_team it join ipl_team_players tp on it.team_id=tp.team_id and it.remarks='MI'
join ipl_player ip on tp.player_id =ip.player_id and player_role='Bowler';

# 8. How many all-rounders are there in each team, Display the teams with more than 4 
# all-rounder in descending order.

select tp.team_id,team_name,count(player_role),player_role
from ipl_team_players tp join ipl_team using (team_id) where player_role like '%all%'
group by tp.team_id having count(tp.player_role)>4 order by count(tp.player_role) desc;
