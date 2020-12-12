use inclass_day2;
show tables;
CREATE TABLE `new_cricket` (
  `Player_Id` text,
  `Player_Name` text,
  `Runs` int DEFAULT NULL,
  `Popularity` int DEFAULT NULL,
  `Player_Id_[0]` text,
  `Player_Name_[0]` text,
  `Runs_[0]` int DEFAULT NULL,
  `Charisma` int DEFAULT NULL
);
INSERT INTO `new_cricket` VALUES ('PL1','Virat',50,10,'PL1','Virat',50,55),('PL2','Rohit',41,7,'PL2','Rohit',41,30),('PL3','Jadeja',33,6,'PL3','Jadeja',33,24),('PL4','Dhoni',35,15,'PL4','Dhoni',35,59),('PL6','Yadav',66,10,'PL6','Yadav',66,35),('PL8','Binny',44,11,'PL8','Binny',44,32),('PL9','Rayudu',63,12,'PL9','Rayudu',63,39),('PL5','Dhawan',45,12,NULL,NULL,NULL,NULL),('PL7','Raina',32,9,NULL,NULL,NULL,NULL),('PL10','rahane',21,10,NULL,NULL,NULL,NULL),('PL11','A. Patel',12,9,NULL,NULL,NULL,NULL),('PL12','B. Kumar',30,7,NULL,NULL,NULL,NULL);
show tables;

select * from new_cricket;






# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who # scored runs more than 50 
select Player_id,Runs,Player_Name from cricket_1 where Runs>50;


# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’. 
select * from cricket_1 where Player_Name like 'y%v';


# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’. 
select * from cricket_1 where Player_Name not like '%t';

# Q5. Write a MySQL query to create a new column PC_Ratio that contains the divsion ratio of popularity to charisma .
#(Hint :- Popularity divide by Charisma)
select * from cric_combined;
alter table cric_combined add column PC_Ratio float;
update cric_combined set PC_Ratio = Popularity/Charisma;
select * from cric_combined;

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it. 
select Player_id from cricket_1 where Player_Name like '%d%';

# Q8. Extract Player_Id and PC_Ratio where the PC_Ratio is between 0.12 and 0.25. 
select Player_id,PC_Ratio from cric_combined where PC_Ratio between 0.12 and 0.25;


-- -------------------------------------------------------- # Dataset Used: new_cricket.csv -- -------------------------------------------------------- 
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null. 
select Player_id,Player_Name,Charisma from new_cricket where Charisma is null;

# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
select Player_id,Player_Name,Charisma from new_cricket where Charisma > 25;