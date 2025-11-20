
    SELECT * FROM movie2
    -> UNION
    -> SELECT * FROM movie;

    SELECT books2.title, authors.name
    -> FROM books2
    -> JOIN authors ON books2.author_id = authors.id;


    SELECT *
    -> FROM books
    -> WHERE title LIKE '%e%';

    SELECT * FROM books
    -> ORDER BY parution_date ASC
    -> LIMIT 3;

    SELECT * FROM books
     -> WHERE parution_date>=1950
     -> AND parution_date<=2000;

    SELECT * FROM books
    -> ORDER BY parution_date DESC;

   ALTER TABLE books
    -> CHANGE COLUMN bookname title TEXT;

SELECT author FROM books;

SELECT * FROM books;