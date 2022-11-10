# Crowdfunding-ETL

This Github contains the various items for Module 8 Challenge .

### Deliverables 1 and 2 Jupyter Folder
The root directory contains the Jupyter notebook with output saved into the file.  The CSV_Files folder then contains four items:
1. backer_info.csv is our starting file provided to us
2. backers_df.csv is the output from splitting the column using the JSON method
3. backers_df_regex.csv is the output from splitting the column using the regex method
4. backers.csv is the final output from the cleanup to load into the SQL database

Note that it didn't specify in the Jupyter notebook that we should have output the CSV file without the index in order to avoid errors during the SQL load.  The original output did include a headerless column with the Pandas indexing.  I manually deleted this from the file before loading into the SQL in Deliverable 3.


### Deliverable 3 Folder
This folder contains two items:
1. The screenshot of the schema image using the web-based tool
2. The modified SQL file creating the entire set of tables and the modification statements with foreign keys


### Deliverable 4 Folder
This folder contains three items:
1. The SQL file with the four requested queries (and the two SELECT * statements to check accuracy)
2. A CSV output from the third query regarding remaining goal for initiative owners
3. A CSV output from the fourth query regarding remaining goal for backers
