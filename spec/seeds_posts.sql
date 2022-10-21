TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, view_number) VALUES ('My day', 'I have had a good day', '7');
INSERT INTO users (title, content, view_number) VALUES ('Work', 'I went to work today', '40');