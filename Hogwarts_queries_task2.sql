use hogwards;
SELECT * FROM characters;
SELECT * FROM library;


/*1.Выведите имя, фамилию персонажей и название книги, которая на них числится */
SELECT characters.fname, characters.lname, library.book_name
FROM characters
JOIN library
ON characters.char_id=library.char_id;

/*2.Выведите имя, фамилию персонажей и название книги, вне зависимости от того, есть ли у них книги или нет */
SELECT characters.fname, characters.lname, library.book_name
FROM characters
LEFT JOIN library
ON characters.char_id=library.char_id;

/*3.Выведите название книги и имя патронуса, вне зависимости от того, есть ли информация о держателе книги в таблице или нет */
SELECT characters.patronus, library.book_name
FROM characters
RIGHT JOIN library
ON characters.char_id=library.char_id;

/*4.Выведите имя, фамилию, возраст персонажей и название книги, которая на них числится, при условии, что все владельцы книг должны быть старше 15 лет */
SELECT characters.fname, characters.lname, characters.age, library.book_name
FROM characters
JOIN library
ON characters.char_id=library.char_id
WHERE characters.age>=15;

/*5.Выведите имя персонажа, название книги, дату выдачи и дату завершения, при условии, что он младше 15 лет и его патронус неизвестен */
SELECT characters.fname, library.book_name, library.start_date, library.end_date
FROM characters
JOIN library
ON characters.char_id=library.char_id
WHERE characters.age<=15 AND characters.patronus='Unknown';

/*6.Используя вложенный запрос количество книг, у которых end_date больше, чем end_date у Hermione COUNT(lib_id)*/
SELECT COUNT(end_date) FROM library
WHERE end_date>(SELECT library.end_date FROM characters
JOIN library
ON characters.char_id=library.char_id
WHERE characters.fname='Hermione');


/*7.С помощью вложенного запроса выведите имена всех патронусов, у которых владельцы старше возраста персонажа, у которого патронус Unknown */
SELECT fname, patronus 
FROM characters
WHERE characters.age>(SELECT age
FROM characters
WHERE patronus='Unknown');
 

