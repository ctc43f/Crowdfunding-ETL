-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(backer_id) AS backers_count
FROM backers
GROUP BY cf_id
ORDER BY backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT 
contacts.first_name, contacts.last_name, contacts.email,
campaign_temp.Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
FROM
(
SELECT contact_id, (goal - pledged) AS Remaining_Goal_Amount
FROM campaign
WHERE goal > pledged AND outcome = 'live') campaign_temp

LEFT JOIN
contacts
ON campaign_temp.contact_id = contacts.contact_id
ORDER BY campaign_temp.Remaining_Goal_Amount DESC
;



-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

--Note that the image in the challenge to which we were supposed to compare our output is NOT sorted in email descending.
--It is sorted by last name and then first name a to z.  Otherwise the email addresses wouldn't start with s,j,m,m,v as they do.
--If you wanted to modify the below to do what the question is asking, replace the ORDER BY clause with ORDER BY backers.email DESC

SELECT 
backers.email, backers.first_name, backers.last_name, backers.cf_id,
campaign_temp.company_name, campaign_temp.description, campaign_temp.end_date, campaign_temp.Left_Of_Goal
INTO email_backers_remaining_goal_amount
FROM
(
SELECT *, (goal - pledged) AS Left_Of_Goal
FROM campaign
WHERE goal > pledged AND outcome = 'live') campaign_temp

LEFT JOIN
backers
ON campaign_temp.cf_id = backers.cf_id
ORDER BY backers.last_name, backers.first_name  --See above note, the image in the assignment isn't sorted by email
;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

