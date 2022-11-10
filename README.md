# Pewlett-Hackard-Analysis
We have been assigned to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program using employee database. The purpose is to address the need for the new employees after a majority of employees retire and avoid the vacuum. For this we used ERD charts and SQL.

## Results
To sort data and extract relevant information from the 6 .csv files we first created ERD charts and analysed connections so we can merge needed information and create a relevant chart. 
![Screenshot (80)](https://user-images.githubusercontent.com/112904905/201189375-5c5629fb-60d1-4a6b-8fbf-8b1692512233.png)
Then we created tables using SQL, based on the requirement for the task at hand.
1. We created a table retirement_titles. This table gives us information on the titles and name of the people based on their birth date. By analyzing this data we can find out about exact positions that will be vacant after these employees retire.   
2.This chart will also help us find duplicate positions as some employees may have gotten promoted. So finding out the first occurence of the employee number eliminates the duplicates.
3. We created a mentorship eligibility table that gives us information on employees that may be ready for mentorship program.

## Summary
In total 72,458 positions/roles will vacate based on our analysis. So. these positions will have to be filled.
There are 1549 mentors that are available.
This shows that there may be a shortage of mentors as opposed to number of new employees that will need training.
