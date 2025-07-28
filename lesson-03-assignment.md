1.	What tables do you need to add? Decide on table names and their associations to each other and any existing tables/models.
-	Tables needed to add are:
	 1)topics and 2) Join-table(lesson_topics)
-	Join-table(lesson_topics) needed to connect topics and lessons
-	Many-to-many associations
-	existing tables/models is lessons


2.	What columns are necessary for the associations you decided on?
- To implement a many-to-many relationship between lessons and topics, we need to create a join table (lesson_topics) that stores the associations.
-columns necessary in join table  (lesson_topics) are 1)topic_id , 2)lesson_id ( with foreign key reference) 
-and in topics table , columns needed are id (integer) and title (string which the topic name like debugging)
3.	What other columns (if any) need to be included on the tables? What other data needs to be stored?
-only columns needed are 1)topics table  (id, title) and 2) Join-table(lesson_topics):topic_id and lesson_id
-no other columns needed


4.	Write out each table's name and column names with data types.
-	For topics table:
1)id: integer (added automatically by rails)
2)title:string name like :SQL
3)created_at: datetime added automatically by rails
4)updated_at: datetime added automatically by rails

-For join table(lesson_topics)
1)id: integer (added automatically by rails)
2)lesson_id: integer (t.references :lesson)
3)topic_id: integer (t.references :topic)
4)created_at: datetime added automatically by rails
5)updated_at: datetime added automatically by rails


5.	Determine the generator command you'll need to create the migration file and run the command to generate the empty migration file. Start with just the topics migration. (Hint: your filename should be create_topics)
- bin/rails generate migration create_topics

6.	Now determine the generator command you'll need to create the migration file for the join table. Don't forget that it should begin with create_ and be followed by the table name.
- bin/rails generate migration create_lesson_topics

